import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geeta_movement/views/privacy_policy.dart';

import 'aboutus_page.dart';
import 'feedback_suggestion_page.dart';
import 'terms_condtion_page.dart';


class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Padding(
          padding: const EdgeInsets.only(top:20.0,right: 60.0),
          child: Text('Settings'),
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
      body: Container(
        padding: EdgeInsets.only(left: 40, top: 25, right: 40),
        child: ListView(
          children: [
            Text(
              "General Settings",
              style: TextStyle(fontSize: 25,color: Colors.grey),
            ),
            SizedBox(
              height: 36,
            ),
            buildNotificationOptionRow("Push Notification", true),
            SizedBox(
              height: 40,
            ),
            buildNotificationOptionRow("Dark Mode", false),
            SizedBox(
              height: 36,
            ),
       Text('Others',style: TextStyle(
         color: Colors.grey,fontSize: 25
       ),),
            SizedBox(
              height: 34,
            ),

            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutUs()));
              },
                child: _buildAccountOptionRow(context, "About us")),
            SizedBox(
              height: 34,
            ),
            InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PrivacyPolicy()));
                },
                child: _buildAccountOptionRow(context, "Privacy Policy")),
            SizedBox(
              height: 34,
            ),
            InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>TermsCondition()));
                },
                child: _buildAccountOptionRow(context, "Terms and conditions")),
            SizedBox(
              height: 34,
            ),
            InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>FeedBack()));
                },
                child: _buildAccountOptionRow(context, "Suggestion and Feedback")),
            SizedBox(
              height: 34,
            ),
            InkWell(
                onTap: null,

                child: _buildAccountOptionRow(context, "Credits")),





          ],
        ),
      ),
    );
  }

  Row buildNotificationOptionRow(String title, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black),
        ),
        Transform.scale(
            scale: 1.10,
            child: CupertinoSwitch(
              activeColor: Color(0xccE40007),

              value: isActive,
              onChanged: (bool val) {},
            ))
      ],
    );
  }

  Widget _buildAccountOptionRow(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 20,
            color: Color(0xff4B4B4B),
          ),
        ],
      ),
    );
  }
}