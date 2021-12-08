import 'package:flutter/material.dart';
import 'package:navigation_app/art_route.dart';
import 'package:navigation_app/art_util.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigating art',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ArtRoute(
        art: ArtUtil.IMG_VANGOGH,
      ),
    );
  }
}
