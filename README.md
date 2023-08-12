# Flooz Challenge Wallet App

An application aimed at emulating the login interface of the Flooz wallet application.

This Flutter application demonstrates a simple implementation of state management using the BLoC (Business Logic Component) pattern. 
The application follows the BLoC pattern to manage user data, validate pin codes, and navigate between screens.

## Features

1. **User Data Management**: Collects user's name and email, validating them before proceeding.
2. **Pin Code Validation**: Validates a pin code based on specific criteria.
3. **Navigation**: Navigates between screens based on user input and pin code validation.
4. **Simplified State Management**: Utilizes the latest version of the `bloc` library, focusing on the BLoc pattern for streamlined state management.

## Prerequisites

Before running the application, please make sure you have the following installed on your machine:

- Flutter SDK: [Installation Guide](https://flutter.dev/docs/get-started/install)
- Dart SDK: [Installation Guide](https://dart.dev/get-dart)
- My local version (Flutter 3.7.12, Dart 2.19.6)

## Getting Started

To get started with the application, follow these steps:

1. Clone the repository to your local machine:
    - git clone https://github.com/theakanfecode1/flooz_challenge.git

2. Navigate to the project directory:
    - cd flooz_challenge

3. Install the dependencies:
    - flutter pub get

4. Run the application:
    - flutter run

This will launch the application on an available emulator or connected device.


## Running Tests

The application includes unit tests to ensure the functionality is working correctly. To execute the
tests, follow these steps:

1. Navigate to the project directory if you're not already there:
   - cd flooz_challenge

2. Run the tests:
   - run flutter test --coverage --test-randomize-ordering-seed random


## Additional Configuration

If you encounter any issues running the application or the tests, you can try the following steps:

- Check that your Flutter and Dart SDK versions are compatible with the project. You can use the
  following commands to verify:
  flutter --version
  dart --version

If you need any further assistance or have any questions, please feel free to reach out to me at
danielogundiranakanfe@gmail.com.

Enjoy using the Flooz Challenge Wallet App!



