import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taqspalestine/Utils/MyColo.dart';
import 'package:taqspalestine/Utils/Taqs.dart';
import 'package:taqspalestine/Utils/admob.dart';
import 'package:taqspalestine/Utils/localNotif.dart';
import 'package:taqspalestine/Utils/locator.dart';
import 'package:taqspalestine/Views/AboutPage.dart';
import 'package:taqspalestine/Views/FirstPage/FirstPage.dart';
import 'package:taqspalestine/Views/GeneralPage.dart';
import 'package:taqspalestine/Views/GraphPage.dart';
import 'package:taqspalestine/Views/NotifPage.dart';
import 'package:taqspalestine/Views/TaqsDetail.dart';
import 'package:taqspalestine/Views/YourCityPage.dart';
import 'package:taqspalestine/Views/splash.dart';
import 'package:taqspalestine/provider_setup.dart';
import 'package:taqspalestine/test_connection.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
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

  // SystemChrome.setEnabledSystemUIOverlays([]);
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);

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
  void initState() {
    // TODO: implement initState
    super.initState();
    Ads.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: MyColo.color_bodyLight,
        fontFamily: 'Changa',
      ),
      // home: YourCityPage(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Splashs(),
        '/Home': (context) => FirstPage(),
        '/detail': (context) => TaqsDetails(),
        '/graph': (context) => GraphPage(),
        '/notif': (context) => NotifPage(),
        '/general': (context) => GeneralPage(),
        '/city': (context) => YourCityPage(),
        '/about': (context) => AboutPage(),
      },
    );
  }
}
