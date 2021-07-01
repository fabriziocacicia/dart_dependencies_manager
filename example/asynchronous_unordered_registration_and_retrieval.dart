import 'package:dart_dependencies_manager/dart_dependencies_manager.dart';

import 'dependencies.dart';

Future<void> main() async {
  DependenciesManager.registerAsync<ChildDependency>(() async =>
      ChildDependency(
          await DependenciesManager.retrieveAsync<RootDependency>()));
  DependenciesManager.registerAsync<RootDependency>(
      () async => RootDependency(0));

  final child = await DependenciesManager.retrieveAsync<ChildDependency>();

  print(child.rootDependency.num);
}
