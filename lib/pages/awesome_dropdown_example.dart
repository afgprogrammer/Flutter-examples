import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';

class AwesomeDropdownExample extends StatefulWidget {
  const AwesomeDropdownExample({ Key? key }) : super(key: key);

  @override
  _AwesomeDropdownExampleState createState() => _AwesomeDropdownExampleState();
}

class _AwesomeDropdownExampleState extends State<AwesomeDropdownExample> {
  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text('@theflutterlover', style: TextStyle(
          color: Colors.black,
        ),),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text('Select a country', style: TextStyle(
                      fontSize: 16,
                      color: Colors.blueGrey
                    ),),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 10,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),
                    child: SearchField(
                      hint: 'Search',
                      searchInputDecoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blueGrey.shade200,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.blue.withOpacity(0.8),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      maxSuggestionsInViewPort: 6,
                      itemHeight: 50,
                      suggestionsDecoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onTap: (value) {
                        setState(() {
                          _selectedItem = value!;
                        });

                        print(value);
                      },
                      suggestions: [
                        'Afghanistan',
                        'Turkey',
                        'Germany',
                        'France',
                        'Italy',
                        'Spain',
                        'United Kingdom',
                        'United States',
                        'Canada',
                        'Australia',
                        'New Zealand',
                        'India',
                        'Indonesia',
                        'Bangladesh',
                        'Sri Lanka',
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 90,
              padding: EdgeInsets.only(right: 20, left: 20, bottom: 20),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _selectedItem == null ? Text('Please select a Country to Continue', style: TextStyle(
                    fontSize: 16,
                    color: Colors.blueGrey
                  ),) : Text(_selectedItem!, style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.w600
                  )),
                  MaterialButton(
                    onPressed: () {},
                    color: Colors.black,
                    minWidth: 50,
                    height: 50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    padding: EdgeInsets.all(0),
                    child: Icon(Icons.arrow_forward_ios, color: Colors.blueGrey, size: 24,),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
