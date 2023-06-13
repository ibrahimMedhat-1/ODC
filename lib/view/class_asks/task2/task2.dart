import 'dart:math';
import 'package:flutter/material.dart';

class animation extends StatefulWidget {
  const animation({Key? key}) : super(key: key);

  @override
  State<animation> createState() => _AnimationState();
}

class _AnimationState extends State<animation> {
  double width = 50;
  double height = 50;
  Color color = Colors.green;
  BorderRadiusGeometry border = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: width,
          height: height,
          child: InkWell(
            onTap: () {
              setState(() {
                final random = Random();
                width = 100;
                height = 100;
                color = Color.fromRGBO(random.nextInt(100), random.nextInt(100),
                    random.nextInt(100), 1);
                // border = BorderRadius.circular(random.nextInt(8).toDouble());
              });
            },
            child: AnimatedContainer(
              width: width,
              height: height,
              color: color,
              // decoration: BoxDecoration(
              //   color: color,
              //   borderRadius: border,
              // ),
              duration: Duration(minutes: 4),
              // curve: Curves.slowMiddle,
            ),
          ),
        ),
      ),
    );
  }
}
