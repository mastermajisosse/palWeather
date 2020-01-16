import 'package:provider/provider.dart';
import 'package:taqspalestine/Providers/CitiesProviders.dart';
import 'package:taqspalestine/Utils/locator.dart';

List<SingleChildCloneableWidget> providerss = [
  ChangeNotifierProvider.value(value: locator<CitiesProvider>()),
  // ChangeNotifierProvider(builder: (context) => locator<CitiesProviders>()),
];
