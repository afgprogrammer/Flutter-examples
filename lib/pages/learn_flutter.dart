import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LearnFlutter extends StatefulWidget {
  const LearnFlutter({ Key? key }) : super(key: key);

  @override
  _LearnFlutterState createState() => _LearnFlutterState();
}

class _LearnFlutterState extends State<LearnFlutter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF6DEC8),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(height: 50,),
            FadeInUp(
              duration: Duration(milliseconds: 1500),
              child: Image.network('https://cdn.dribbble.com/users/3484830/screenshots/16787618/media/b134e73ef667b926c76d8ce3f962dba2.gif', fit: BoxFit.cover,)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInUp(
                    delay: Duration(milliseconds: 1000),
                    duration: Duration(milliseconds: 1000),
                    child: Text("Learning code is now more easy", style: GoogleFonts.robotoSlab(
                      fontSize: 36,
                      fontWeight: FontWeight.w600
                    ),),
                  ),
                  SizedBox(height: 10,),
                  FadeInUp(
                    delay: Duration(milliseconds: 1200),
                    duration: Duration(milliseconds: 1000),
                    child: Text("Are you ready to learn languages \neasily in the funniest way?", style: GoogleFonts.robotoSlab(
                      fontSize: 16,
                      height: 1.8,
                      color: Colors.grey.shade700
                    ),),
                  ),
                ],
              ),
            ),
            FadeInUp(
              delay: Duration(milliseconds: 1300),
              duration: Duration(milliseconds: 1000),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('/');
                      }, 
                      color: Colors.black,
                      height: 45,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                      ),
                      padding: EdgeInsets.only(left: 25, right: 25, bottom: 4),
                      child: Center(
                        child: Text("Get Started", style: GoogleFonts.robotoSlab(
                          fontSize: 16,
                          color: Colors.white
                        ),),
                      )
                    ),
                    TextButton(
                      onPressed: () {}, 
                      child: Text("SKIP", style: GoogleFonts.robotoSlab(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        height: 1.8,
                        color: Colors.black
                      ),)
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
