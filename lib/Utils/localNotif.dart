// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:taqspalestine/Views/FirstPage/FirstPage.dart';

// class LocalNotif extends StatefulWidget {
//   @override
//   _LocalNotifState createState() => _LocalNotifState();
// }

// class _LocalNotifState extends State<LocalNotif> {
//   final notifications = FlutterLocalNotificationsPlugin();

//   @override
//   void initState() {
//     super.initState();

//     var initializationSettingsAndroid =
//         AndroidInitializationSettings('app_icon');
//     var initializationSettingsIOS = IOSInitializationSettings(
//         onDidReceiveLocalNotification: onDidReceiveLocalNotification);
//     var initializationSettings = InitializationSettings(
//         initializationSettingsAndroid, initializationSettingsIOS);
//     notifications.initialize(initializationSettings,
//         onSelectNotification: onSelectNotification);
//   }

//   Future onSelectNotification(String payload) async {
//     if (payload != null) {
//       debugPrint('notification payload: ' + payload);
//     }
//     await Navigator.push(
//       context,
//       new MaterialPageRoute(
//         builder: (context) => FirstPage(),
//       ),
//     );
//   }

//   Future onDidReceiveLocalNotification(
//       int id, String title, String body, String payload) async {
//     // display a dialog with the notification details, tap ok to go to another page
//     showDialog(
//       context: context,
//       builder: (BuildContext context) => new CupertinoAlertDialog(
//         title: new Text(title),
//         content: new Text(body),
//         actions: [
//           CupertinoDialogAction(
//             isDefaultAction: true,
//             child: new Text('Ok'),
//             onPressed: () async {
//               Navigator.of(context, rootNavigator: true).pop();
//               await Navigator.push(
//                 context,
//                 new MaterialPageRoute(
//                   builder: (context) => FirstPage(),
//                 ),
//               );
//             },
//           )
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: <Widget>[
//         Text("basic"),
//         RaisedButton(
//           child: Text("show notif"),
//           onPressed: () =>
//               showOngoinNotif(notifications, title: 'title', body: 'body'),
//         )
//       ],
//     );
//   }

//   Future showNotif(
//     FlutterLocalNotificationsPlugin notification, {
//     @required String title,
//     @required String body,
//     @required NotificationDetails type,
//     int id = 0,
//   }) =>
//       notification.show(id, title, body, type);

//   Future showOngoinNotif(
//     FlutterLocalNotificationsPlugin notification, {
//     @required String title,
//     @required String body,
//     int id = 0,
//   }) =>
//       showNotif(notification, id: id, title: title, body: body, type: ongoing);

//   NotificationDetails get ongoing {
//     final androidchannelSpecial = AndroidNotificationDetails(
//       'your channel id',
//       'your channel name',
//       'your channel description',
//       importance: Importance.Max,
//       priority: Priority.High,
//       ongoing: true,
//       autoCancel: false,
//     );
//     final ioschannelSpecifies = IOSNotificationDetails();
//     return NotificationDetails(androidchannelSpecial, ioschannelSpecifies);
//   }
// }
