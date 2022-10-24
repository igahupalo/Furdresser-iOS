
![Logo](/media/header.png)

# FurDresser

This is FurDresser iOS application - a compound of the multiplatform FurDresser system. 

The aim of the FurDresser project is to provide a tool for grooming salons owners, employees and clients. Project's goal is to simplify process of searching for local grooming salons, as well as scheduling appointments for pet owners. Moreover, it is supposed to facilitate communication between groomers and their customers. Project includes:
- a website for clients enabling browsing grooming salons and their offers, as well as scheduling appointments,
- an Android application for grooming salons owners allowing menagement of employees and their schedules,
- an iOS application for groomers working at a salon enabling appointment menagement.
The three modules are integrated and complement each other.


## App Features

The iOS application was designed with specification of groomer's responsibilities in mind. The tool is supposed to simplify appointment menagement and communication with client. Therefore, the app includes following features:

- [x] User authentication
- [x] Browsing upcoming events
- [x] Presenting appointment's details
- [x] Sending messages with predefined content to clients
- [x] Dialing clients
- [x] Menaging a list of tasks realized during appointment accoring to its type 

## Specification

- The application is a native Swift software constructed with usage of **UIKit**.
- The **Clean Architecture** approach was used to organize app code.
- Firebase Database is used to authenticate users, store data and medias.
- The app is **localized** and is available in two language versions - English (Base) and Polish.

## How to run the app?

1. Clone this repo
1. Open shell window and navigate to project folder
1. Run `pod install`
1. Open `Furdresser.xcworkspace` and run the project on selected device or simulator

## App Walkthrough

https://user-images.githubusercontent.com/56322245/197537898-b8540349-c039-49b9-bb39-84a167b3817f.mp4

## Sample account

- email: yigibet300@evilant.com
- password: 12345678

## Used third-party libraries
- Firebase - https://cocoapods.org/pods/Firebase
- JVFloatLabeledTextField - https://cocoapods.org/pods/JVFloatLabeledTextField
- IQKeyboardManagerSwift - https://cocoapods.org/pods/IQKeyboardManagerSwift
- PhoneNumberKit - https://cocoapods.org/pods/PhoneNumberKit

## TODOs
- [ ]
