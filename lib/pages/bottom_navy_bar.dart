import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

class BottomNavyBarExample extends StatefulWidget {
  const BottomNavyBarExample({ Key? key }) : super(key: key);

  @override
  _BottomNavyBarExampleState createState() => _BottomNavyBarExampleState();
}

class _BottomNavyBarExampleState extends State<BottomNavyBarExample> {
  int _selectedIndex = 0;
  PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          children: <Widget>[
            _buildPage(
              icon: Icons.apps,
              title: '@theflutterlover',
              color: Colors.red,
            ),
            _buildPage(
              icon: Icons.person,
              title: 'Profile',
              color: Colors.pink,
            ),
            _buildPage(
              icon: Icons.message,
              title: 'Messages',
              color: Colors.orange,
            ),
            _buildPage(
              icon: Icons.settings,
              title: 'Settings',
              color: Colors.blue,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _selectedIndex,
        showElevation: false, 
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 300), curve: Curves.ease);
        }),
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.apps),
            title: Text('Home'),
            activeColor: Colors.red,
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.people),
              title: Text('Users'),
              activeColor: Colors.purpleAccent
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.message),
              title: Text('Messages'),
              activeColor: Colors.pink
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
              activeColor: Colors.blue
          ),
        ],
      )
    );
  }

  _buildPage ({ IconData? icon, String? title, Color? color }) {
    return Container(
      color: color,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(icon, size: 200.0, color: Colors.white),
            Text(title!, style: TextStyle(color: Colors.white, fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
