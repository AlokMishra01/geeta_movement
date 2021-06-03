import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'audio_book/provider/audio_book_provider.dart';
import 'e_book/provider/e_book_provider.dart';
import 'settings/providers/setting_provider.dart';
import 'splash/views/splash_screen.dart';

main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // final AdaptiveThemeMode savedThemeMode;

  const MyApp({
    Key? key,
    // this.savedThemeMode = AdaptiveThemeMode.light,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        WidgetsBinding.instance?.focusManager.primaryFocus?.unfocus();
      },
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<EBookProvider>(
            create: (_) => EBookProvider(),
          ),
          ChangeNotifierProvider<AudioBookProvider>(
            create: (_) => AudioBookProvider(),
          ),
          ChangeNotifierProvider<SettingProvider>(
            create: (_) => SettingProvider(),
          ),
        ],
        child: MaterialApp(
          title: 'Geeta Movement',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.deepOrange,
            textTheme: GoogleFonts.poppinsTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
          home: SplashScreen(),
        ),
      ),
    );
  }
}
