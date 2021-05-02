import 'package:flutter/material.dart';
class EBook extends StatelessWidget {
  final chapter = List<String>.generate(1000, (i) => 'Chapter $i');
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
                itemCount: chapter.length,
                itemBuilder: (context,index){
                  return Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height:132,
                          width: 110,
                          child: Card(

                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(80.0)),
                              elevation: 5,
                              color: Colors.transparent,
                              child: Image(image: AssetImage('assets/images/Krishna.png'),
                                fit: BoxFit.fill,
                              )
                          ),
                        ),
                      ),
                      SizedBox(width: 14,),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom:1.7),
                            child: Text(chapter[index]),
                          ),
                          Text('Title',style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),),
                          Padding(
                            padding: const EdgeInsets.only(top:1.5),
                            child: Text('subtitle'),
                          )
                        ],
                      )
                    ],

                  );

                }
            )
        ),
      ],
    );
  }
}
