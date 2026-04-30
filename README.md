# 🛒 AtlasMart - Modern E-Commerce Ecosystem

AtlasMart is a feature-rich, multi-role e-commerce application built with Flutter. It provides a seamless shopping experience for customers and a robust management portal for administrators, all within a single high-performance mobile application.

## 🏗 Architecture
The project is built using **Clean Architecture** and **Domain-Driven Design (DDD)** principles. This ensures the codebase is scalable, maintainable, and highly testable.

### Layers:
- **Domain**: Pure business logic, entities, and service interfaces. Zero dependencies on external frameworks.
- **Infrastructure**: Implementation of services, API data sources (Dio), and DTOs.
- **Application**: State management using the **BLoC** pattern, coordinating data between Domain and UI.
- **Presentation**: Stunning UI built with Flutter widgets, following a modular design system.

---

## ✨ Key Features

### 👤 Customer Features
- **Seamless Authentication**: Secure login/signup with OTP verification and password recovery.
- **Dynamic Shopping**: Browse products with advanced search, category filtering, and real-time inventory updates.
- **Cart & Checkout**: Intuitive cart management with integrated **Razorpay** gateways.
- **Order Tracking**: Detailed order history and status tracking with PDF invoice generation.
- **Push Notifications**: Real-time alerts for order updates and promotions via Firebase Cloud Messaging (FCM).

### 🛠 Admin Features
- **Insightful Dashboard**: Real-time statistics on total sales, revenue, users, and orders.
- **Inventory Control**: Comprehensive product management (Add/Edit/Delete) with multi-image support.
- **Order Management**: Track and update order statuses (Processing, Shipped, Delivered) to keep customers informed.
- **User Management**: View and manage customer accounts.
- **Broadcast Notifications**: Compose and send push notifications to all users or specific segments.

---

## 🛠 Tech Stack
- **Framework**: [Flutter](https://flutter.dev)
- **State Management**: [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- **Data Modeling**: [Freezed](https://pub.dev/packages/freezed) (Immutable classes & Unions)
- **Dependency Injection**: [GetIt](https://pub.dev/packages/get_it)
- **Networking**: [Dio](https://pub.dev/packages/dio) with custom interceptors
- **Backend Services**: Firebase (Messaging, Crashlytics, Core)
- **Payments**: Razorpay & Stripe SDKs
- **Storage**: Flutter Secure Storage

---

## 📁 Project Structure
```text
lib/
├── application/      # BLoC logic (Events, States)
├── domain/           # Entities & Service Interfaces
├── infrastructure/    # API Services & Model DTOs
├── presentation/     # UI Screens & Shared Widgets
└── main.dart         # App entry point & DI setup
```

