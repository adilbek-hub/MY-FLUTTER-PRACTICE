import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/home/add_todo_page.dart';
import 'package:todo/model/todos_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initStat() {
    super.initState();
    readTodos();
  }
/*
БУЛ АСИНХРОНДУУ ФУНКЦИЯ Cloud Firestore'го ДАЙЫНДАМАЛАРДЫ КОШУУ

  Future<void> readTodos() async {
    //Cloud Firestore үлгүсүн баштаңыз: 
    final db = FirebaseFirestore.instance;
    //Cloud Firestore'го дайындарды кошконуңузду тез текшерүү үчүн Firebase консолундагы дайындарды
    // көргүчтү колдонуңуз.
    await db.collection("todos").get().then((event) {
      for (var doc in event.docs) {
        print("${doc.id} => ${doc.data()}");
      }
    });
  }
*/

  Stream<QuerySnapshot> readTodos() {
    final db = FirebaseFirestore.instance;
    return db.collection('todos').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('HomeView'),
      ),
      // StreamBuilder => Көрсөтүлгөн [агым] менен өз ара аракеттенүүнүн эң акыркы сүрөтүнүн негизинде өзүн
      // курган жана куруу стратегиясы [Builder] тарабынан берилген жаңы [StreamBuilder] түзөт.
      // Агымды ишке ашыруу үчүн бизге StreamBuilder керек.
      body: StreamBuilder(
          //1-жол stream: readTodos() => stream биз коллекциядан акыркы датаны алуучу readTodos() методун алат.
          //2-жол  FirebaseFirestore.instance.collection('todos').snapshots()
          stream: FirebaseFirestore.instance.collection('todos').snapshots(),
          // Эми агым аркылуу келүүчү сүрөттү (snapshotту) курабыз.
          builder: ((context,
              snapshot /*// Бул жерде сиз Флуттерге "снапшот" деген сөздү колдонууну айттыңыз*/) {
            // Эгер состояние соединения равно на Состояние соединения.ожидание
            if (snapshot.connectionState == ConnectionState.waiting) {
              // анда индикатор айланып турсун
              return const Center(
                child: CupertinoActivityIndicator(),
              );
              // Же снимокто кандайдыр бир ката бар болсо
            } else if (snapshot.hasError) {
              // Снимоктун катасы бар экендиги тууралуу экранга toString тибинде чыгар
              return Center(child: Text(snapshot.error!.toString()));
              //Же келүүчү снимок датасы менен болсо
            } else if (snapshot.hasData) {
              // TodoModelди лист кылып аталышын todos кылдым жана барабарладым.
              final List<TodoModel> todos = snapshot.data!.docs
                  .map((e) =>
                      TodoModel.fromMap(e.data() as Map<String, dynamic>))
                  .toList();
              return ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: ((
                    context,
                    index,
                  ) {
                    final todo = todos[index];
                    return Card(
                      child: ListTile(
                        title: Text(todo.title),
                        trailing: Checkbox(
                            value: todo.isComplated, onChanged: ((value) {})),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(todo.description ?? ''),
                            Text(todo.author),
                          ],
                        ),
                      ),
                    );
                  }));
            } else {
              return const Center(
                child: Text('Some error'),
              );
            }
          })),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: ((context) => AddTodo())));
      }),
    );
  }
}
