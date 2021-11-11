import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';

class BouncingWidgetExample extends StatefulWidget {
  const BouncingWidgetExample({ Key? key }) : super(key: key);

  @override
  _BouncingWidgetExampleState createState() => _BouncingWidgetExampleState();
}

class _BouncingWidgetExampleState extends State<BouncingWidgetExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orange,
        title: const Text('Bouncing Widget'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BouncingWidget(
              duration: Duration(milliseconds: 100),
              scaleFactor: 1.5,
              onPressed: () {
                print("onPressed");
              },
              child: Text(
                "@theflutterlover",
                style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
              ),
            ),
            SizedBox(height: 30,),
            // BouncingWidget(
            //   duration: Duration(milliseconds: 100),
            //   scaleFactor: 1.5,
            //   onPressed: () {
            //     print("onPressed");
            //   },
            //   child: Container(
            //     width: 200,
            //     height: 200,
            //     color: Colors.red,
            //   )
            // ),
            BouncingWidget(
              duration: Duration(milliseconds: 100),
              scaleFactor: 1.5,
              onPressed: () {
                print("onPressed");
              },
              child: MaterialButton(
                onPressed: null,
                color: Colors.deepOrange,
                disabledColor: Colors.deepOrange,
                minWidth: 200,
                height: 50,
                child: Text("Click on Me", style: TextStyle(color: Colors.white, fontSize: 20),),
              )
            ),
            SizedBox(height: 50,),
            BouncingWidget(
              duration: Duration(milliseconds: 100),
              scaleFactor: 1.5,
              onPressed: () {
                print("onPressed");
              },
              child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade200),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    offset: Offset(0, 3),
                    blurRadius: 10
                  )
                ]
              ),
            ))
          ],
        ),
      ),
    );
  }
}