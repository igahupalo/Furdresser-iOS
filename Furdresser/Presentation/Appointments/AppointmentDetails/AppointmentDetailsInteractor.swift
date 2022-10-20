//
//  AppointmentDetailsInteractor.swift
//  Furdresser
//
//  Created by Iga Hupalo on 24/05/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates

import Foundation

protocol AppointmentDetailsInteractorInput {
    
}

protocol AppointmentDetailsInteractorOutput {
    func presentFetchedAppointment(response: AppointmentDetailsScene.FetchAppointmentDetails.Response)
    func toggleTaskButton(response: AppointmentDetailsScene.ToggleTask.Response)
    func makeCall(response: AppointmentDetailsScene.MakeCall.Response)
    func closeAppointmentDetails()
    func sendMessage(response: AppointmentDetailsScene.SendMessage.Response)
}

protocol AppointmentDetailsDataSource {
    
}

protocol AppointmentDetailsDataDestination {
    
}

class AppointmentDetailsInteractor: AppointmentDetailsInteractorInput, AppointmentDetailsDataSource, AppointmentDetailsDataDestination {
    
    var output: AppointmentDetailsInteractorOutput?
    var appointment: Appointment?
    
    // MARK: Business logic
    
    func fetchAppointmentDetails() {
        let appointmentsWorker = AppointmentsWorker()
        if let appointmentId = appointment?.id {
            appointmentsWorker.fetchAppointmentDetails(appointmentId: appointmentId) { [weak self] appointmentsDetails in
                if let appointmentsDetails = appointmentsDetails,
                   let appointment = self?.appointment {
                    appointment.setDetails(details: appointmentsDetails)
                    let response = AppointmentDetailsScene.FetchAppointmentDetails.Response(appointment: appointment)
                    self?.output?.presentFetchedAppointment(response: response)
                }
            }
        }
    }

    func toggleTask(request: AppointmentDetailsScene.ToggleTask.Request) {
        let appointmentsWorker = AppointmentsWorker()
        if let task = appointment?.package?.tasks[request.index],
           let taskId = task.id,
        let appointmentId = appointment?.id {
            let isCompleted = !(task.isCompleted)
            appointmentsWorker.setTaskIsCompleted(appointmentId: appointmentId, taskId: taskId, isCompleted: isCompleted) { [weak self] isSuccessful in
                if isSuccessful {
                    task.isCompleted.toggle()
                    let response = AppointmentDetailsScene.ToggleTask.Response(index: request.index)
                    self?.output?.toggleTaskButton(response: response)
                }
            }
        }
    }

    func makeCall() {
        if let phoneNumber = appointment?.phoneNumber {
            let response = AppointmentDetailsScene.MakeCall.Response(phoneNumber: phoneNumber)
            output?.makeCall(response: response)
        }
    }

    func sendMessage(request: AppointmentDetailsScene.SendMessage.Request) {
        if let phoneNumber = appointment?.phoneNumber,
           let petName = appointment?.name {
            let response = AppointmentDetailsScene.SendMessage.Response(petName: petName,
                                                                        phoneNumber: phoneNumber,
                                                                        messageType: request.messageType,
                                                                        minutes: request.minutes)
            output?.sendMessage(response: response)
        }

    }

    func cancelAppointment() {
        let appointmentsWorker = AppointmentsWorker()
        if let appointmentId = appointment?.id,
           let workerId = appointment?.workerId {
            appointmentsWorker.setAppointmentIsActive(appointmentId: appointmentId, workerId: workerId, isActive: false) { [weak self] isSuccessful in
                if isSuccessful {
                    self?.output?.closeAppointmentDetails()
                }
            }
        }
    }
}
