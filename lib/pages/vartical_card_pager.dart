import 'package:flutter/material.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

class VerticalCardPagerExample extends StatefulWidget {
  const VerticalCardPagerExample({ Key? key }) : super(key: key);

  @override
  _VerticalCardPagerExampleState createState() => _VerticalCardPagerExampleState();
}

class _VerticalCardPagerExampleState extends State<VerticalCardPagerExample> {
  final List<Widget> images = [
    ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network("https://images.unsplash.com/photo-1541778480-fc1752bbc2a9?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Njl8fHdhdGNofGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60", fit: BoxFit.cover,), 
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network("https://images.unsplash.com/photo-1434056886845-dac89ffe9b56?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fHdhdGNofGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=400&q=60", fit: BoxFit.cover,), 
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network("https://images.unsplash.com/photo-1508685096489-7aacd43bd3b1?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8d2F0Y2h8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60", fit: BoxFit.cover,), 
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network("https://images.unsplash.com/photo-1547996160-81dfa63595aa?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjJ8fHdhdGNofGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60", fit: BoxFit.cover,), 
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network("https://images.unsplash.com/photo-1617714651073-17a0fcd14f9e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDd8fHdhdGNofGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60", fit: BoxFit.cover,), 
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network("https://images.unsplash.com/photo-1618828272323-9f46e858e55e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTB8fHdhdGNofGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60", fit: BoxFit.cover,), 
    ),
  ];

  final List<String> titles = ['', '', '', '', '', ''];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: VerticalCardPager(
                  images: images,
                  titles: titles,
                  onPageChanged: (page) {},
                  onSelectedItem: (index) {
                    print(index);
                  },
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}