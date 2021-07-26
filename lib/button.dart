import 'package:flutter/material.dart';

class BorderedButton extends StatelessWidget {
  const BorderedButton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5, left: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border(
          bottom: BorderSide(color: Colors.black),
          top: BorderSide(color: Colors.black),
          left: BorderSide(color: Colors.black),
          right: BorderSide(color: Colors.black),
        )
      ),
      child: MaterialButton(
        minWidth: double.infinity,
        height: 60,
        onPressed: () {},
        color: Colors.yellowAccent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50)
        ),
        child: Text("Sign up", style: TextStyle(
          fontWeight: FontWeight.w600, 
          fontSize: 18
        ),),
      ),
    );
  }
}