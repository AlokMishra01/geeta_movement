import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class AboutUs extends StatelessWidget {
  String title = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Padding(
          padding: const EdgeInsets.only(top:20.0,right: 60.0),
          child: Text('About us'),
        )),
        backgroundColor: Color(0xccE40007
        ),
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right:50.0,left: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 23.6,
            ),
            Container(
              height: 462,
              width: 378,
              child: Text(title,style: TextStyle(
                  fontSize: 18,fontWeight: FontWeight.bold
              ),),
            ),
            SizedBox(height: 27.83,),



          ],

        ),
      ),
    );
  }
}
