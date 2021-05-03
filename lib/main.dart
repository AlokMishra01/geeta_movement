import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'splash/views/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AdaptiveThemeMode savedThemeMode;

  const MyApp({
    Key? key,
    this.savedThemeMode = AdaptiveThemeMode.light,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        WidgetsBinding.instance?.focusManager.primaryFocus?.unfocus();
      },
      child: AdaptiveTheme(
        light: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.deepOrange,
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        dark: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.deepOrange,
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        initial: savedThemeMode,
        builder: (theme, darkTheme) => MaterialApp(
          title: 'Geeta Movement',
          debugShowCheckedModeBanner: false,
          theme: theme,
          darkTheme: darkTheme,
          home: SplashScreen(),
        ),
      ),
    );
  }
}
