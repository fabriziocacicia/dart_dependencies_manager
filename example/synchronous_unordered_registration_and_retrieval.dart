import 'package:dart_dependencies_manager/dart_dependencies_manager.dart';

import 'dependencies.dart';

/// In this example the dependencies are registered synchronously and not in
/// order.
/// In this case the retrieval of the [ChildDependency] fails because it needs
/// the [RootDependency] in order to successfully register the child one.
void main() {
  DependenciesManager.register<ChildDependency>(ChildDependency(DependenciesManager.retrieve<RootDependency>()));
  DependenciesManager.register<RootDependency>(RootDependency(9));

  final childDependency = DependenciesManager.retrieve<ChildDependency>();

  print(childDependency.rootDependency.num);
}