import 'package:dart_dependencies_manager/dart_dependencies_manager.dart';

class Dependency {
  final int num;

  Dependency(this.num);
}

void main() {
  final dependencyToRegister = Dependency(0);

  DependenciesManager.registerLazySingleton<Dependency>(dependencyToRegister);

  final retrievedDependency = DependenciesManager.retrieve<Dependency>();

  print(retrievedDependency.num);
}
