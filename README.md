
<div align="center">
<img width="400" alt="Marketplace App Icon" src="https://github.com/user-attachments/assets/c86432f7-bfad-412f-b598-4adab6f86983" />
</div>

# Marketplace 🛒 (Flutter)

A **Flutter marketplace application** for managing products, built with **Provider** for state management and backed by **Firebase Realtime Database** via REST API.

This project focuses on CRUD operations, form handling, image uploads, and clean state-driven UI.

---

## 📱 Overview

<div align="center">
<img width="400" alt="Simulator Screenshot - iPhone 16 Pro - 2025-12-18 at 22 48 47" src="https://github.com/user-attachments/assets/848341cd-e861-4ad0-b0eb-826b67ef0120" />
</div>

**Marketplace** allows users to:
- Browse a list of products
- Create and edit products
- Upload images for each product
- Validate forms before submission
- See loading and saving indicators for better UX

<div align="center">
<img width="300" alt="Simulator Screenshot - iPhone 16 Pro - 2025-12-18 at 22 48 51" src="https://github.com/user-attachments/assets/73d4884d-dcd3-456c-8da0-1ab9556585dc" />
</div>

The app was built to practice:
- State management with Provider
- REST-based Firebase integration
- Form validation patterns
- Clean Flutter project structuring

---

## 🛠️ Tech Stack

- **Flutter (Dart)** — cross-platform UI framework  
- **Provider** (`ChangeNotifier`) — state management  
- **Firebase Realtime Database** — backend (REST API)  
- **HTTP** (`package:http`) — network requests  

---

## 🧠 Architecture Overview

The app follows a **clean, modular structure**:

```text
lib/
 ├─ models/        # Data models (e.g., Product)
 ├─ providers/     # State & form providers (e.g., LoginFormProvider)
 ├─ screens/       # UI screens (Loading, Login, Product screens)
 ├─ services/      # API & backend services (ProductsService)
 ├─ themes/        # App theming (AppTheme)
 └─ main.dart
```

### Key Concepts

- **Provider** manages application state and form logic
- **Services layer** handles all Firebase REST communication
- **Models** represent strongly-typed product data
- **Screens** remain UI-focused and reactive

---

## 🔥 Features

- Product listing (read)
- Product creation & editing (create/update)
- Image upload support
- Form validation using `GlobalKey<FormState>`
- Loading & saving indicators
- Firebase Realtime Database integration
- Clean separation of concerns

---

## 🚀 Getting Started

### Prerequisites

- **Flutter SDK** (stable channel)
- iOS / Android toolchains:
  - Xcode (iOS)
  - Android Studio (Android)
- A **Firebase project** with **Realtime Database enabled**

---

## ⚙️ Configuration

The app targets a Firebase Realtime Database host such as:

```text
flutter-example-rtdb.firebaseio.com
```

> This identifier is **not a secret**.

### Update the backend URL

You can change the database URL in:

```text
lib/services/products_service.dart
```

```dart
final String _baseUrl = 'your-database-url';
```

💡 For multiple environments, consider:
- A small config wrapper
- Compile-time variables (`--dart-define`)

---

## 🔐 Environment & Secrets

⚠️ **Do NOT commit secrets to GitHub**

This repository is configured to ignore common sensitive files:

- **Android**
  - `android/app/google-services.json`
- **iOS**
  - `ios/Runner/GoogleService-Info.plist`
- **Keys & certificates**
  - `*.pem`, `*.p12`, `*.jks`, `*.keystore`, `*.mobileprovision`
- **Environment files**
  - `.env`, `.env.*`, `*.env*`


---

## ▶️ Install & Run

```bash
flutter pub get
flutter run
```

Use the device selector in your IDE or:

```bash
flutter run -d <deviceId>
```

---

## 🧹 Formatting, Linting & Tests

```bash
# Format code
flutter format .

# Static analysis
flutter analyze

# Run tests
flutter test
```

---

## 📦 Build & Release

- **Android**
  - Build APK/AAB via Android Studio
- **iOS**
  - Archive and distribute using Xcode

⚠️ Keep **signing keys and provisioning profiles out of version control**.

---

## 🛠️ Troubleshooting

### After pulling changes
```bash
flutter pub get
```

If needed:
```bash
flutter clean
flutter pub get
```

### iOS code signing issues
- Verify team and provisioning profiles in Xcode

### Firebase network errors
- Confirm Realtime Database URL
- Check database security rules
- Ensure device/emulator has internet access

---

## 💡 Future Improvements

- Authentication & user accounts
- Product deletion
- Categories & filtering
- Pagination & caching
- Cloud Storage image hosting
- Admin vs user roles

---

<div align="center">
Made with ❤️ using Flutter, Provider & Firebase
</div>
