import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Container'),
        ),
        body: Center(
            child: Container(
          // color: Colors.green,
          //docherniy element child
          child: const Text('Adilbek'),
          // my mojem vyzyvat shirinu i vysatu konteynera
          height: 300,
          // width: 300,
          // Если мы ширину используем double.infinity то ширина контейнера будет 100 працентов по радительскому элементу.
          width: double.infinity,
          //также у контейнера есть параметр alignment, о выравнивает дочерный элемент под центру контейнера.
          // alignment  это класс выравнивание, он принимает координаты x,y.
          alignment: Alignment.center,
          // Также мы можем использовать margin и padding с помощью edgeinsets.
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          margin:
              const EdgeInsets.only(left: 25, top: 20, right: 25, bottom: 20),
          // у виджета контейнера есть параметр transform. с помощью него мы можем легко павернуть на контейнер.
          // transform: Matrix4.rotationZ(0.1),
          // параметр decoration. c помощью него мы можем задавать фоновое офармления контейнера.
          // с помощью BoxDecoration мы можем указать контейнеру фоновое оформления.
          decoration: BoxDecoration(
              color: Colors.green[400],
              shape: BoxShape.circle,
              boxShadow: const [
                BoxShadow(
                    color: Colors.black45,
                    offset: Offset(-5, 5),
                    blurRadius: 5,
                    spreadRadius: 5)
              ]),
        )));
  }
}
