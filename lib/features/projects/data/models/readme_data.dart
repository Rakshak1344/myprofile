class ReadmeData {
  static const String flutterArchitecture = '''
# 🚀 Architected Features

## Overview
I specialize in architecting scalable, maintainable, and high-performance Flutter applications, focusing on automation, modularity, and best practices. This document outlines the key architectural decisions and technologies used in my development process.

## 🏗️ Core Architecture & Code Flow
- **[Unidirectional Data Flow](https://docs.flutter.dev/app-architecture/concepts)**: Designed a structured unidirectional data flow to ensure predictable state management and maintainability.
- **[State Management with Riverpod](https://riverpod.dev/)**: Implemented Riverpod for scalable and efficient state handling across the app.
- **[Monorepo Codebase with Melos](https://melos.invertase.dev/)**: Adopted a monorepo architecture to modularize reusable features, improving testing and code-sharing across multiple applications.
- **[Flutter Version Management with FVM](https://fvm.app/)**: Ensured all developers used the same Flutter SDK version for consistency and compatibility.

## ⚡ Performance & Code Optimization
- **[Code Templating with Mason](https://pub.dev/packages/mason)**: Reduced boilerplate code by automating feature scaffolding, significantly improving development speed.
- **[Custom Dart Lint Rules](https://dart.dev/guides/language/analysis-options)**: Enforced strict linting rules for a cleaner and more maintainable codebase.
- **[Code Generation](https://dart.dev/tools/codegen)**: Automated repetitive tasks using tools like [`json_serializable`](https://pub.dev/packages/json_serializable), [`hive_generator`](https://pub.dev/packages/hive_generator), [`freezed`](https://pub.dev/packages/freezed), [`riverpod_generator`](https://pub.dev/packages/riverpod_generator), and [`retrofit_generator`](https://pub.dev/packages/retrofit_generator).
- **[Git Hooks for CI/CD Optimization](https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks)**: Configured pre-commit and post-commit hooks to enforce best practices and automate critical checks.

## 🔌 Networking, Authentication & Data Handling
- **[Optimized Networking with Dio & Retrofit](https://pub.dev/packages/dio)**: Used Dio for efficient network requests combined with [`Retrofit`](https://pub.dev/packages/retrofit) for structured API handling.
- **[FCM for Authentication & Notifications](https://firebase.google.com/docs/cloud-messaging)**: Implemented Firebase Authentication for Google Sign-In and used dynamic FCM tokens for personalized push notifications.
- **[Local Databases for Offline Support](https://pub.dev/packages/hive)**: Integrated [`SharedPreferences`](https://pub.dev/packages/shared_preferences), [`Hive`](https://pub.dev/packages/hive), and [`Isar`](https://isar.dev/) for seamless offline access and data persistence.

## 🛠️ Testing & Debugging
- **[Integration Testing with Patrol](https://pub.dev/packages/patrol)**: Built robust integration tests using Patrol and data fixture Dart classes to simulate real-world scenarios.
- **[Performance Monitoring with Sentry](https://sentry.io/welcome/)**: Integrated Sentry to track performance metrics and production bugs, allowing rapid issue resolution and feature updates.

## 🎨 UI/UX & Multilingual Support
- **[Material 3 Theming](https://m3.material.io/)**: Designed a structured theme system to ensure a consistent design across the application.
- **[Navigation with go_router](https://pub.dev/packages/go_router)**: Implemented `go_router` for efficient declarative navigation, ensuring a smooth user experience.
- **[Multilingual Support with easy_localization](https://pub.dev/packages/easy_localization)**: Added multi-language support, plus a Python script to detect unlocalized hardcoded text and notify developers.

## 📊 Analytics & Deployment
- **[Real-time Analytics for Data-Driven Decisions](https://mixpanel.com/)**: Integrated [`Mixpanel`](https://mixpanel.com/) and [`WebEngage`](https://webengage.com/) to capture user behavior and improve product decisions based on real-time insights.
- **[Automated Deployment with Codemagic & Fastlane](https://codemagic.io/)**: Streamlined CI/CD workflows using [`Codemagic`](https://codemagic.io/), [`Fastlane`](https://fastlane.tools/), and [`GitHub Actions`](https://github.com/features/actions) for faster and more reliable releases.
  ''';
}