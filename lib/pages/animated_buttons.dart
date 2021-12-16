import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';

class AnimatedButtonsExample extends StatefulWidget {
  const AnimatedButtonsExample({ Key? key }) : super(key: key);

  @override
  _AnimatedButtonsExampleState createState() => _AnimatedButtonsExampleState();
}

class _AnimatedButtonsExampleState extends State<AnimatedButtonsExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Column(
          children: [
            Text('AnimatedButtons', style: TextStyle(
              color: Colors.black,
            ),),
            SizedBox(height: 2,),
            Text('@theflutterlover', style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 15,
            ),),
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedButton(
              child: Text(
                'Simple button',
                style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.w500,                                 
                ),
              ),
              onPressed: () {},
            ),
          ]
        ),
      ),
    );
  }
}
