import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_google_play/screens/home/home_screen.dart';

// ripple - ряб - толкун
// spinner - спиннер
// published - опубликовано
// Size Config - Конфигурация размера
// is deprecated - устарела
// property - имущество

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Furniture App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        // here we set DM sans as our default fonts
        // Now we alsoapply out text color to all flutter textTheme
        textTheme: GoogleFonts.dmSansTextTheme().apply(),
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
        ),

        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
