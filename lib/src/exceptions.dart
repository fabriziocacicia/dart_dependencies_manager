/// The exception thrown when a dependency is not found during a request to
/// retrieve it.
class DependencyNotFoundException implements Exception {
  /// The error message.
  final String message;

  /// Creates a [DependencyNotFoundException] with an associated error [message].
  DependencyNotFoundException({required final this.message});

  String get _parsedGetItAssertionErrorMessage {
    final splittedMessage = message.split(' ');
    final indexOfType = splittedMessage.indexOf('type');
    return splittedMessage[indexOfType + 1];
  }

  @override
  String toString() => "DependencyNotFoundException: "
      "$_parsedGetItAssertionErrorMessage not found.\nCheck if you forgot "
      "to register it or if you need to retrieve it asynchronously.";
}
