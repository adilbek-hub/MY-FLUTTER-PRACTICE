import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentalhelth/constants/app_colors.dart';
import 'package:mentalhelth/constants/text_style.dart';
import 'package:mentalhelth/until/emotional_face.dart';
import 'package:mentalhelth/until/exercise_tile.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[400],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '')
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Кандайсың Адилбек',
                          style: APPTextStyle.helloAdilbek,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '26 Ноя, 2022',
                          style: TextStyle(color: AppColors.appTextColor),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.iconContainerNotifications,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.notifications,
                          color: AppColors.iconColorNotifications,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.searchContainerColor,
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: const [
                      Icon(Icons.search),
                      SizedBox(
                        width: 10,
                      ),
                      Text('издөө')
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Өзүңдү кандай сезип жатасың?',
                      style: GoogleFonts.lobster(
                          color: const Color.fromARGB(255, 225, 235, 243),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const Icon(
                      Icons.more_horiz,
                      color: AppColors.iconColor,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        const EmotionalFace(
                          icon: Icons.star,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Star',
                          style: GoogleFonts.langar(
                              color: const Color.fromARGB(255, 248, 109, 202),
                              fontSize: 18),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        const EmotionalFace(
                          icon: Icons.star,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Star',
                          style: GoogleFonts.langar(
                              color: const Color.fromARGB(255, 248, 109, 202),
                              fontSize: 18),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        const EmotionalFace(
                          icon: Icons.star,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Star',
                          style: GoogleFonts.langar(
                              color: const Color.fromARGB(255, 248, 109, 202),
                              fontSize: 18),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        const EmotionalFace(
                          icon: Icons.star,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Star',
                          style: GoogleFonts.langar(
                              color: const Color.fromARGB(255, 248, 109, 202),
                              fontSize: 18),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        const EmotionalFace(
                          icon: Icons.star,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Star',
                          style: GoogleFonts.langar(
                              color: const Color.fromARGB(255, 248, 109, 202),
                              fontSize: 18),
                        )
                      ],
                    ),
                  ],
                ),
              ]),
            ),
            const Expanded(
              child: ExeciseTile(),
            )
          ],
        ),
      ),
    );
  }
}
