//
//  AppointmentsWorker.swift
//  Furdresser
//
//  Created by Iga Hupalo on 27/05/2021.
//

import Firebase
import FirebaseFirestore
import FirebaseStorage

class AppointmentsWorker {
    func fetchUserAppointments(uid: String, numberOfDaysInAdvance: Int? = nil, completionHandler: @escaping ([Appointment]?) -> ()) {
        let db: Firestore = Firestore.firestore()
        var appointments: [Appointment] = []

        let currentDate = Timestamp(date: Date())
        let dispatchGroup = DispatchGroup()
        let workerRef = db.document("Salons/\(Constants.salonId)/Workers/\(uid)")

        var ref = db.collection("Salons")
            .document(Constants.salonId)
            .collection("Appointments")
            .whereField("worker_ref", isEqualTo: workerRef)
            .whereField("is_active", isEqualTo: true)
            .whereField("time_start", isGreaterThanOrEqualTo: currentDate)

        if let numberOfDaysInAdvance = numberOfDaysInAdvance {
            var dateComponent = DateComponents()
            dateComponent.day = numberOfDaysInAdvance
            let futureDate = Calendar.current.date(byAdding: dateComponent, to: Date()) ?? Date()

            ref = ref.whereField("date_start", isLessThanOrEqualTo: futureDate.timeIntervalSince1970)
        }

        ref.getDocuments { [weak self] documentSnapshots, error in
            guard error == nil else {
                print("Failed to fetch appointments: \(String(describing: error)).")
                return
            }

            documentSnapshots?.documents.forEach { document in
                let data = document.data()
                if let appointment = self?.mapDataToAppointment(data: data) {
                    appointment.id = document.documentID
                    if let imageUrl = data["image_url"] as? String {
                        dispatchGroup.enter()
                        self?.fetchAppointmentImage(imageUrl: imageUrl) { image in
                            appointment.image = image
                            appointments.append(appointment)
                            dispatchGroup.leave()
                        }
                    } else {
                        appointments.append(appointment)
                    }
                }
            }
            dispatchGroup.notify(queue: .main) {
                completionHandler(appointments)
            }
        }
    }

    func fetchAllAppointments(completionHandler: @escaping ([Appointment]?) -> ()) {
        let db: Firestore = Firestore.firestore()
        let ref = db.collection("Salons")
            .document(Constants.salonId)
            .collection("Appointments")

        let dispatchGroup = DispatchGroup()
        var appointments: [Appointment] = []

        ref.getDocuments { [weak self] documentSnapshots, error in
            guard error == nil else {
                print("Failed to fetch appointment details.")
                return
            }

            documentSnapshots?.documents.forEach { document in
                let data = document.data()
                if let appointment = self?.mapDataToAppointment(data: data) {
                    appointment.id = document.documentID
                    if let imageUrl = data["image_url"] as? String {
                        dispatchGroup.enter()
                        self?.fetchAppointmentImage(imageUrl: imageUrl) { image in
                            appointment.image = image
                            appointments.append(appointment)
                            dispatchGroup.leave()
                        }
                    } else {
                        appointments.append(appointment)
                    }
                }
            }
        }
    }

    func groupAppointmentsByDay(appointments: [Appointment]) -> [(Date, [Appointment])] {
        let type: [Date: [Appointment]] = [:]
        let groupedAppointments = appointments.reduce(into: type) { acc, cur in
            let components = Calendar.current.dateComponents([.year, .month, .day], from: cur.startDate ?? Date())
            let date = Calendar.current.date(from: components)!
            let existing = acc[date] ?? []
            acc[date] = existing + [cur]
        }

        return groupedAppointments.sorted(by: { $0.key < $1.key })
    }

    func fetchAppointmentDetails(appointmentId: String, completionHandler: @escaping (AppointmentDetails?) -> ()) {
        let db: Firestore = Firestore.firestore()
        let ref = db.collection("Salons")
            .document(Constants.salonId)
            .collection("Appointments")
            .document(appointmentId)

        ref.getDocument { documentSnapshot, error in
            guard error == nil, let document = documentSnapshot else {
                print("Failed to fetch appointment details.")
                return
            }

            if let data = document.data() {
                var appointmentDetails = self.mapDataToAppointmentDetails(data: data)
                self.fetchTasks(ref: data["package_ref"] as? DocumentReference) { tasks in
                    let packageName = data["package"] as! String?
                    appointmentDetails.package = Package(name: packageName, tasks: tasks ?? [])
                    completionHandler(appointmentDetails)
                }
            }
        }
    }

    // TODO: Temporarly task completion isn't stored in database.
    func setTaskIsCompleted(appointmentId: String, taskId: String, isCompleted: Bool, completionHandler: @escaping (Bool) -> ()) {
        let db: Firestore = Firestore.firestore()
        let ref = db.collection("Salons")
            .document(Constants.salonId)
            .collection("Appointments")
            .document(appointmentId)
            .collection("Tasks")
            .document(taskId)

        ref.updateData(["is_completed": isCompleted]) { error in
            // Uncomment when fixed.
            // guard error == nil else {
            //     completionHandler(false)
            //     return
            // }
            completionHandler(true)
        }
    }

    func setAppointmentIsActive(appointmentId: String, workerId: String, isActive: Bool, completionHandler: @escaping (Bool) -> ()) {

        setSalonAppointmentIsActive(appointmentId: appointmentId, isActive: isActive) { isSuccessful in
            if isSuccessful {
                self.setWorkerAppointmentIsActive(appointmentId: appointmentId, workerId: workerId, isActive: isActive) {
                    completionHandler($0)
                }
            } else {
                completionHandler(false)
            }
        }
    }
}

private extension AppointmentsWorker {

    func setSalonAppointmentIsActive(appointmentId: String, isActive: Bool, completionHandler: @escaping (Bool) -> ()) {
        let db: Firestore = Firestore.firestore()
        let ref = db.collection("Salons")
            .document(Constants.salonId)
            .collection("Appointments")
            .document(appointmentId)

        ref.updateData(["is_active": isActive]) { error in
            guard error == nil else {
                completionHandler(false)
                return
            }

            completionHandler(true)
        }
    }

    func setWorkerAppointmentIsActive(appointmentId: String, workerId: String, isActive: Bool, completionHandler: @escaping (Bool) -> ()) {
        let db: Firestore = Firestore.firestore()
        let ref = db.collection("Salons")
            .document(Constants.salonId)
            .collection("Workers")
            .document(workerId)
            .collection("Appointments")
            .document(appointmentId)

        ref.updateData(["is_active": isActive]) { error in
            guard error == nil else {
                completionHandler(false)
                return
            }

            completionHandler(true)
        }
    }

    func fetchTasks(ref: DocumentReference?, completionHandler: @escaping ([Task]?) -> ()) {
        var tasks: [Task] = []

        ref?.collection("Tasks").getDocuments { documentSnapshots, error in
            guard error == nil else {
                print("Failed to fetch tasks.")
                return
            }

            documentSnapshots?.documents.forEach { document in
                let data = document.data()
                let task = self.mapDataToTask(data: data)
                task.id = document.documentID
                tasks.append(task)
            }
            completionHandler(tasks)
        }
    }

    // Mark: Fetching image

    func fetchAppointmentImage(imageUrl: String, completionHandler: @escaping (UIImage?) -> ()) {
        let storage: Storage = Storage.storage()
        let ref = storage.reference(forURL: imageUrl)
        self.getImageData(ref: ref) { data in
            guard data != nil else { return }
            completionHandler(UIImage(data: data!))
        }
    }

    func getImageData(ref: StorageReference, completionHandler: @escaping (Data?) -> ()) {
        ref.getData(maxSize: 20 * 1024 * 1024) { (data, error) in
            guard error == nil, let data = data else {
                return
            }
            completionHandler(data)
        }
    }

    // MARK: Mappers

    func mapDataToAppointment(data: [String: Any]) -> Appointment {
        let name = data["pet_name"] as! String?
        let age = data["age"] as! Float?
        let weight = data["weight"] as! Float?
        let ownerName = data["owner_name"] as! String?
        let startDate = (data["time_start"] as! Timestamp?)?.dateValue()
        let endDate = (data["time_end"] as! Timestamp?)?.dateValue()

        return Appointment(name: name,
                           age: age,
                           weight: weight,
                           ownerName: ownerName,
                           startDate: startDate,
                           endDate: endDate)
    }

    func mapDataToAppointmentDetails(data: [String: Any]) -> AppointmentDetails {
        let breed = data["breed"] as! String?
        let notes = data["notes"] as! String?
        let phoneNumber = data["phone_number"] as! String?

        return AppointmentDetails(breed: breed,
                                  notes: notes,
                                  phoneNumber: phoneNumber)
    }

    func mapDataToPackage(data: [String: Any]) -> Package {
        let name = data["name"] as! String?

        return Package(name: name)
    }

    func mapDataToTask(data: [String: Any]) -> Task {
        let name = data["name"] as! String?
        let isCompleted = data["is_completed"] as! Bool?

        return Task(name: name, isCompleted: isCompleted ?? false)
    }
}
