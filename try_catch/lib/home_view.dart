import 'package:flutter/material.dart';

import 'package:try_catch/theme/app_text_style.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _birinchi = TextEditingController();
  final _ekinchi = TextEditingController();
  double _summa = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            '$_summa',
            style: AppTextStyle.summaStyle,
          ),
          TextFormField(
            controller: _birinchi,
          ),
          TextFormField(
            controller: _ekinchi,
          ),
          ElevatedButton(
              onPressed: (() {
                try {
                  _summa = double.parse(_birinchi.text) +
                      double.parse(_ekinchi.text);
                  setState(() {});
                } catch (e) {
                  showAboutDialog(
                      context: context,
                      applicationName:
                          'Сизде сан менен кошулган тамга катталды');
                }
              }),
              child: Text('+'))
        ],
      ),
    );
  }
}
