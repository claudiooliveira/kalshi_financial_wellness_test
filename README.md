# Kalshi

Welcome to Kalshi Financial Wellness Test!

Hey, I recorded a video to talk a little about this project [here](https://youtu.be/ojJbVwAvHS0).
And before starting this test, I was creating a small app to show you, you can see it at [this here](https://youtu.be/vJ43DIuxOUY).

`Small note: I have created the necessary tests in the features/home package and also in the app package.`

## Introdution

Thinking of a project with an optimal structure and scalability for maintenance, I created a structure where teams can work in separate modules (packages), and I can list the benefits of this structure below. But first, let's understand the structure of the project:

```
/app            # The main application
/core           # Classes and methods that can be shared throughout the app, features and services
/design_system  # A package to provide theme management and some widgets that can be used throughout the app
/features       # Packages that represents features in the app
/services       # Packages that represents services
```

### Benefits of working with this structure

**Code organization and reuse**: Separating our app into packages allows it to be easily used and reused, we separate the tests for each specific context and we can even reuse these packages in other apps if we need to.

**Team collaboration and scalability**:  Working with separate packages allows developers to work on the same app, but on different functionalities, greatly reducing the chances of annoying conflicts that disrupt the deployment on Friday (even though we know this is not a good idea 🤣)

**Maintainability**: Separating our app into packages makes it easy to locate classes and methods, making it easier to make changes or corrections to specific parts of the code.

## App

The structure of our app is simple, in it we basically define a few important things, the flavors and also our routes:

```
/lib
  /core
  /screens
  app.dart          # Here is our MaterialApp
  base_main.dart    # Here we configure the initialization of some things, such as Firebase, PushNotifications, etc.
  main_prod.dart    # I know we didn't need flavors here, but we're talking about scalable applications, aren't we? 
                    # Well, here we invoke baseMain passing the data to the Prod environment
  main_qa.dart      # And here we invoke baseMain passing the data to the QA environment
```

## Feature

This is the standard structure of a feature (sometimes you don't need to use the whole structure):

```
/lib
  /src
    /data
    /domain         
      /models
      /repositories
    /presentation
      /cubit
      /router
      /screens
        /widgets
    package_name_feature.dart # Here we create the widget that exposes our feature
  package_name.dart           # We export the necessary feature files here
```

## Services

The structure of the services may vary depending on each service, but we will follow the most basic pattern possible:

```
/lib
  /src
    /data
    /domain         
      /models
      /repositories
    /presentation                   # If necessary
    package_name_service.dart       # Here we create the abstract class of our service
    package_name_service_impl.dart  # Here we implement our service
  package_name.dart                 # We export the necessary service files here
```

## Commands

```shell
# First run, execute this file to install the dependencies of all packages
./install_dependencies.sh

# Run app from terminal
flutter run --flavor qa -t app/lib/main_qa.dart
flutter run --flavor qa -t app/lib/main_prod.dart

# Build QA App
flutter build apk --release --flavor qa -t app/lib/main_qa.dart

# Build PROD App
flutter build apk --release --flavor prod -t app/lib/main_prod.dart
```

## How to create a Feature?

### Run the script passing the parameter with the name of the feature:

```shell
./create_feature.sh feature_name
```

## How to create a Service?

### Run the script passing the parameter with the name of the service:

```shell
./create_service.sh service_name
```