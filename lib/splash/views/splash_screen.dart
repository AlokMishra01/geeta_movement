import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../audio_book/provider/audio_book_provider.dart';
import '../../constants/colors.dart' as CustomColors;
import '../../constants/images.dart' as AssetImages;
import '../../e_book/provider/e_book_provider.dart';
import '../../home/views/home_page.dart';
import '../../settings/providers/setting_provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer1;
  late Timer _timer2;
  int i = 0;

  @override
  void initState() {
    super.initState();
    context.read<EBookProvider>();
    context.read<AudioBookProvider>();
    context.read<SettingProvider>();
    _timer1 = Timer(Duration(seconds: 2), () {
      i = 1;
      setState(() {});
    });
    _timer1 = Timer(
      Duration(seconds: 4),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (cxt) => HomeScreen(),
          // builder: (cxt) => ShowPage(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer1.cancel();
    _timer2.cancel();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
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
