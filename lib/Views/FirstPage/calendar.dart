import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:taqspalestine/Providers/CitiesProviders.dart';
import 'package:taqspalestine/Utils/MyColo.dart';

class CalendarWid1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 30,
      left: 10,
      child: Container(
        width: 130,
        height: 130,
        child: Image.asset("assets/icons/calendarFirstp.png"),
      ),
    );
  }
}

class CalendarWid2 extends StatefulWidget {
  int i = 0;
  CalendarWid2(this.i);

  @override
  _CalendarWid2State createState() => _CalendarWid2State();
}

class _CalendarWid2State extends State<CalendarWid2> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 82,
      left: 17,
      child: Container(
        width: 120,
        height: 100,
        child: Provider.of<CitiesProvider>(context).listCities.isEmpty
            ? Container()
            : Column(
                children: <Widget>[
                  Text(
                    Provider.of<CitiesProvider>(context).arr[widget.i],
                    style: TextStyle(
                        color: MyColo.color_bodyDark, height: 1, fontSize: 12),
                  ),
                  Text(
                    Provider.of<CitiesProvider>(context).day(widget.i),
                    style: TextStyle(
                        color: MyColo.color_bodyDark, height: 1, fontSize: 12),
                  ),
                  Text(
                    Provider.of<CitiesProvider>(context).hh,
                    style: TextStyle(
                        color: MyColo.color_bodyDark, height: 1, fontSize: 12),
                  ),
                ],
              ),
      ),
    );
  }
}
