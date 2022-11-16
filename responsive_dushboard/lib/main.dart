import 'package:flutter/material.dart';
import 'package:responsive_dushboard/responsive/desktop_scaffold.dart';
import 'package:responsive_dushboard/responsive/mobile_scaffold.dart';
import 'package:responsive_dushboard/responsive/responsive_layout.dart';
import 'package:responsive_dushboard/responsive/tablet_scaffold.dart';

/* 
in this project we make to application's dushboard mobile, desktop

Приложенияны мобильный жана десктопный кылууда колдонулуучу негизги виджеттер.
1. Мобильныйга дексктопко жана планшетный dushboard виджеттерин түзүү
2. Мобильныйга дексктопко жана планшетный dushboard файлдарын түзүү
3. 3 файлдын өңдөрү болсун. (stateful) => бул жөн гана экранды жылдырганда плаформалардын өндөрүн көрсөтүү керек жер тексттерин.
4. loyautBuilder виджетин кайтарылганын колдонуу => ал виджет constraints алат=>  3 платформанын размерлерин колдон.(bool)
5. main dart файлына түзүлгөн платформа класстарын берип кой.
/////////////////////////////////////////////////////////////////////////////////////////////////////
6. mobile үчүн drawer => свет, баласына колонка = колонканын балдарына DrawerHeader= баласына иконка,
   listTile => leading icon, title text. (4 штук).
7. constantska Drawer, bgcolor киргизип кодду кыскарт.
8. кыскартылган коддорду башка платформага да берүү. (Эскертүү: Drawer() => десктопто bodyге берилет(Row). Drawer 
 Десктопто по умолчанию ачык көрсөтүлөт.)
*/
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: ResponsiveLayout(
        mobileScaffold: MobileScaffold(),
        tabletScaffold: TabletScaffold(),
        desktopScaffold: DesktopScaffold(),
      ),
    );
  }
}
