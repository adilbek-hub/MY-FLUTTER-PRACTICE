import 'package:flutter/material.dart';
import 'package:todo/add/add.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todo/home/home_view.dart';
import 'firebase_options.dart';

/*
*CRUD*
1. Create your project in firebase
2. Configure your apps to use Firebase
3. Initialize Firebase in your app => flutter pub add firebase_core
4. In your lib/main.dart file, import the Firebase core plugin and the configuration file you generated earlier:
5. Also in your lib/main.dart file, initialize Firebase using the DefaultFirebaseOptions object exported by the configuration file:
5.1.  WidgetsFlutterBinding.ensureInitialized(); to lib/main

// Готово! Ваши приложения Flutter зарегистрированы и настроены для использования Firebase.
6. open firebase database and build collection
Эми түзүлгөн датаны эмулятордо көрсөтүү керек. Анын жолу: VSте модель түзүп файрбейзтеги түзүлгөн датага жөнөтобүз, 
анан update кылабыз, delete кылабыз. 
7. Доступный плагинде Cloud Firestoreго кирип документацияны оку
7.1 Колдонмоңузга керектүү көз карандылыктарды жана кардар китепканаларын кошуңуз.
(flutter pub add cloud_firestore) => Бул плагин болгону үчүн проектини токтотуп кайра жүргүз.

8. add dataга (model)КЕЛЕЛЕКТЕН МУРУН БИЗ ТҮЗГӨН TODOS ДАТАНЫ БИЗДИН КОНСОЛГО КЕЛИШИН ТЕКШЕРИП АЛАЛЫ.
8.1. Cloud Firestore'го дайындарды кошконуңузду тез текшерүү үчүн => await db.collection("todos").get().then((event) {
for (var doc in event.docs) {print("${doc.id} => ${doc.data()}");}});
Бул үчүн асинхрондуу бир фукциянын ичине жайгаштырууңуз шарт жана бул үчүн statтин ичиндеги InitStat колдонушуңуз керек.
// БИЗ ТҮЗГӨН TODOS ДАТАНЫ БИЗДИН КОНСОЛГО АСИНХРОНДУУ ФУНКЦИЯНЫН ЖАРДАМЫ МЕНЕН АЛЫП КЕЛДИК. 
9. ADD DATA => Пиложениядан форманы толтуруп кнопканы басканда датага толтурулган форма барышы керек.
9.1 Жаңы add файлга форма UI түзөлү. Ал форманын текст талаасында валидация болушу керек. 
9.2. UI формабызды түзүп алгандан кийин Датага ылайыктуу проектке модель түзөлү. 
9.3. Формага жазган тексттерибизди сактап калуу үчүн TextEditingController колдонобуз 
10. Акыркы этап: Todo модель тизмеси менен Firestore'го маалыматтарды кошууну үйрөнүңүз.
Бул негизинен биздин формага кошо турган нерсе. Биз коллекция түзөбүз (todo) ага каалаган атыңызды берип, Firebase 
булут дүкөнүнө нерселерди кошобуз.
Алар төмөндөгүдөй: 
1. UI жазаган файлыңызга/state'ке/ асинфрондуу функция/ db = FirebaseFirestore.instance; базасы/
Моделге түзгөн датаны алабыз => final todo = Моделдеги дата => контроллердин text параметрлерин беребиз./await db.collection('').add(todo.ToMap());
2. Функциянын аталышын бир кнопкага байла жана формаңызды толтуруп Файрбейзтен күтүп алыңыз.
******************************************************************************************************************
ПРОЕКТКЕ КОШУМЧА:
READ
Кнопканы басканда загрузка болсун андан кийин форманы датага жүктөсүн андан кийин форма экинчи пйджке stream. 
1. showDialog 2. addTodo();
3. Колдонуучунун документин агым катары алып келиңиз.
UPDATE
1. Асинхрондуу updateTodos аттуу функция түз.
1.1 Бул функция моделдин аталышын алсын(TodoModel todo)
1.2.Функция денесине Файрбейзтеги магазиндин маанисин алсын жана датабазага барабарланыш керек.
1.3.датабаза бул келүүчү болгондуктан күтүү белгиси берилүүсү шарт. Анын ичинде коллекция бар, update кылууга коллекциянын аталышын атап кой.
1.4. Ошол эле колекциянын аталышынын документи бар ал todoдагы idни алат.
1.5.Биз тандаган IDнин ичиндеги isComplatedтин значениясы эмне болсо ошого карамакаршы бер(!).
Функциянын жумушу бүттү
2. StreamBuilder менен иш алып баруу. Бирок StreamBuilderдин кандай тиешеси бар экенин түшүнгөн жокмун. (..id = e.id)
3. // Күт дагы updateTodos()ту иштет.(ичине Checkboxтун todoсун берип койдук)
DELETE
1. UIга delete иконкасын чыгарып кой.
2. асинхрондуу delete функция түз ал денесине updateTodos функциясындай эле алсын бир гана өзгөчөсү idге delete берилиш керек.
 */

/*
Экинчи аракет Update Delete
1.

 */

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
