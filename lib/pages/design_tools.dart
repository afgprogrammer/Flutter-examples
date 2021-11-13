import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class DesignTools extends StatefulWidget {
  const DesignTools({ Key? key }) : super(key: key);

  @override
  _DesignToolsState createState() => _DesignToolsState();
}

class _DesignToolsState extends State<DesignTools> {
  int selectedTool = 0;

  List<dynamic> tools = [
    {
      'image': 'https://cdn-icons-png.flaticon.com/128/732/732244.png',
      'selected_image': 'https://cdn-icons-png.flaticon.com/128/732/732244.png',
      'name': 'Sketch',
      'description': 'The digital design platform.',
    },
    {
      'image': 'https://img.icons8.com/color/2x/adobe-xd.png',
      'selected_image': 'https://img.icons8.com/color/2x/adobe-xd--v2.gif',
      'name': 'Adobe XD',
      'description': 'Fast & powerful UI/UX design solution.',
    },
    {
      'image': 'https://img.icons8.com/color/2x/figma.png',
      'selected_image': 'https://img.icons8.com/color/2x/figma--v2.gif',
      'name': 'Figma',
      'description': 'The collaborative interface design tool.',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50,),
            FadeInDown(
              from: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Select a Design Tool", style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.bold
                  ),),
                  IconButton(
                    onPressed: () {}, 
                    icon: Icon(Icons.close)
                  )
                ],
              ),
            ),
            SizedBox(height: 30,),
            FadeInDown(
              from: 50,
              child: Text("What do you want to learn?", style: TextStyle(
                color: Colors.blueGrey.shade400,
                fontSize: 20
              ),),
            ),
            SizedBox(height: 20,),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView.builder(
                itemCount: tools.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTool = index;
                      });
                    },
                    child: FadeInUp(
                      delay: Duration(milliseconds: index * 100),
                      child: AnimatedContainer(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        margin: EdgeInsets.only(bottom: 20),
                        duration: Duration(milliseconds: 500),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: selectedTool == index ? Colors.blue : Colors.white.withOpacity(0),
                            width: 2
                          ),
                          boxShadow: [
                            selectedTool == index ?
                            BoxShadow(
                              color: Colors.blue.shade100,
                              offset: Offset(0, 3),
                              blurRadius: 10
                            ) : BoxShadow(
                              color: Colors.grey.shade200,
                              offset: Offset(0, 3),
                              blurRadius: 10
                            )
                          ] 
                        ),
                        child: Row(
                          children: [
                            selectedTool == index ?
                            Image.network(tools[index]['selected_image'], width: 50,) :
                            Image.network(tools[index]['image'], width: 50,),
                            SizedBox(width: 20,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(tools[index]['name'], style: TextStyle(
                                    color: Colors.grey.shade800,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                  ),),
                                  Text(tools[index]['description'], style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 14,
                                  ),)
                                ],
                              ),
                            ),
                            Icon(Icons.check_circle, color: selectedTool == index ? Colors.blue : Colors.white,)
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      )
    );
  }
}