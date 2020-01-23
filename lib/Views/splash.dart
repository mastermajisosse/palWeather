import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taqspalestine/Providers/CitiesProviders.dart';
import 'package:taqspalestine/Utils/MyColo.dart';

class Splashs extends StatefulWidget {
  final double radius;
  final double dotRadius;

  Splashs({this.radius = 50.0, this.dotRadius = 10.0});
  @override
  _SplashsState createState() => _SplashsState();
}

class _SplashsState extends State<Splashs> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation_rotation;
  Animation<double> animation_radius_in;
  Animation<double> animation_radius_out;

  double radius;
  double dotRadius;

  

  @override
  void initState() {
    super.initState();

    radius = widget.radius;
    dotRadius = widget.dotRadius;
    setState(() {
      Provider.of<CitiesProvider>(context, listen: false).getCities(f: true);
      Provider.of<CitiesProvider>(context, listen: false).getHourly(f: true);
      Provider.of<CitiesProvider>(context, listen: false).allTwentyone();
    });

    print(dotRadius);

    Future.delayed(Duration(seconds: 5)).then((_) {
      Navigator.pushReplacementNamed(context, '/Home');
    });

    controller = AnimationController(
        lowerBound: 0.0,
        upperBound: 1.0,
        duration: const Duration(milliseconds: 3000),
        vsync: this);

    animation_rotation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 1.0, curve: Curves.linear),
      ),
    );

    animation_radius_in = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.75, 1.0, curve: Curves.elasticIn),
      ),
    );

    animation_radius_out = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.25, curve: Curves.elasticOut),
      ),
    );

    controller.addListener(() {
      setState(() {
        if (controller.value >= 0.75 && controller.value <= 1.0)
          radius = widget.radius * animation_radius_in.value;
        else if (controller.value >= 0.0 && controller.value <= 0.25)
          radius = widget.radius * animation_radius_out.value;
      });
    });

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {}
    });

    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [MyColo.color_bodyDark, MyColo.color_bodyLight]),
      ),
      child: Container(
        width: 100,
        height: 100,
        child: Center(
          child: RotationTransition(
            turns: animation_rotation,
            child: Container(
              //color: Colors.limeAccent,
              child: Center(
                child: Stack(
                  children: <Widget>[
                    Transform.translate(
                      offset: Offset(0.0, 0.0),
                      child: Dot(
                        radius: radius,
                        color: Colors.yellowAccent,
                      ),
                    ),
                    Transform.translate(
                      child: Dot(
                        radius: dotRadius,
                        color: Colors.amber,
                      ),
                      offset: Offset(
                        radius * cos(0.0),
                        radius * sin(0.0),
                      ),
                    ),
                    Transform.translate(
                      child: Dot(
                        radius: dotRadius,
                        color: Colors.deepOrangeAccent,
                      ),
                      offset: Offset(
                        radius * cos(0.0 + 1 * pi / 4),
                        radius * sin(0.0 + 1 * pi / 4),
                      ),
                    ),
                    Transform.translate(
                      child: Dot(
                        radius: dotRadius,
                        color: Colors.pinkAccent,
                      ),
                      offset: Offset(
                        radius * cos(0.0 + 2 * pi / 4),
                        radius * sin(0.0 + 2 * pi / 4),
                      ),
                    ),
                    Transform.translate(
                      child: Dot(radius: dotRadius, color: Colors.blue),
                      offset: Offset(
                        radius * cos(0.0 + 3 * pi / 4),
                        radius * sin(0.0 + 3 * pi / 4),
                      ),
                    ),
                    Transform.translate(
                      child: Dot(
                        radius: dotRadius,
                        color: Colors.redAccent,
                      ),
                      offset: Offset(
                        radius * cos(0.0 + 4 * pi / 4),
                        radius * sin(0.0 + 4 * pi / 4),
                      ),
                    ),
                    Transform.translate(
                      child: Dot(
                        radius: dotRadius,
                        color: Colors.lightGreen,
                      ),
                      offset: Offset(
                        radius * cos(0.0 + 5 * pi / 4),
                        radius * sin(0.0 + 5 * pi / 4),
                      ),
                    ),
                    Transform.translate(
                      child: Dot(
                        radius: dotRadius,
                        color: Colors.orangeAccent,
                      ),
                      offset: Offset(
                        radius * cos(0.0 + 6 * pi / 4),
                        radius * sin(0.0 + 6 * pi / 4),
                      ),
                    ),
                    Transform.translate(
                      child: Dot(
                        radius: dotRadius,
                        color: Colors.blueAccent,
                      ),
                      offset: Offset(
                        radius * cos(0.0 + 7 * pi / 4),
                        radius * sin(0.0 + 7 * pi / 4),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class Dot extends StatelessWidget {
  final double radius;
  final Color color;

  Dot({this.radius, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: radius,
        height: radius,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}
