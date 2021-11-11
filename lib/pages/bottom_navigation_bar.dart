import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({ Key? key }) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {

  List<Widget> tabs = [
    Center(child: Text("Home",style: TextStyle(color: Colors.white))),
    Center(child: Text("Search",style: TextStyle(color: Colors.white))),
    Center(child: Text("Profile",style: TextStyle(color: Colors.white))),
    Center(child: Text("Notification",style: TextStyle(color: Colors.white))),
    Center(child: Text("Add item",style: TextStyle(color: Colors.white))),
  ];

  int currentPage = 0;

  setPage(index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade900,
        title: Text('Navigation Bar'),
      ),
      body: tabs[currentPage],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade400,
        onPressed: () => setPage(4),
        child: Icon(Icons.add, color: Colors.white, size: 30,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey.shade900,
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 80,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.home, color: currentPage == 0 ? Colors.white :
                Colors.grey, size: 30,),
                onPressed: () => setPage(0),
              ),
              IconButton(
                icon: Icon(Icons.search, color: currentPage == 0 ? Colors.white :
                Colors.grey, size: 30,),
                onPressed: () => setPage(1),
              ),
              SizedBox.shrink(),
              IconButton(
                icon: Icon(Icons.person, color: currentPage == 0 ? Colors.white :
                Colors.grey, size: 30,),
                onPressed: () => setPage(2),
              ),
              IconButton(
                icon: Icon(Icons.notifications_outlined, color: currentPage == 0 ? Colors.white :
                Colors.grey, size: 30,),
                onPressed: () => setPage(3),
              )
            ],
          )
        )
      ),
      // bottomNavigationBar: FlashyTabBar(
      //   selectedIndex: currentPage,
      //   showElevation: true,
      //   onItemSelected: (index) => setState(() {
      //     currentPage = index;
      //   }),
      //   items: [
      //     FlashyTabBarItem(
      //       icon: Icon(Icons.event),
      //       title: Text('Events'),
      //     ),
      //     FlashyTabBarItem(
      //       icon: Icon(Icons.search),
      //       title: Text('Search'),
      //     ),
      //     FlashyTabBarItem(
      //       icon: Icon(Icons.highlight),
      //       title: Text('Highlights'),
      //     ),
      //     FlashyTabBarItem(
      //       icon: Icon(Icons.settings),
      //       title: Text('Settings'),
      //     ),
      //     FlashyTabBarItem(
      //       icon: Icon(Icons.settings),
      //       title: Text('한국어'),
      //     ),
      //   ],
      // ),
    );
  }
}