import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const[
            // ListView -  это линейный список прокручиваемых элементов.
            //Он отображает свои дочерных элементы один за другим направлении прокрутки.
            // сушествует 4 варианта построение listView
            // 1 вариант это когда ListView просто берет список дочерных элементов и делает его прокручиваемым.
            // 2 вариант это конструктор builder. Конструктор принимает 2 основных параметра, это itemCount=> 
            //количества элементов списки, и itemBuilder => для каждого элемента списка.
          ],
        ),
      ),
    );
  }
}
