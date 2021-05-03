import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart' as CustomColors;
import '../constants/images.dart' as AssetImages;

class RateDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Material(
      color: Colors.transparent,
      child: Center(
        child: SizedBox(
          height: (width * 0.64) + 64,
          width: width * 0.9,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: (width * 0.64) + 64,
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
                                height: (width * 0.14),
                              ),
                              Text(
                                'Thank you!',
                                style: TextStyle(
                                  color: CustomColors.TEXT_RED,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                ),
                                child: Text(
                                  'Recommend us to others by rating us on App Store',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: CustomColors.TEXT_BLACK,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24.0,
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  style: TextButton.styleFrom(
                                    backgroundColor:
                                        CustomColors.TEXT_RED.withOpacity(
                                      0.05,
                                    ),
                                    side: BorderSide(
                                      color:
                                          CustomColors.TEXT_BLACK.withOpacity(
                                        0.5,
                                      ),
                                    ),
                                  ),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: Center(
                                      child: Text(
                                        'Yes, rate it now!',
                                        style: TextStyle(
                                          color: CustomColors.TEXT_RED,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24.0,
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  style: TextButton.styleFrom(
                                    backgroundColor:
                                        CustomColors.TEXT_RED.withOpacity(
                                      0.05,
                                    ),
                                    side: BorderSide(
                                      color:
                                          CustomColors.TEXT_BLACK.withOpacity(
                                        0.5,
                                      ),
                                    ),
                                  ),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: Center(
                                      child: Text(
                                        'No, Thanks',
                                        style: TextStyle(
                                          color: CustomColors.TEXT_RED,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
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
                        AssetImages.SMILE_EMOJI,
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
