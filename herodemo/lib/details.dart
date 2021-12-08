import 'package:flutter/material.dart';
import 'package:herodemo/util.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class Details extends StatelessWidget {
  final String drinkPath;
  final String drinkTag;

  Details(this.drinkPath, this.drinkTag);

  @override
  Widget build(BuildContext context) {
    timeDilation = 1;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    pop() {
      Navigator.of(context).pop();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Hero Animation'),
      ),
      body: Center(
        child: Util.buildHeroRadialDestination(
            drinkPath, drinkTag, width, height, pop),
      ),
    );
  }
}
