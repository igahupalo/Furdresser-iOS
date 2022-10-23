//
//  AppointmentDetailsModels.swift
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

struct AppointmentDetailsScene {
    struct FetchAppointmentDetails {
        struct Response {
            var appointment: Appointment
            var appointmentDetails: AppointmentDetails
        }

        struct ViewModel {

            struct Overview {
                var appointmentImage: UIImage?
                var petName: String
                var date: String
                var time: String
                var weight: String
                var age: String
                var breed: String
                var phoneNumber: String
            }

            struct Notes {
                var notes: String
            }

            struct Package {
                var name: String
            }

            struct Tasks {
                struct DisplayedTask {
                    var id: String
                    var name: String
                    var isCompleted: Bool = false
                }

                var tasks: [DisplayedTask]
            }

            var overview: Overview
            var package: Package
            var tasks: Tasks
            var notes: Notes
        }
    }

    struct ToggleTask {
        struct Request {
            var index: Int
        }

        struct Response {
            var index: Int
        }

        struct ViewModel {
            var index: Int
        }
    }

    struct MakeCall {
        struct Response {
            var phoneNumber: String
        }

        struct ViewModel {
            var url: URL
        }
    }

    struct SendMessage {
        enum MessageType {
            case isReady
            case willBeReadyIn
        }

        struct Request {
            var messageType: MessageType
            var minutes: String?
        }

        struct Response {
            var petName: String
            var phoneNumber: String
            var messageType: MessageType
            var minutes: String?
        }

        struct ViewModel {
            var phoneNumber: String
            var message: String
        }
    }
}
