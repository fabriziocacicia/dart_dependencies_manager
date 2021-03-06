import 'package:dart_dependencies_manager/dart_dependencies_manager.dart';

class RootDependency {
  final int num;

  RootDependency(this.num);
}

class ChildDependency {
  final RootDependency rootDependency;

  ChildDependency(this.rootDependency);
}

Future<void> main() async {
  DependenciesManager.registerAsync<ChildDependency>(() async =>
      ChildDependency(
          await DependenciesManager.retrieveAsync<RootDependency>()));
  DependenciesManager.registerAsync<RootDependency>(
      () async => RootDependency(0));

  final child = await DependenciesManager.retrieveAsync<ChildDependency>();

  print(child.rootDependency.num);
}
