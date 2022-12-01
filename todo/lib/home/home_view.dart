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
  // 3. HomeView initStatти карайт. Анын ичинде stream => readTodos(); фукцияны көрүп ушул фукцияны окуйт.
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

// readTodos эмне кылат? Бул stream кайтарат.
  Stream<QuerySnapshot> readTodos() {
    // Бул функция firestorдун dbсын түзүп ДатаБазага барат.
    final db = FirebaseFirestore.instance;
    //ДатаБазадан коллекцияларды издейт. Ал издеген коллекциянын аталышы todos. Бул коллекцияга snapshot
    //кошумча кылдык. Snapshot бул -- коллекциядагы датаны угуп турат,эгерде датада кандайдыр бир өзгөрүү
    //болсо snapshot аны streamBuilderге билдирет.
    return db.collection('todos').snapshots();
  }

// updateTodos деген асинхрондуу функция койдук ал todos модел алат жана Firestoreден Датабаза db алат.
  Future<void> updateTodos(TodoModel todo) async {
    // Бул функция firestorдун dbсын түзүп ДатаБазага барат.
    final db = FirebaseFirestore.instance;
    //dbден collection алат, анын ичиндеги todosту тандап алдык.
    await db
        .collection('todos')
        // ID бердик, Биз берген IDни карайт.   gJwGQIX1AyqkBqEQHG6l
        .doc(todo.id)
        // Биз тандаган IDнин ичиндеги isComplatedтин значениясы эмне болсо ошого карамакаршы бер(!).
        .update({'isComplated': !todo.isComplated});
  }

  // deleteTodos деген асинхрондуу функция койдук ал todos модел алат жана Firestoreден Датабаза db алат.
  Future<void> deleteTodos(TodoModel todo) async {
    final db = FirebaseFirestore.instance;
    //dbден collection алат, анын ичиндеги todosту тандап алдык.
    await db
        .collection('todos')
        // ID бердик, Биз берген IDни карайт.   gJwGQIX1AyqkBqEQHG6l
        .doc(todo.id)
        // өчүр
        .delete();
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
            // Эгерде биздин угуп жатканыбызды күтүп жаткан болсок
            if (snapshot.connectionState == ConnectionState.waiting) {
              // анда индикатор айланып турсун
              return const Center(
                child: CupertinoActivityIndicator(),
              );
              //  Эгерде даталарды угууда кандайдыр бир каталар болсо
            } else if (snapshot.hasError) {
              // Снимоктун катасы бар экендиги тууралуу экранга toString тибинде чыгар
              return Center(child: Text(snapshot.error!.toString()));
              //Же келүүчү снимок датасы менен болсо
            } else if (snapshot.hasData) {
              // TodoModelди лист кылып, аталышын todos кылдым жана барабарладым.
              // snapshot(угуучу).датанын ичиндеги.бирден көп <List> документти угуп атасың.
              final List<TodoModel> todos = snapshot.data!.docs
                  //  .map аркылуу бирден көп листти (точнее документтерди) бирден кайтар.
                  // (е) бул документтен кийинки документке которулуп иштейт.
                  // Ушинтип .map келип (e)ни алды
                  .map((e) =>
                      // fromMap бул Map алат дагы бизге TodoModel кайтарат. Ошентип fromMap => Map<String, dynamic> алганы үчүн
                      // е нин data сын берип койдук. Ошондо ар бир документке караштуу даталарды бердик.
                      //(.. эки точка TodoModel.fromMap(e.data() as Map<String, dynamic>))  аткарылгандан кийин дегенди билдирет,
                      // эми бизге TodoModel.fromMap new TodoModel берди, new TodoModel берип бүткөндөн кийин ошол  new TodoModelдин
                      // id син бизге келген документтин id сине барабарлап кой дедик (..id = e.id).
                      //Update кылуу учурда жазылды ..id=e.id => TodoModel моделге кошуча кошулду.

                      TodoModel.fromMap(e.data() as Map<String, dynamic>)
                        ..id = e.id)
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
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Checkbox(
                                value: todo.isComplated,
                                onChanged: ((value) async {
                                  // Күт дагы updateTodos()ту иштет.(ичине Checkboxтун todoсун берип койдук)
                                  await updateTodos(todo);
                                })),
                            IconButton(
                                onPressed: (() {
                                  deleteTodos(todo);
                                }),
                                icon: const Icon(Icons.delete)),
                          ],
                        ),
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
