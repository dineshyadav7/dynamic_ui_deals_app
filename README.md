# Dynamic UI Deals App

Welcome to the **Dynamic UI Deals App**! This mobile app, built with Flutter, demonstrates how to dynamically change the order of sections on the screen without the need to update the app itself. This app is a proof of concept (POC) to show how we can provide flexibility to the user interface by managing it via backend changes.

---

## Key Features

- **Dynamic UI:** The app allows you to change the layout and order of content sections (like banners, deals, and offers) based on data from the backend. No need for app updates—just update the content in the backend, and it will reflect in the app instantly.
- **Firebase Integration:** The app uses Firebase to store and retrieve data, including Cloud Firestore for structured data storage and Firebase Storage for media.
- **Performance Optimization:** The `cached_network_image` package ensures smooth image loading and caching for better performance.
- **Real-Time Data Updates:** With Firebase Firestore, the content updates in real time, providing a seamless user experience.
- **Snackbars for Feedback:** The app uses animated snackbars to provide better visual feedback to users.

---

## Getting Started

### Prerequisites

Before you begin, make sure you have the following:

1. **Flutter SDK** (version 3.5.3 or higher).
2. **Firebase Project** set up for using Cloud Firestore and Firebase Storage.

### Firebase Setup

1. Create a Firebase project in the [Firebase Console](https://console.firebase.google.com/).
2. Set up Firebase for your Flutter app by adding the necessary configuration files for both Android and iOS.
3. Enable Firebase Firestore and Firebase Storage in your Firebase Console to store and manage content.

---

### Installation Steps

1. **Clone the Repository**:

   ```bash
   git clone https://github.com/yourusername/dynamic_ui_deals_app.git
   ```

2. **Navigate to the Project Directory**:

   ```bash
   cd dynamic_ui_deals_app
   ```

3. **Install Dependencies**:

   ```bash
   flutter pub get
   ```

4. **Configure Firebase**:

   Follow the instructions in the [FlutterFire documentation](https://firebase.flutter.dev/docs/overview) to integrate Firebase with your project.

5. **Run the App**:

   ```bash
   flutter run
   ```

---

## How It Works

The app fetches data from Firebase Firestore to build the UI dynamically. Sections such as "Deals," "Banners," and "Offers" are defined in Firestore and can be reordered without making any changes to the app itself. This flexibility allows the backend to control how content is presented.

When you launch the app, it queries Firestore for the sections to display, and the UI is built dynamically based on the data structure retrieved. You can modify the order, layout, or even the content from Firestore at any time, and the app will reflect those changes immediately.

---

## Important Notes

For security reasons, certain sensitive files have been removed from this repository. These files need to be provided by you in order to run the app with your own Firebase setup. The following sections have been excluded:

- **.fvm**: This contains the Flutter version manager files and is specific to your local development environment.
- **android/app/google-services.json**: The Firebase configuration file for Android. You can get this from your Firebase project setup.
- **lib/firebase_options.dart**: This file contains the Firebase options necessary to connect your app to Firebase.
- **firebase.json**: Configuration for Firebase Hosting (if you are using Firebase Hosting).

### Steps to Set Up Firebase with Your Own Project

1. **Install FlutterFire CLI**:
   You will need the [FlutterFire CLI](https://firebase.flutter.dev/docs/cli) to set up Firebase configuration.

   First, install the FlutterFire CLI:

   ```bash
   dart pub global activate flutterfire_cli
   ```

2. **Configure Firebase with the FlutterFire CLI**:
   Run the following command to set up Firebase for your Flutter app:

   ```bash
   flutterfire configure
   ```

   This will guide you through linking your Firebase project and generating the necessary configuration files (`google-services.json` for Android, `firebase_options.dart` for your app, etc.).

3. **Download the Missing Files**:
   After running the FlutterFire CLI, ensure you download and include the required Firebase configuration files in your project:
   - **google-services.json**: Place it under `android/app/`.
   - **firebase_options.dart**: Place it in `lib/` where it will be automatically recognized by Firebase.
   - **firebase.json**: If using Firebase Hosting, download and place it in the root of your project.

Once these files are properly configured, you can run the app as expected.

---

## Dependencies

### Core Dependencies:

- **flutter**: The Flutter SDK for building the app.
- **intl**: For internationalization support, such as date formatting.
- **flutter_bloc**: A state management package to manage the app's state.
- **firebase_core**: Required for integrating Firebase services with Flutter.
- **cupertino_icons**: Provides iOS-style icons.
- **cloud_firestore**: Firebase Firestore for cloud-based data storage.
- **firebase_storage**: For managing media content such as images or videos in Firebase.
- **animated_snack_bar**: Adds animated snackbars for better user interactions.
- **cached_network_image**: Helps load and cache images from the network.

### Development Dependencies:

- **flutter_test**: For unit testing and widget testing the app.
- **flutter_lints**: To provide linting rules for maintaining high code quality.

---

## Example Use Case

Let’s say the app has different sections like "Deals," "Featured Offers," and "Banners." Each section's content (images, texts, etc.) is managed in Firestore. When you open the app, it loads these sections in a predefined order from Firestore.

If you need to change the order or content, you just modify the Firestore data, and the app will reflect those changes immediately. No need for an app update or new release!

---

## Contributing

We welcome contributions to this project! If you would like to contribute, please follow these steps:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-name`).
3. Make your changes and commit them (`git commit -am 'Add new feature'`).
4. Push your changes (`git push origin feature-name`).
5. Open a pull request.

---

## License

This project is not licensed.

---

## Acknowledgments

- **Firebase** for providing the backend services (Firestore, Storage).
- **Flutter** for making app development fast and efficient.
- To all contributors and the open-source community for making this possible.

Feel free to open an issue if you need help or have suggestions. Enjoy building with Flutter!
