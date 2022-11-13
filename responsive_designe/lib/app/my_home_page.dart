import 'package:flutter/material.dart';
import 'package:responsive_designe/responsive/desktop_body.dart';
import 'package:responsive_designe/responsive/mobile_body.dart';
import 'package:responsive_designe/responsive/responsive.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ResponsiveLayout(
          mobileBody: MyMobileBody(), desktopBody: MyDesktopBody()),
    );
  }
}
