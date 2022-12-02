import 'package:flutter/material.dart';
import 'package:todo/home/home_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // 2. MaterialApp => HomeView() pageти окуйт
      home: const HomeView(),
    );
  }
}
