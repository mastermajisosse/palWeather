import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taqspalestine/Providers/CitiesProviders.dart';

class RightW extends StatefulWidget {
  @override
  _RightWState createState() => _RightWState();
}

class _RightWState extends State<RightW> {
  List<bool> isSelected = List.generate(4, (_) => true);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: height / 1.29,
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
