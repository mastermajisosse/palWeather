import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:taqspalestine/Providers/CitiesProviders.dart';
import 'package:taqspalestine/Views/FirstPage/FirstPage.dart';

class RightW extends StatefulWidget {
  @override
  _RightWState createState() => _RightWState();
}

class _RightWState extends State<RightW> {
  List<bool> isSelected = List.generate(4, (_) => true);
  // FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  //     FlutterLocalNotificationsPlugin();
  // var initializationSettingsAndroid;
  // var initializationSettingsIOS;
  // var initializationSettings;

  // Future<void> _demoNotification() async {
  //   var time = Time(10, 0, 0);
  //   var androidPlatformChannelSpecifics = AndroidNotificationDetails(
  //       'repeatDailyAtTime channel id',
  //       'repeatDailyAtTime channel name',
  //       'repeatDailyAtTime description');
  //   var iOSPlatformChannelSpecifics = IOSNotificationDetails();
  //   var platformChannelSpecifics = NotificationDetails(
  //       androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
  //   await flutterLocalNotificationsPlugin.showDailyAtTime(
  //     0,
  //     'طقس فلسطين',
  //     '  .. درجة حرارة اليوم في مدينتك هي '
  //     +
  //     Appconfig.prefs.getDouble('currentTemp').round().toString() +
  //     " درجة مئوية "
  //     ,
  //     time,
  //     platformChannelSpecifics,
  //     payload: 'test oayload',
  //   );
  // }

  // Future onSelectNotification(String payload) async {
  //   if (payload != null) {
  //     debugPrint('Notification payload: $payload');
  //   }
  //   await Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => FirstPage()),
  //   );
  // }

  // Future onDidReceiveLocalNotification(
  //     int id, String title, String body, String payload) async {
  //   await showDialog(
  //       context: context,
  //       builder: (BuildContext context) => CupertinoAlertDialog(
  //             title: Text(title),
  //             content: Text(body),
  //             actions: <Widget>[
  //               CupertinoDialogAction(
  //                 isDefaultAction: true,
  //                 child: Text('Ok'),
  //                 onPressed: () async {
  //                   Navigator.of(context, rootNavigator: true).pop();
  //                   await Navigator.push(context,
  //                       MaterialPageRoute(builder: (context) => FirstPage()));
  //                 },
  //               )
  //             ],
  //           ));
  // }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
  //   initializationSettingsIOS = IOSInitializationSettings(
  //       onDidReceiveLocalNotification: onDidReceiveLocalNotification);
  //   initializationSettings = InitializationSettings(
  //       initializationSettingsAndroid, initializationSettingsIOS);
  //   flutterLocalNotificationsPlugin.initialize(initializationSettings,
  //       onSelectNotification: onSelectNotification);
  //   _demoNotification();
  // }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: height / 1.42,
      child: Stack(
        children: <Widget>[
          rrrb(
            170,
            'a',
            "assets/icons/drawer.png",
            () => setState(() {
              Provider.of<CitiesProvider>(context).butonat = 'a';
            }),
          ),
          rrrb(
            130,
            'b',
            "assets/icons/wind.png",
            () => setState(() {
              Provider.of<CitiesProvider>(context).butonat = 'b';
            }),
          ),
          rrrb(
            90,
            'c',
            "assets/icons/amb.png",
            () => setState(() {
              Provider.of<CitiesProvider>(context).butonat = 'c';
            }),
          ),
          rrrb(
            50,
            'd',
            "assets/icons/moon.png",
            () => setState(() {
              Provider.of<CitiesProvider>(context).butonat = 'd';
            }),
          ),
        ],
      ),
    );
  }

  Positioned rrrb(double b, kay, String s, Function f) {
    return Positioned(
      bottom: b,
      right: 20,
      child: ButtonTheme(
        minWidth: 20.0,
        child: GestureDetector(
          onTap: f,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: kay == Provider.of<CitiesProvider>(context).butonat
                ? Colors.yellow
                : Colors.grey[50],
            child: Container(
              width: 40,
              height: 35,
              padding: EdgeInsets.all(4),
              child: Image.asset(
                s,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
