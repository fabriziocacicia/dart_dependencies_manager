import 'package:get_it/get_it.dart';

typedef DependencyFactory<T extends Object> =  Future<T> Function();

/// Manages all the dependencies of the applications.
/// It can `register` a new dependency and then `retrieve` it to who needs it.
/// All of its methods are static so it is not needed to have an instance of it
/// to use it, in fact it is not even possible to do it since it is implemented
/// as an abstract class.
abstract class DependenciesManager {
  /// Register a lazy singleton in the dependencies container.
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

  static void registerSingletonAsync<T extends Object>(
      DependencyFactory<T> factoryFunction) {
    if (!GetIt.I.isRegistered<T>()) {
      GetIt.I.registerSingletonAsync<T>(factoryFunction);
    }
  }

  /// Retrieve an instance of an object of type [T] that must have been
  /// previously registered.
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
