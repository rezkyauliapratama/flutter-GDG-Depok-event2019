# gdg_depok_2019_beginner

Flutter application for sharing session in GDG Depok 2019

# CODELAB - MOVIE App
This project is using framework Flutter

[![N|Solid](https://miro.medium.com/max/800/1*gH1iKXJH8T12LIqhboZWEA.png)](https://miro.medium.com/max/800/1*gH1iKXJH8T12LIqhboZWEA.png)

This project is using Uncle Bob's clean architecture approach :
  - [Uncle Bob's clean architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
  - [Clean Architecture..Dynamic parameters in UseCase](http://fernandocejas.com/2016/12/24/clean-architecture-dynamic-parameters-in-use-cases/)

# Getting started

- [Documentation Flutter](https://flutter.dev/docs)
- [Dependencies Dart](https://pub.dev/)
- [Dependencies Flutter](https://pub.dev/flutter)

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Dependency Management
Additional Dependencies that we're gonna use :

* [dio](https://pub.dev/packages/dio) - A powerful Http client for Dart, which supports Interceptors, Global configuration, FormData, Request Cancellation, File downloading, Timeout etc.
* [meta](https://pub.dev/packages/meta) - Annotations package
* [Json Serializable](https://pub.dev/packages/json_serializable) - Provides Dart Build System builders for handling JSON.
* [Shimmer](https://pub.dev/packages/shimmer) - A package provides an easy way to add shimmer effect in Flutter project

# Introduction Clean Architecture
The idea is simple: clean architecture stands for a group of practices that produce systems that are:
* Independent of Frameworks.
* Testable.
* Independent of UI.
* Independent of Database.
* Independent of any external agency.

![Clean Architecture diagram](https://raw.githubusercontent.com/android10/Sample-Data/master/Android-CleanArchitecture/clean_architecture.png)

It is not a must to use only 4 circles (as you can see in the picture), because they are only schematic but we should take into consideration the Dependency Rule: source code dependencies can only point inwards and nothing in an inner circle can know anything at all about something in an outer circle.

Here is some vocabulary that is relevant for getting familiar and understanding this approach in a better way:

* Entities: These are the business objects of the application.
* Use Cases: These use cases orchestrate the flow of data to and from the entities. Are also called Interactors.
* Interface Adapters: This set of adapters convert data from the format most convenient for the use cases and entities. Presenters and Controllers belong here.
* Frameworks and Drivers: This is where all the details go: UI, tools, frameworks, etc.

### Architectural Approach
![Architectural Approach](https://raw.githubusercontent.com/android10/Sample-Data/master/Android-CleanArchitecture/clean_architecture_layers.png)

### Architectural Reactive Approach
![Architectural Reactive Approach](https://raw.githubusercontent.com/android10/Sample-Data/master/Android-CleanArchitecture/clean_architecture_layers_details.png)

### Clean Architecture that will we use
![Clean Architecture Pattern](https://raw.githubusercontent.com/ZahraHeydari/Android-Clean-Architecture-MVVM/master/diagram.png)

# Introduction of Bloc
Its a state management system for Flutter recommended by Google developers. It helps in managing state and make access to data from a central place in your project.

![Bloc pattern for Flutter](https://miro.medium.com/max/2088/1*MqYPYKdNBiID0mZ-zyE-mA.png)
