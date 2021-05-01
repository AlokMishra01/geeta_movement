import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class AudioBook extends StatelessWidget {
  final chapter = List<String>.generate(1000, (i) => 'Chapter $i');
  Color gradientStart = Colors.transparent;
  Color gradientEnd = Colors.black12;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child:  GridView.builder(
            shrinkWrap: true,
            itemCount: chapter.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1,),
            itemBuilder: (contxt, indx){
              return Padding(
                padding: const EdgeInsets.all(18.0),
                child: Card(
                  elevation: 5,
                  color: Colors.transparent,

                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28.49)),
                  child: Container(
                    height: 166,
                    width: 154
                    ,

                    child:Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.49)),
                      child: Stack(
                        children: <Widget>[
                          //image code
                          Image(image:
                          AssetImage('assets/images/Krishna.png'),
                            height: 166,
                            width: 154,
                            fit: BoxFit.fill,
                          ),
                          //top grey shadow

                          //bottom grey shadow
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(

                              height: 50,
                              width: double.infinity,
                              decoration: new BoxDecoration(
                                borderRadius: BorderRadius.circular(8.87),
                                gradient: new LinearGradient(
                                  end: const Alignment(0.0, -1),
                                  begin: const Alignment(0.0, 0.4),
                                  colors: <Color>[
                                    const Color(0x8A000000),
                                    Colors.black12.withOpacity(0.0)
                                  ],
                                ),

                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top:15.0,right: 39.0),
                                child: Container(
                                  height: 42.6,
                                  width: 42.6,
                                  child: IconButton(icon:Icon(Icons.play_circle_outline, color: Colors.white, size: 80,) , onPressed:(){}

                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:60.0,right: 90.0,left: 5.0),
                                child: Text('Title',style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold

                                ),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right:90.0,left: 5.0),
                                child: Text('Subtitle',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,

                                ),),
                              ),

                            ],
                          )

                        ],),
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
