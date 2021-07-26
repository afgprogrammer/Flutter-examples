import 'package:example/button.dart';
import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  )
);

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        color: Colors.orangeAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              child: Text("How to make a button like this", 
              textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white, 
                  fontSize: 44, 
                  fontWeight: FontWeight.bold,
                )
              )
            ),
            SizedBox(height: 50,),
            BorderedButton()
          ],
        )
      )
    );
  }
}
