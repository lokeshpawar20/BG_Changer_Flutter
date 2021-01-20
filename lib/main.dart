import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BG Changer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Random Background'),
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var colors = [
    Colors.amber,
    Colors.black,
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.pink,
    Colors.orange,
    Color(0xFFFD2323) //FF for opque, 00 for transparent
  ];
  var currentColor = Colors.white;
  var buttonColor = Colors.black;

  setRandomColor() {
    var rnd = Random().nextInt(colors.length);
    setState(() {
      print(colors.length);
      print(rnd);
      print(colors.length - rnd);
      currentColor = colors[rnd];
      buttonColor = colors[colors.length - rnd - 1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: currentColor,
      child: Center(
        child: RaisedButton(
          color: buttonColor,
          padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          child: Text(
            'Change it!',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          onPressed: setRandomColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        ),
      ),
    );
  }
}
