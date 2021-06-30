class DependencyNotFoundException implements Exception {
  final String message;

  DependencyNotFoundException({required final this.message});
}