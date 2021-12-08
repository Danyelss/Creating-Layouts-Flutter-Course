import 'package:flutter/material.dart';
import 'package:herodemo/util.dart';
import 'package:herodemo/details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hero Animation',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: HeroPage(),
    );
  }
}

class HeroPage extends StatelessWidget {
  const HeroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double maxRadius = MediaQuery.of(context).size.width;
    final double minRadius = 80.0;
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero Animation demo'),
      ),
      body: Container(
          padding: EdgeInsets.all(24),
          alignment: Alignment.topLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                child: Util.buildHeroRadialIcon(
                    Util.COFFEE_URL, 'coffee', minRadius, maxRadius),
                onTap: () {
                  changeRoute(context, 'coffee');
                },
              ),
              GestureDetector(
                  child: Util.buildHeroRadialIcon(
                      Util.CAPPUCCINO_URL, 'cappuccino', minRadius, maxRadius),
                  onTap: () {
                    changeRoute(context, 'cappuccino');
                  }),
              GestureDetector(
                  child: Util.buildHeroRadialIcon(
                      Util.TEA_URL, 'tea', minRadius, maxRadius),
                  onTap: () {
                    changeRoute(context, 'tea');
                  }),
            ],
          )),
    );
  }

  void changeRoute(BuildContext context, String drink) {
    switch (drink) {
      case 'coffee':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Details(Util.COFFEE_URL, drink),
          ),
        );
        break;
      case 'cappuccino':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Details(Util.CAPPUCCINO_URL, drink),
          ),
        );
        break;
      case 'tea':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Details(Util.TEA_URL, drink),
          ),
        );
        break;
    }
  }
}
