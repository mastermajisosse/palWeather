import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taqspalestine/Utils/MyColo.dart';
import 'package:taqspalestine/Utils/Taqs.dart';
import 'package:taqspalestine/Utils/localNotif.dart';
import 'package:taqspalestine/Utils/locator.dart';
import 'package:taqspalestine/provider_setup.dart';

Future main() async {
  Appconfig.prefs = await SharedPreferences.getInstance();
  bool _seen = (Appconfig.prefs.getBool('seen') ?? false);
  if (_seen) {
    print('seen');
  } else {
    Appconfig.prefs.setBool('seen', true);
    print('Notseen');
    Appconfig.prefs.setString('cityGeo', Appconfig.fuckingAllGeo[0]);
    Appconfig.prefs.setString(Appconfig.unit, "ca");
    Appconfig.prefs
        .setString(Appconfig.cityNameArabic, Appconfig.fuckingAllAr[0]);
  }
  setupLocator();

  SystemChrome.setEnabledSystemUIOverlays([]);
  // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providerss,
      child: new App(),
    );
  }
}

class App extends StatefulWidget {
  const App({
    Key key,
  }) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: MyColo.color_bodyLight,
        fontFamily: 'Changa',
      ),
      home: LocalNotif(),
      debugShowCheckedModeBanner: false,
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => FirstPage(),
      //   // '/': (context) => GraphPage(),
      //   '/detail': (context) => TaqsDetails(),
      //   '/graph': (context) => GraphPage(),
      //   '/notif': (context) => NotifPage(),
      //   '/general': (context) => GeneralPage(),
      //   '/city': (context) => YourCityPage(),
      //   '/about': (context) => AboutPage(),
      // },
    );
  }
}
