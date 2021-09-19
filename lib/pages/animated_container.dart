import 'package:flutter/material.dart';

class Box extends StatefulWidget {
  const Box({ Key? key }) : super(key: key);

  @override
  _BoxState createState() => _BoxState();
}

class _BoxState extends State<Box> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  double width = 50;
  double height = 50;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    );
    _controller.addListener(() {
      setState(() {
        if (_controller.value <= 0.1) {
          width = 180;
          height = 170;
        } else if(_controller.value <= 0.3) {
          width = 50;
          height = 50;
        } else if (_controller.value <= 0.5) {
          width = 180;
          height = 170;
        } else if (_controller.value <= 0.7) {
          width = 150;
          height = 50;
        } else if (_controller.value <= 1) {
          width = 50;
          height = 50;
        }
      });
     });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Column(
        children: <Widget>[
          RotationTransition(
            turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 1000),
              width: width,
              height: height,
              color: Colors.orangeAccent,
            ),
          ),
          SizedBox(height: 50),
          RaisedButton(
            child: Text("go"),
            onPressed: () => _controller.forward(),
          ),
          RaisedButton(
            child: Text("stop"),
            onPressed: () => _controller.reset(),
          ),
        ],
      ),
    );
  }
}