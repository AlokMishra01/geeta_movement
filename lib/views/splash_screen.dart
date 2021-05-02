import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/colors.dart' as CustomColors;
import '../constants/images.dart' as AssetImages;
import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int i = 0;
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      i = 1;
      setState(() {});
    });
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (cxt) => HomePage(),
        ),
      ),
      // () => navigate(
      //   context: context,
      //   replace: true,
      //   from: SplashScreen(),
      //   to: HomePage(),
      // ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setEnabledSystemUIOverlays([
      SystemUiOverlay.top,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: CustomColors.PRIMARY_COLOR.withOpacity(0.96),
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            radius: 1,
            colors: [
              CustomColors.PRIMARY_COLOR_ALT,
              CustomColors.PRIMARY_COLOR.withOpacity(0.96),
            ],
          ),
        ),
        child: Center(
          child: AnimatedCrossFade(
            firstChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: width / 2,
                  height: width / 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      width / 4,
                    ),
                    child: Image.asset(
                      AssetImages.LOGO,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            secondChild: Image.asset(
              AssetImages.KRISHNA,
              width: width,
              fit: BoxFit.fitWidth,
            ),
            crossFadeState:
                i == 0 ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: const Duration(
              milliseconds: 500,
            ),
            layoutBuilder: (
              firstChild,
              firstChildKey,
              secondChild,
              secondChildKey,
            ) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 0.0,
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    key: secondChildKey,
                    child: secondChild,
                  ),
                  Positioned(
                    top: 0.0,
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    key: firstChildKey,
                    child: firstChild,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
