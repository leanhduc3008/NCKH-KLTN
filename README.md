# vinasoy

A IMT Flutter mobile project.

## LEFTHOOK PRE-COMMIT

[lefthook install](https://github.com/evilmartians/lefthook/blob/master/docs/install.md)
[DOCUMENT](https://github.com/evilmartians/lefthook/blob/master/README.md)

Requried lefthook install successfull.

# 🌟 Introduction

Architectural pattern **Model–view–viewmodel (MVVM)**

1. Repository (Model)

   - Repository is class use `Model Class` according to your Response from _Web Service_ (API).
   - Dependencies `ApiService`.

2. Provider (Model)

   - Provider is class responsible for fetching the data either from the _Local Database_ or from a _Web Service_.
   - Dependencies `Repository`, `LocalStorage`

3. View Model

   - View model is class which holds all our business logic.
   - Dependencies `Repository`, `Provider`, `package:get/get.dart`

4. View

   - View is class build our user interface and the only part our users can interact directly.
   - Dependencies `ViewModel`, `package:get/state_manager.dart`

5. Binder

   - Binder is class where we can declare our dependencies and then `bind` them to the routes.
   - Dependencies `ViewModel`, `Provider`, `Repository`, `package:get/instance_manager.dart`...

# 🚀 Getting Started

## 1. Run app

```dart
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter pub run intl_utils:generate
flutter run --target="lib/main.dart" --flavor="imt" --dart-define="BASE_URL=http://192.168.100.148:2407"

```

## 2. Generate code

1. Build runner

```dart
flutter pub run build_runner build
```

2. Native splash

```dart
flutter pub run flutter_native_splash:create
```

3. Launcher icons

```dart
flutter pub run flutter_launcher_icons
```

4. Initial intl

```dart
flutter pub run intl_utils:generate
```

# 🧪 Build and Test

## 1. Andoird

```dart
flutter build appbundle --target="lib/main.dart" --flavor="imt" --dart-define="BASE_URL=http://192.168.100.148:2407"
```

## 2. IOS

```dart
flutter build ipa --target="lib/main.dart" --flavor="imt" --dart-define="BASE_URL=http://192.168.100.148:2407"
```

## 3. Test

```dart
flutter test
```
