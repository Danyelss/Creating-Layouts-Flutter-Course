import 'package:flutter/material.dart';
import 'package:herodemo/radial.dart';

class Util {
  static const String COFFEE_URL = 'http://bit.ly/fl_coffee';
  static const String CAPPUCCINO_URL = 'http://bit.ly/fl_cappuccino';
  static const String TEA_URL = 'http://bit.ly/fl_cappuccino';
  static Widget buildHeroIcon(String path, String tag) {
    return Hero(
        tag: tag,
        child: Container(
          width: 80,
          height: 80,
          child: Image.network(
            path,
            fit: BoxFit.cover,
          ),
        ));
  }

  static Widget buildHeroDestination(String path, String tag, double width) {
    return Hero(
      tag: tag,
      child: Container(
        width: width,
        child: Image.network(
          path,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  static Widget buildHeroRadialIcon(
      String path, String tag, double minRadius, double maxRadius) {
    return Container(
      child: Hero(
        tag: tag,
        createRectTween: _createTween,
        child: Container(
          height: minRadius,
          width: minRadius,
          child: RadialTransition(
            maxRadius: maxRadius,
            child: Image.network(
              path,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  static Tween<Rect?> _createTween(Rect? begin, Rect? end) {
    return MaterialRectArcTween(begin: begin, end: end);
  }

  static Widget buildHeroRadialDestination(String path, String tag,
      double maxWidth, double maxHeight, VoidCallback pop) {
    return GestureDetector(
      child: Hero(
        createRectTween: _createTween,
        tag: tag,
        child: Container(
          height: maxHeight,
          width: maxWidth,
          child: RadialTransition(
            maxRadius: maxWidth / 2,
            child: Image.network(
              path,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      onTap: pop,
    );
  }
}
