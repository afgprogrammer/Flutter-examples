import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonLoading extends StatefulWidget {
  const SkeletonLoading({ Key? key }) : super(key: key);

  @override
  _SkeletonLoadingState createState() => _SkeletonLoadingState();
}

class _SkeletonLoadingState extends State<SkeletonLoading> {  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Skeleton Loading with shimmer", style: TextStyle(color: Colors.black),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: 8,
          itemBuilder: (BuildContext ctx, index) {
            int timer = 1000;
            return  Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.white,
                period: Duration(milliseconds: timer),
                child: box(),
            );
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }


  Widget box(){
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15)
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey
                  ),
                ),

                SizedBox(height: 10,),
                Container(
                  width: 150,
                  height: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}