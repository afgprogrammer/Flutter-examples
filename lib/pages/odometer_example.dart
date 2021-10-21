import 'package:flutter/material.dart';
import 'package:odometer/odometer.dart';

class OdometerExample extends StatefulWidget {
  const OdometerExample({ Key? key }) : super(key: key);

  @override
  OdometerExampleState createState() => OdometerExampleState();
}

class OdometerExampleState extends State<OdometerExample> {
  int _counter = 10000;

  void _incrementCounter() {
    setState(() {
      _counter += 10000;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text("Odometer Package Example", style: TextStyle(color: Colors.black),),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: Icon(Icons.add),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSlideOdometerNumber(
              odometerNumber: OdometerNumber(_counter), 
              duration: Duration(milliseconds: 1000), 
              letterWidth: 35,
              numberTextStyle: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
      ),
    );
  }
}
