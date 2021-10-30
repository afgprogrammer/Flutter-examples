import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class Furnitures extends StatefulWidget {
  const Furnitures({ Key? key }) : super(key: key);

  @override
  _FurnituresState createState() => _FurnituresState();
}

class _FurnituresState extends State<Furnitures> with TickerProviderStateMixin {
  List<dynamic> _furnitures = [
    {
      'title': 'Modern \nFurnitures',
      'sub_title': 'Choose From Thousands Of Items That Fits Your Choice.',
      'image': 'https://images.unsplash.com/photo-1612015900986-4c4d017d1648?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTJ8fGZ1cm5pdHVyZXN8ZW58MHx8MHxibGFja3w%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60'
    },
    {
      'title': 'Modern \nFurniture',
      'sub_title': 'Choose From Thousands Of Items That Fits Your Choice.',
      'image': 'https://images.unsplash.com/photo-1583847268964-b28dc8f51f92?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8ZnVybml0dXJlc3xlbnwwfDF8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60'
    },
    {
      'title': 'Modern \nFurniture',
      'sub_title': 'Choose From Thousands Of Items That Fits Your Choice.',
      'image': 'https://images.unsplash.com/photo-1532499012374-fdfae50e73e9?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8ZnVybml0dXJlc3xlbnwwfDF8MHxibGFja3w%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60'
    },
    {
      'title': 'Modern \nFurniture',
      'sub_title': 'Choose From Thousands Of Items That Fits Your Choice.',
      'image': 'https://images.unsplash.com/photo-1633555715049-0c2777ee516e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OTl8fGZ1cm5pdHVyZXN8ZW58MHwxfDB8YmxhY2t8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60'
    }
  ];

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 20),
    vsync: this
  )..repeat(reverse: true);

  late final Animation<double> _animation = Tween<double>(
    begin: 1.0,
    end: 1.5
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.linear
  ));

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        onPageChanged: (int index) {
          _controller.value = 0.0;
          _controller.forward();
        },
        itemBuilder: (context, index) {
          return Container(
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(),
                  child: ScaleTransition(
                    scale: _animation,
                    child: Image.network(
                      _furnitures[index]['image'],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        colors: [
                          Colors.black.withOpacity(0.9),
                          Colors.black.withOpacity(0.8),
                          Colors.black.withOpacity(0.2),
                          Colors.black.withOpacity(0.1)
                        ]
                      )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeInDown(
                          duration: Duration(milliseconds: 500),
                          child: Text(_furnitures[index]['title'], 
                            style: TextStyle(
                              color: Colors.white, 
                              fontSize: 42, 
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        FadeInDown(
                          delay: Duration(milliseconds: 100),
                          duration: Duration(milliseconds: 800),
                          child: Text(_furnitures[index]['sub_title'], 
                            style: TextStyle(
                              color: Colors.grey.shade400, 
                              fontSize: 18,
                            ),
                          )
                        ),
                        SizedBox(height: 50,),
                        FadeInLeft(
                          delay: Duration(milliseconds: 100),
                          duration: Duration(milliseconds: 1000),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)
                              ),
                              onPressed: () {},
                              color: Colors.orange,
                              padding: EdgeInsets.only(right: 5, left: 30, top: 5, bottom: 5),
                              child: Container(
                                height: 40,
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Row(
                                  children: [
                                    Text('Get Started', 
                                      style: TextStyle(
                                        color: Colors.orange.shade50, 
                                        fontSize: 16,
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: Colors.orange.shade300,
                                        borderRadius: BorderRadius.circular(40)
                                      ),
                                      child: Icon(Icons.arrow_forward, color: Colors.orange.shade100,)
                                    ),
                                  ],
                                ),
                              )
                            ),
                          ),
                        ), 
                        SizedBox(height: 50),
                      ]
                    )
                  ),
                )
              ],
            ),
          );
        },
        itemCount: _furnitures.length,
        controller: PageController(viewportFraction: 1.0),
      ),
    );
  }
}