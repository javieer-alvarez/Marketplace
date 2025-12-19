# productos_app

A Flutter application for managing products, built with Provider for state management and backed by Firebase Realtime Database.

## Features
- Product listing, creation, and editing
- Image upload for products
- Form validation with `GlobalKey<FormState>`
- Loading and saving indicators for responsive UX
- Firebase Realtime Database integration via REST API

## Tech Stack
- Flutter (Dart)
- Provider (`ChangeNotifier`) for state management
- Firebase Realtime Database (REST)
- HTTP client (`package:http`)

## Project Structure
```
lib/
  models/            # Data models (e.g., Product)
  providers/         # Form/state providers (e.g., LoginFormProvider)
  screens/           # UI screens (e.g., LoadingScreen, Login)
  services/          # API/services (e.g., ProductsService)
  themes/            # Theming (e.g., AppTheme)
```

## Prerequisites
- Flutter SDK (stable channel)
- iOS/Android toolchains (Xcode and/or Android Studio)
- A Firebase project with Realtime Database enabled

## Configuration
- The app targets a Firebase Realtime Database host like:
  `flutter-example-rtdb.firebaseio.com` (non-secret identifier)
- You can update the base URL in `lib/services/products_service.dart` (`_baseUrl`).
- For multiple environments, consider a small config wrapper or compile-time variables.

## Environment & Secrets
- Do NOT commit secrets (service accounts, privileged API keys).
- `.gitignore` is configured to ignore common secret files:
  - Android: `android/app/google-services.json`
  - iOS: `ios/Runner/GoogleService-Info.plist`
  - Keys/Certs: `*.pem`, `*.p12`, `*.jks`, `*.keystore`, `*.mobileprovision`
  - Env files: `.env`, `.env.*`, `*.env*`
- Optional hardening:
  - Add a pre-commit hook with `detect-secrets` or `gitleaks`
  - Enable GitHub “Secret Scanning” and “Push Protection”

## Getting Started
```bash
flutter pub get
flutter run
```
Use the device selector in your IDE or `-d <deviceId>` to choose a target.

## Formatting, Linting, and Tests
```bash
# Format
flutter format .

# Static analysis
flutter analyze

# Unit/widget tests
flutter test
```

## Build & Release
- Android: Build/sign APK/AAB via Android Studio.
- iOS: Archive and distribute with Xcode. Keep signing keys and provisioning profiles out of version control.

## Troubleshooting
- After pulling changes:
  - `flutter pub get`
  - If needed: `flutter clean && flutter pub get`
- iOS code signing:
  - Verify team and provisioning in Xcode.
- Firebase network errors:
  - Confirm the Realtime Database URL and security rules
  - Ensure device/emulator has internet access

## License
MIT (or your preferred license)
# Marketplace
