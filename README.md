# Kalshi

Welcome to Kalshi Financial Wellness Test!

## Introdution



## Commands

```shell
# Create new package
flutter create --template=package example

# Run app from terminal
flutter run --flavor qa -t app/lib/main_qa.dart
flutter run --flavor qa -t app/lib/main_prod.dart

# Build QA App
flutter build apk --release --flavor qa -t app/lib/main_qa.dart

# Build PROD App
flutter build apk --release --flavor prod -t app/lib/main_prod.dart
```

## How to create a Feature?

# Run the script passing the parameter with the name of the feature:

```shell
./create_feature.sh feature_name
```

## How to create a Service?

# Run the script passing the parameter with the name of the service:

```shell
./create_service.sh service_name
```