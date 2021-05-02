import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart' as CustomColors;
import '../constants/images.dart' as AssetImages;
import 'audio_book_detail.dart';

class AudioBook extends StatefulWidget {
  @override
  _AudioBookState createState() => _AudioBookState();
}

class _AudioBookState extends State<AudioBook> {
  final chapter = List<String>.generate(1000, (i) => 'Chapter $i');

  Color gradientStart = Colors.transparent;

  Color gradientEnd = Colors.black12;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: chapter.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (cxt, index) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    8.0,
                  ),
                  child: Stack(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: Image.asset(
                          AssetImages.IMAGE_TWO,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 80.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              end: const Alignment(0.0, -1),
                              begin: const Alignment(0.0, 0.4),
                              colors: [
                                CustomColors.TEXT_BLACK.withOpacity(0.6),
                                CustomColors.TEXT_BLACK.withOpacity(0.0)
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: IconButton(
                          icon: Icon(
                            Icons.play_circle_outline,
                            color: Colors.white,
                            size: 48.0,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (cxt) => AudioBookDetail(),
                              ),
                            );
                          },
                        ),
                      ),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 16.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Observing The Armies',
                                style: TextStyle(
                                  color: CustomColors.TEXT_WHITE,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '46 shlokas',
                                style: TextStyle(
                                  color: CustomColors.TEXT_WHITE,
                                  fontSize: 10.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
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
