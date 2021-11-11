import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class SalomonBottomNavBar extends StatefulWidget {
  const SalomonBottomNavBar({ Key? key }) : super(key: key);

  @override
  _SalomonBottomNavBarState createState() => _SalomonBottomNavBarState();
}

class _SalomonBottomNavBarState extends State<SalomonBottomNavBar> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        title: Text("Salomon Bottom Bar",),
      ),
      body: Center(child: Text("@theflutterlover", style: TextStyle(fontSize: 20),),),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            selectedColor: Colors.purple
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.favorite_border),
            title: Text("Likes"),
            selectedColor: Colors.pink
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.search),
            title: Text("Search"),
            selectedColor: Colors.orange
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
            selectedColor: Colors.teal
          )
        ],
      ),
    );
  }
}
