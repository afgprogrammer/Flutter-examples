import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HelicopterPage extends StatefulWidget {
  const HelicopterPage({ Key? key }) : super(key: key);

  @override
  _HelicopterPageState createState() => _HelicopterPageState();
}

class _HelicopterPageState extends State<HelicopterPage> {
  List<dynamic> _helicopters = [
    {
      'color': Color(0xff2DAAFA),
      'image': 'https://cdn.dribbble.com/users/4584084/screenshots/9271491/media/f32107904c73530191707403fa4fa6ea.gif',
    },
    {
      'color': Color(0xffE7CB91),
      'image': 'https://cdn.dribbble.com/users/721278/screenshots/6274521/helicopter_toy.gif',
    },
    {
      'color': Color(0xff731A01),
      'image': 'https://cdn.dribbble.com/users/210956/screenshots/3829094/media/3b6073f14271b5f7f809f34b468ae07c.gif',
    }
  ];

  int _current = 0;
  dynamic _selectedIndex = {};

  CarouselController _carouselController = new CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('@theflutterlover', style: TextStyle(          
          color: Colors.black,
        ),),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: CarouselSlider(
          carouselController: _carouselController,
          options: CarouselOptions(
            height: 250.0,
            aspectRatio: 4/3,
            // viewportFraction: 0.70,
            // enlargeCenterPage: true,
            pageSnapping: true,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }
          ),
          items: _helicopters.map((helicopter) {
            return Builder(
              builder: (BuildContext context) {
                return GestureDetector(
                  onTap: () {
                    // go to product view page with navigation push
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => HelicopterView(
                          helicopter: helicopter,
                        ),
                      ),
                    );
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 20,
                          offset: Offset(0, 5)
                        )
                      ]
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Hero(
                            transitionOnUserGestures: true,
                            tag: helicopter['color'],
                            child: Container(
                              height: 250,
                              // margin: EdgeInsets.only(top: 15),
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Image.network(helicopter['image'], fit: BoxFit.cover),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }).toList()
        ),
      ),
    );
  }
}

class HelicopterView extends StatefulWidget {
  final dynamic helicopter;
  const HelicopterView({ Key? key, required this.helicopter }) : super(key: key);

  @override
  _HelicopterViewState createState() => _HelicopterViewState();
}

class _HelicopterViewState extends State<HelicopterView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.helicopter['color'],
      child: Hero(
        tag: widget.helicopter['color'],
        transitionOnUserGestures: true,
        child: Image.network(widget.helicopter['image'])),
    );
  }
}
