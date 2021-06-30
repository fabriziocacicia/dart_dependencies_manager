import 'package:get_it/get_it.dart';

typedef DependencyFactory<T extends Object> =  Future<T> Function();

/// Manages all the dependencies of the applications.
/// It can `register` a new dependency and then `retrieve` it to who needs it.
/// All of its methods are static so it is not needed to have an instance of it
/// to use it, in fact it is not even possible to do it since it is implemented
/// as an abstract class.
abstract class DependenciesManager {
  /// Registers a lazy singleton synchronously in the dependencies container.
  /// Be sure to provide both the type [T] and the [instance].
  ///
  /// The type [T] is needed to check if there is a dependency with
  /// that type already registered.
  /// The [instance] is the one to be registered.
  static void registerLazySingleton<T extends Object>(T instance) {
    if (!GetIt.I.isRegistered<T>()) {
      GetIt.I.registerLazySingleton<T>(() => instance);
    }
  }

  /// Registers a dependency asynchronously.
  /// It could be useful when for example, its creation needs to fetch something
  /// from internet) or when it has a dependency to some other dependencies that
  /// could not be registered yet.
  /// The dependency is registered providing a [factoryFunction] that build it
  /// asynchronously.
  /// Specifying the type [T] explicitly is important to be able to check if
  /// another singleton of the same type was registered previously and avoid
  /// crashes.
  static void registerAsync<T extends Object>(
      DependencyFactory<T> factoryFunction) {
    if (!GetIt.I.isRegistered<T>()) {
      GetIt.I.registerSingletonAsync<T>(factoryFunction);
    }
  }

  /// Retrieves a dependency of type [T] synchronously.
  /// The dependency must have been previously registered and all of its own
  /// dependencies already satisfied in order to be retrieved.
  static T retrieve<T extends Object>() => GetIt.I<T>();

  static Future<T> retrieveAsync<T extends Object>() =>
      GetIt.instance.getAsync<T>();

  static Future<bool> areAllReady() => GetIt.I
      .allReady()
      .then<bool>((value) => true)
      .onError((error, stackTrace) => false);

  static Future<bool> isRegistered<T extends Object>() async {
    return GetIt.I.isRegistered<T>() ||
        await GetIt.I
            .isReady<T>(timeout: Duration(seconds: 2))
            .then<bool>((value) => true);
  }

}
