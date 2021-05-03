import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart' as CustomColors;
import '../constants/images.dart' as AssetImages;

class LikeDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Material(
      color: Colors.transparent,
      child: Center(
        child: SizedBox(
          height: width * 0.64,
          width: width * 0.9,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: width * 0.64,
                  width: width * 0.9,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        height: width * 0.14,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: CustomColors.TEXT_WHITE,
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: (width * 0.14) + 8.0,
                              ),
                              Text(
                                'Help us Improve',
                                style: TextStyle(
                                  color: CustomColors.TEXT_BLACK,
                                  fontSize: 14.0,
                                ),
                              ),
                              Text(
                                'Did you like our App?',
                                style: TextStyle(
                                  color: CustomColors.TEXT_RED,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: 16.0,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CircleAvatar(
                                    radius: width * 0.065,
                                    backgroundColor: CustomColors.TEXT_BLACK,
                                    child: Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: CircleAvatar(
                                          radius: (width * 0.065) - 1,
                                          backgroundColor:
                                              CustomColors.TEXT_WHITE,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Icon(
                                              CupertinoIcons.hand_thumbsup,
                                              color: CustomColors.TEXT_RED,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  CircleAvatar(
                                    radius: width * 0.065,
                                    backgroundColor: CustomColors.TEXT_BLACK,
                                    child: Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: CircleAvatar(
                                          radius: (width * 0.065) - 1,
                                          backgroundColor:
                                              CustomColors.TEXT_WHITE,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Icon(
                                              CupertinoIcons.hand_thumbsdown,
                                              color: CustomColors.TEXT_RED,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: CircleAvatar(
                  radius: width * 0.14,
                  backgroundColor: CustomColors.TEXT_WHITE,
                  child: CircleAvatar(
                    radius: width * 0.1,
                    backgroundColor: CustomColors.TEXT_RED.withOpacity(0.1),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        AssetImages.FINGER_CROSSED,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
