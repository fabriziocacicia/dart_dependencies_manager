Dependencies Manager

## Overview
Dependencies Manager provides a simple API to register and retrieve
dependencies hiding the choice of the actual package used under the 
hood.

It exists just to provide an interface that is less-likely to change
handling the wiring between the actual dependency injection package
and the application.

## Usage

A simple usage example.

#### Register a dependency

```dart
import 'package:dart_dependencies_manager/dart_dependencies_manager.dart';

final dependencyToRegister = MyCustomDependency();

DependenciesManager.registerLazySingleton<MyCustomDependency>(dependencyToRegister);
```

#### Retrieve a dependency

```dart
import 'package:dart_dependencies_manager/dart_dependencies_manager.dart';

final retrievedDependency = DependenciesManager.retrieve<MyCustomDependency>();
```
