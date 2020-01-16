import 'package:get_it/get_it.dart';
import 'package:taqspalestine/Providers/CitiesProviders.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => CitiesProvider());
}
