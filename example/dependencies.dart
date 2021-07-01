class RootDependency {
  final int num;

  RootDependency(this.num);
}

class ChildDependency {
  final RootDependency rootDependency;

  ChildDependency(this.rootDependency);
}