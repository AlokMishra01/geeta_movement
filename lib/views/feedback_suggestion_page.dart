import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class FeedBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Padding(
          padding: const EdgeInsets.only(top:20.0,right: 60.0),
          child: Text('Feedback and Suggestion'),
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
              height: 43.6,
            ),
            Text('Have something to say?',style: TextStyle(
              fontSize: 18,fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 27.83,),
            Container(
              width: 361.62,
              height: 227.97,
              decoration: BoxDecoration(
              ),
              child: TextFormField(

                decoration: InputDecoration(
                  hintText: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',

                  focusColor: Colors.red,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red)
                    )

                ),
                maxLines: 100,


              ),
            ),
            SizedBox(
              height: 25.03,
            ),
            Padding(
              padding: const EdgeInsets.only(left:15.0),
              child: Text('Are you satisfied with app Functionality?',style: TextStyle(
                  fontSize: 18,fontWeight: FontWeight.bold
              ),),
            ),
            SizedBox(
              height: 16.4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               Container(
                 height: 48,
                 width: 88,
                 decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xccC7C7C7)

                ),


                   borderRadius: BorderRadius.circular(4.0)
                 ),
                 child: Column(
                   children: [
                     Padding(
                       padding: const EdgeInsets.only(top:10.0,right: 0.0,left: 0.0,bottom: 0.0),
                       child: Text('Less ',style: TextStyle(
                         fontWeight: FontWeight.bold,fontSize: 20
                       ),),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(top:1.0),
                       child: Text('Satisfied ',style: TextStyle(fontSize: 10,color: Colors.grey
                       ),),
                     ),
                   ],
                 ),
               ),
               Container(
                 height: 46,
                 width: 85,
                 decoration: BoxDecoration(
                     border: Border.all(
                         color: Color(0xccC7C7C7)

                     ),


                     borderRadius: BorderRadius.circular(4.0)
                 ),
                 child: Column(
                   children: [
                     Padding(
                       padding: const EdgeInsets.only(top:10.0,right: 0.0,left: 0.0,bottom: 0.0),
                       child: Text('Medium ',style: TextStyle(
                           fontWeight: FontWeight.bold,fontSize: 20
                       ),),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(top:1.0),
                       child: Text('Satisfied ',style: TextStyle(fontSize: 10,color: Colors.grey
                       ),),
                     ),
                   ],
                 ),
               ),
               Container(
                 height: 46,
                 width: 85,
                 decoration: BoxDecoration(
                     border: Border.all(
                         color: Color(0xccC7C7C7)

                     ),


                     borderRadius: BorderRadius.circular(4.0)
                 ),
                 child: Column(
                   children: [
                     Padding(
                       padding: const EdgeInsets.only(top:10.0,right: 0.0,left: 0.0,bottom: 0.0),
                       child: Text('Fully ',style: TextStyle(
                           fontWeight: FontWeight.bold,fontSize: 20
                       ),),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(top:1.0),
                       child: Text('Satisfied ',style: TextStyle(fontSize: 10,color: Colors.grey
                       ),),
                     ),
                   ],
                 ),
               ),
             ],
            ),
            SizedBox(
              height: 38,
            ),
            // ignore: deprecated_member_use
            Container(
              height:45 ,
              width: 360,
              child: ElevatedButton(

                child: Text("Submit"),

                onPressed: () => print("it's pressed"),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xccE40007),
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
              ),
            )


          ],

        ),
      ),
    );
  }
}
