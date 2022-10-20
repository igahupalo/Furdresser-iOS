//
//  AppointmentsModels.swift
//  Furdresser
//
//  Created by Iga Hupalo on 24/05/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//  https://github.com/HelmMobile/clean-swift-templates
//
//  Type "usecase" for some magic!

import UIKit

struct AppointmentsScene {
    struct FetchAppointments {

        struct Response {
            var groupedUserAppointments: [(Date, [Appointment])]
            var groupedAllAppointments: [(Date, [Appointment])]?
        }

        struct ViewModel {
            struct DisplayedAppointment {
                var image: UIImage?
                var time: String
                var petName: String
                var ownerName: String
                var weight: String
                var age: String
                var workerName: String? = nil
                var workerColor: UIColor? = nil
            }

            var userSectionHeaders: [String]
            var userSectionedAppointments: [[DisplayedAppointment]]
            var allSectionHeaders: [String]?
            var allSectionedAppointments: [[DisplayedAppointment]]?
        }
    }

    struct SetSelectedAppointment {
        struct Request {
            var indexPath: IndexPath
        }
    }

    struct ProvideDisplayMode {
        struct Response {
            var role: UserRole
        }

        struct ViewModel {
            enum DisplayMode {
                case manager
                case groomer
            }

            var displayMode: DisplayMode
        }
    }
}
