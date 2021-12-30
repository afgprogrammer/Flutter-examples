import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DreamJob extends StatefulWidget {
  const DreamJob({ Key? key }) : super(key: key);

  @override
  _DreamJobState createState() => _DreamJobState();
}

class _DreamJobState extends State<DreamJob> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1EBDA),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(height: 50,),
            FadeInUp(
              duration: Duration(milliseconds: 1500),
              child: Image.network('https://cdn.dribbble.com/users/730703/screenshots/4145366/media/eef764c28f9547b693ab61fb655ec371.gif', fit: BoxFit.cover,)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInUp(
                    delay: Duration(milliseconds: 1000),
                    duration: Duration(milliseconds: 1000),
                    child: Text("Your dream job is waiting for you!", style: GoogleFonts.robotoSlab(
                      fontSize: 32,
                      fontWeight: FontWeight.w600
                    ),),
                  ),
                  SizedBox(height: 10,),
                  FadeInUp(
                    delay: Duration(milliseconds: 1200),
                    duration: Duration(milliseconds: 1000),
                    child: Text("Discover milions of jobs and get in \ntouch with hiring managers.", style: GoogleFonts.robotoSlab(
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
                  mainAxisAlignment: MainAxisAlignment.end,
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
                    // TextButton(
                    //   onPressed: () {}, 
                    //   child: Text("SKIP", style: GoogleFonts.robotoSlab(
                    //     fontSize: 14,
                    //     fontWeight: FontWeight.w600,
                    //     height: 1.8,
                    //     color: Colors.black
                    //   ),)
                    // ),
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
