# Pretium App

## 📖 Overview

The **Pretium App** is a Flutter application designed with **Clean Architecture** principles.
While the app currently consists of UI designs based on the existing android application *
*[Play Store](https://play.google.com/store/apps/details?id=app.pretium.finance&hl=en)

This project follows the **Domain-Layered Clean Architecture** approach, ensuring maintainability,
scalability, and separation of concerns.

---

## 🏛️ Clean Architecture Structure

This project follows the **Uncle Bob's Clean Architecture** principle, splitting the codebase into
well-defined layers:

### **1. Presentation Layer (UI & Widgets)**

- Contains UI elements built using Flutter widgets.
- Handles animations using **flutter_animate**.

This architecture ensures:
✅ **Separation of Concerns** (each layer has a single responsibility)
✅ **Scalability** (easy to add features without affecting other layers)
✅ **Testability** (independent layers allow for unit testing)

## Screenshots

## kindly follow this [link](https://drive.google.com/file/d/1y79WA23q0mOxCnUO6mRo8Yp1_tclI15o/view?usp=sharing) to see demo video of the app

|                   Splash Screen                    |                    Onboarding -1                     | 
|:--------------------------------------------------:|:----------------------------------------------------:|  
| <img src="assets/graphics/splash.png" width="500"> | <img src="assets/graphics/onboard1.png" width="500"> |

|                   Onboard - 2 Page                   |                  Onboarding -2 Page                  | 
|:----------------------------------------------------:|:----------------------------------------------------:|  
| <img src="assets/graphics/onboard2.png" width="500"> | <img src="assets/graphics/onboard3.png" width="500"> |

|                   Signup -  Page                    |                    Login  Page                    | 
|:---------------------------------------------------:|:-------------------------------------------------:|  
| <img src="assets/graphics/sign-up.png" width="500"> | <img src="assets/graphics/login.png" width="500"> |

|                   Signup - Error Page                    |                   Login - Error Page                    | 
|:--------------------------------------------------------:|:-------------------------------------------------------:|  
| <img src="assets/graphics/signup-error.png" width="500"> | <img src="assets/graphics/login-error.png" width="500"> |

|                   Forgot - Password Page                    |                    Splash  Page                    | 
|:-----------------------------------------------------------:|:--------------------------------------------------:|  
| <img src="assets/graphics/forgot-password.png" width="500"> | <img src="assets/graphics/splash.png" width="500"> |

---

## 🛠️ Major Packages Used

Here are some of the core packages used in this project:

| Package Name        | Usage                                          |
|---------------------|------------------------------------------------|
| `flutter_animate`   | Used for smooth animations throughout the app. |
| `json_serializable` | Helps with JSON parsing and data modeling.     |
| `get_it`            | Used for handling dependency injection         |

---

## 🚀 Getting Started

### **Prerequisites**

Ensure you have the following installed:

- **Flutter SDK** (latest stable version)
- **Dart** (latest version)
- **Android Studio** or **VS Code** (for development)
- **Git** (for version control)

### **Clone the Repository**

```sh
git clone https://github.com/GreatGodson/pretium
cd pretium
```

### **Install Dependencies**

```sh
flutter pub get
```

### **Run the App**

```sh
flutter run
```

For specific platforms:

```sh
flutter run -d chrome      # Run on Web
flutter run -d android     # Run on Android
flutter run -d ios         # Run on iOS (Mac required)
```

### **Analyze & Format Code**

```sh
flutter analyze  # Checks for issues in the code
flutter format . # Formats code properly
```

---

## 📂 Folder Structure

```
lib/
 ├── core/                      # Core utilities, themes, etc.
 │   ├── framework/              # App-wide utilities (navigation, colors, etc.)
 │
 ├── presentation/              # UI Layer
 │   ├── pages/                  # Screens & Pages
 │   ├── components/             # Reusable widgets
 │
 ├── main.dart                   # Entry point of the application
```

## 📧 Contact

For any questions, feel free to reach out:

- **Email**: godsongreatokezie@gmail.com
- **GitHub**: [godson](https://github.com/GreatGodson)

---

Happy Coding! 🚀📚

