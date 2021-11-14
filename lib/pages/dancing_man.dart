import 'package:flutter/material.dart';

class DancingMan extends StatefulWidget {
  const DancingMan({ Key? key }) : super(key: key);

  @override
  _DancingManState createState() => _DancingManState();
}

class _DancingManState extends State<DancingMan> with SingleTickerProviderStateMixin {
  bool _isDancing = false;

  // margin animation from bottom
  late AnimationController _marginAnimationController;
  Animation<double>? _marginAnimation;

  @override
  void initState() {
    super.initState();

    _marginAnimationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _marginAnimation = Tween<double>(
      begin: 20.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _marginAnimationController,
        curve: Curves.easeInOut,
      ),
    );

    _marginAnimationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8AD19),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: GestureDetector(
          onPanUpdate: (details) {
            if (details.delta.dy > -5) {
              setState(() {
                _isDancing = false;
              });
            } else {
              setState(() {
                _isDancing = true;
              });
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _isDancing ? 
                Image.asset('assets/dancing-man.gif', 
              height: 500, fit: BoxFit.cover,)
                : Image.asset('assets/stop-man.png', height: 500,),

              SizedBox(height: 50,),
              // animated arrow up Icon
              _isDancing ?
                Column(
                  children: [
                    Text("Swipe Down to Stop"),
                    SizedBox(height: 20,),
                    Icon(Icons.keyboard_arrow_down, color: Colors.black, size: 30,),
                  ],
                )
              :
                Column(
                  children: [
                    AnimatedBuilder(
                      animation: _marginAnimation!,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(0, _marginAnimation!.value),
                          child: Icon(Icons.keyboard_arrow_up, color: Colors.black, size: 30,),
                        );
                      },
                    ),
                    SizedBox(height: 20,),
                    Text("Swipe Up To Play"),
                  ],
                )
            ],
          ),
        )
      ),
    );
  }
}