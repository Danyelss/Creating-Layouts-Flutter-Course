import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Container App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Container'),
        ),
        body: // Column(children: [
            Container(
          margin: EdgeInsets.all(50.0),
          width: 400.0,
          height: 500.0,
          //child: FlutterLogo(),
          decoration: BoxDecoration(
            color: Colors.black,
            /*gradient: LinearGradient(
              colors: [Colors.pink.shade50, Colors.pink.shade500],
            ),*/
            image: DecorationImage(
              image: NetworkImage('http://bit.ly/flutter_tiger'),
              //fit: BoxFit.scaleDown,
              //repeat: ImageRepeat.repeat,
            ),
            /*gradient: RadialGradient(
                //LinearGradient(
                //begin: Alignment(0.0, -1.0),
                //end: Alignment(0.0, -0.8),
                tileMode: TileMode.clamp,
                //stops: [0.5,0.6,0.7,0.8],
                radius: 0.25,
                center: Alignment(0.0, 0.5),
                colors: [
                  Colors.blue,
                  Colors.green,
                  Colors.deepPurple,
                  Colors.pink,
                ]),*/
            shape: BoxShape.rectangle,
            /*borderRadius: BorderRadius.only(
              // BorderRadius.all(
              topLeft: Radius.circular(50.0),
              bottomRight: Radius.circular(20.0),
            ),*/
          ),
        ),

        //]),
      ),
    );
  }
}
