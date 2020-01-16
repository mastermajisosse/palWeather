import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:taqspalestine/Utils/MyColo.dart';
import 'package:taqspalestine/Utils/Mydrawer.dart';
import 'package:taqspalestine/Utils/Taqs.dart';
import 'package:taqspalestine/Utils/admob.dart';

class YourCityPage extends StatefulWidget {
  @override
  _YourCityPageState createState() => _YourCityPageState();
}

class _YourCityPageState extends State<YourCityPage> {
  @override
  void initState() {
    super.initState();
    Ads.initialize();
    Ads.showBannerAd();
  }

  @override
  void dispose() {
    super.dispose();
    Ads.hideBannerAd();
  }

  Widget appBarTitle = Text(
    "أكتب اسم مدينتك",
    style: TextStyle(color: Colors.white),
  );
  Icon actionIcon = Icon(
    Icons.search,
    color: Colors.white,
  );
  final key = GlobalKey<ScaffoldState>();
  final TextEditingController _searchQuery = TextEditingController();
  List<String> _list = [
    'عكا',
    'صفد',
    'حيفا',
    'الناصرة',
    'جنين',
    'بيسان',
    'طولكرم',
    'طوباس',
    'قلقيلية',
    'نابلس',
    'سلفيت',
    'يافا',
    'اريحا',
    'رام الله',
    'القدس',
    'غزة',
    'بيت لحم',
    'خان يونس',
    'رفح',
    'الخليل',
    'بئر السبع',
    'طبريا',
  ];

  List<String> allcities = Appconfig.allcities;
  bool isSearching = false;
  String _searchText = "";

  _YourCityPageState() {
    _searchQuery.addListener(() {
      if (_searchQuery.text.isEmpty) {
        setState(() {
          isSearching = false;
          _searchText = "";
        });
      } else {
        setState(() {
          isSearching = true;
          _searchText = _searchQuery.text;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      drawer: MyDrawer.myDrawer(context),
      appBar: AppBar(
          leading: this.actionIcon.icon != Icons.search
              ? Icon(
                  Icons.search,
                  color: Colors.white,
                )
              : IconButton(
                  icon: Icon(
                    Icons.clear_all, // menu
                    size: 32,
                    color: Colors.white,
                  ),
                  onPressed: () => key.currentState.openDrawer(),
                ),
          centerTitle: true,
          title: appBarTitle,
          actions: <Widget>[
            IconButton(
              icon: actionIcon,
              onPressed: () {
                setState(() {
                  if (this.actionIcon.icon == Icons.search) {
                    this.actionIcon = Icon(
                      Icons.close,
                      color: Colors.white,
                    );
                    this.appBarTitle = Directionality(
                      textDirection: TextDirection.rtl,
                      child: TextField(
                        controller: _searchQuery,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                            hintText: "اكتب اسم مدينتك",
                            hintStyle: TextStyle(color: Colors.white)),
                      ),
                    );
                    _handleSearchStart();
                  } else {
                    _handleSearchEnd();
                  }
                });
              },
            ),
          ]),
      //
      //
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        children: isSearching
            ? _buildSearchList()
            : Appconfig.fuckingAllAr
                .asMap()
                .map((i, contact) => MapEntry(
                      i,
                      InkWell(
                        onTap: () {
                          contact = contact.toLowerCase();
                          print('_list2[i]');

                          setState(() {
                            Appconfig.prefs.setString(
                                'cityGeo', Appconfig.fuckingAllGeo[i]);

                            Appconfig.prefs.setString(Appconfig.cityNameArabic,
                                Appconfig.fuckingAllAr[i]);
                            Navigator.pushReplacementNamed(context, '/');
                          });
                        },
                        child: ChildItem(contact),
                      ),
                    ))
                .values
                .toList(),
      ),
    );
  }

  List<ChildItem> _buildSearchList() {
    if (_searchText.isEmpty) {
      return Appconfig.fuckingAllAr
          .map((contact) => ChildItem(contact))
          .toList();
    } else {
      List<String> _searchList = List();
      for (int i = 0; i < Appconfig.fuckingAllAr.length; i++) {
        String name = Appconfig.fuckingAllAr.elementAt(i);
        if (name.toLowerCase().contains(_searchText.toLowerCase())) {
          _searchList.add(name);
        }
      }
      return _searchList.map((contact) => ChildItem(contact)).toList();
    }
  }

  void _handleSearchStart() {
    setState(() {
      isSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      this.actionIcon = Icon(
        Icons.search,
        color: Colors.white,
      );
      this.appBarTitle = Text(
        "اختر مدينتك",
        style: TextStyle(color: Colors.white),
      );
      isSearching = false;
      _searchQuery.clear();
    });
  }
}

class ChildItem extends StatelessWidget {
  final String name;
  ChildItem(this.name);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          trailing: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text(
              this.name,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: MyColo.color_bodyDark),
            ),
          ),
        ),
        Divider(
          color: MyColo.color_bodyDark,
        ),
      ],
    );
  }
}
