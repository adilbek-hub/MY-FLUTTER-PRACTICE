import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todo/home/second_page.dart';
import 'package:todo/model/todos_model.dart';
import 'package:todo/theme/colors.dart';

//Create a AddTodo widget.
class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

// Тиешелүү State классын түзүңүз.
// Бул класс формага тиешелүү маалыматтарды камтыйт
class _AddTodoState extends State<AddTodo> {
  final _formKey = GlobalKey<FormState>();
  // 3. isComplated деген бир bool создавайтеттик
  bool isComplated = false;
  /*
  Текст талаасына өзгөртүүлөр менен иштөө.
Кээ бир учурларда, текст талаасындагы текст өзгөргөн сайын кайра чалуу функциясын иштетүү пайдалуу. Мисалы, сиз 
автотолуктоо функциясы менен издөө экранын кургуңуз келиши мүмкүн, анда натыйжаларды колдонуучу түрү катары 
жаңырткыңыз келет.
Текст өзгөргөн сайын кайра чалуу функциясын кантип иштетесиз? Flutter менен сизде эки вариант бар:
1.TextField же TextFormField үчүн onChanged() кайра чалуу менен камсыз кылуу.
2.TextEditingController колдонуңуз.
******************************************************************************************************************
1. TextField же TextFormField/ үчүн onChanged() кайра чалуу менен камсыз кылуу
Эң жөнөкөй ыкма TextField же TextFormField үчүн onChanged() кайра чалуу менен камсыз кылуу. Текст өзгөргөндө, 
кайра чалуу чакырылат.

2. TextEditingController колдонуңуз
Күчтүү, бирок татаалыраак ыкма TextField же TextFormField контроллер касиети катары TextEditingController менен
 камсыз кылуу болуп саналат.
Текст өзгөргөндө эскертүү алуу үчүн, төмөнкү кадамдарды колдонуу менен addListener() ыкмасын колдонуп контроллерди
 угуңуз:
 1.TextEditingController түзүңүз.
 2.TextEditingControllerди текст талаасына туташтырыңыз.
 3.Акыркы маанини басып чыгаруу үчүн функция түзүңүз.
 4.Өзгөртүүлөр үчүн контроллерди угуңуз.

 // Текст контроллерин түзүү. Кийинчерээк, аны алуу үчүн колдонуңуз
// TextField учурдагы мааниси.
   */
  // TextEditingController() бул ар бир TextFormFieldти контролдойт. Анын ичинде эмне жазлды, Эмне жазылыш керек, же ичине
  //жазылган кандай форматта болуш керек, мисалы номер жазылыш керек десек болот. Же телефон номерди жазып баштоодо
  // по умолчанию +996 деп чыгат ошого окшогондорду ушул TextEditingController() менен башкарабыз.
  final titleController = TextEditingController();
  // TextEditingController() бул ар бир TextFormFieldти контролдойт. Анын ичинде эмне жазлды, Эмне жазылыш керек, же ичине
  //жазылган кандай форматта болуш керек, мисалы номер жазылыш керек десек болот. Же телефон номерди жазып баштоодо
  // по умолчанию +996 деп чыгат ошого окшогондорду ушул TextEditingController() менен башкарабыз.
  final descriptionController = TextEditingController();
  // TextEditingController() бул ар бир TextFormFieldти контролдойт. Анын ичинде эмне жазлды, Эмне жазылыш керек, же ичине
  //жазылган кандай форматта болуш керек, мисалы номер жазылыш керек десек болот. Же телефон номерди жазып баштоодо
  // по умолчанию +996 деп чыгат ошого окшогондорду ушул TextEditingController() менен башкарабыз.
  final authorController = TextEditingController();

// Firestorдогу коллекцияга биз жазган controllerлин тексттери барсын.
// Ал үчүн асинхрондуу функция
  Future<void> addTodo() async {
    // Firestoreог экземплярлоо то есть дата базаны алабыз.
    final db = FirebaseFirestore.instance;
    // TodoModel датасын алабыз жана файрсторго контролдун тексттери барыш үчүн контроллерди бекитебиз жана todoга барабарлайбыз
    final todo = TodoModel(
        title: titleController.text,
        isComplated: isComplated,
        author: authorController.text,
        description: descriptionController.text);
    // todos атту коллекцияга текст добавитетүү(add документти (id) өзү пайда кылат)
    await db.collection("todos").add(todo.toMap());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('AddTodoPage'),
        ),
        //Form => Приложения часто требуют, чтобы пользователи вводили информацию в текстовое поле. Например,
        //вы можете потребовать, чтобы пользователи входили в систему, используя комбинацию адреса электронной
        //почты и пароля.
        //Чтобы сделать приложения безопасными и простыми в использовании, проверьте достоверность предоставленной
        //пользователем информации. Если пользователь правильно заполнил форму, обработайте информацию. Если
        //пользователь отправляет неверную информацию, отобразите понятное сообщение об ошибке, сообщающее ему,
        // что пошло не так.
        //В этом примере вы узнаете, как добавить проверку в форму с одним текстовым полем, выполнив следующие
        //действия.
        /*1.Create a Form with a GlobalKey.
        Биринчиден, форма түзүңүз. Форма виджети бир нече форма талааларын топтоо жана текшерүү үчүн контейнер
         катары иштейт.
        Форманы түзүп жатканда, GlobalKey менен камсыз кылыңыз. Бул форманы уникалдуу түрдө аныктайт жана форманы 
        кийинки кадамда текшерүүгө мүмкүндүк берет.*/
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/ocean.jpg'),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            // 1.Form листвюдагы бардык нерселерди бир формага ороп койдук.
            child: Form(
              //2. Ошол форманын ичи толтурулганы же толтурулбаганын билүү үчүн _formKey койдук
              key: _formKey,
              //
              child: ListView(
                children: [
                  /*2.Add a TextFormField with validation logic.
                    Форма ордунда болгону менен, колдонуучуларга текстти киргизүүгө мүмкүнчүлүк жок. Бул TextFormField 
                    жумушу. TextFormField виджети материалдык дизайн текст талаасын көрсөтөт жана алар пайда болгондо 
                    текшерүү каталарын көрсөтө алат.
                    TextFormField үчүн validator() функциясын берүү менен киргизүүнү ырастаңыз. Колдонуучунун киргизгени
                     туура эмес болсо, валидатор функциясы ката кабарын камтыган Стринди кайтарат. Эгерде каталар жок 
                     болсо, валидатор нөлдү кайтарышы керек.
                    Бул мисал үчүн, TextFormField бош эмес экенине кепилдик берүүчү валидаторду түзүңүз. Ал бош болсо,
                     достук ката билдирүүсүн кайтарыңыз.
                    */
                  //Текст формасы талаасы
                  TextFormField(
                    // Title текст талаасындагы текстти контролдоо үчүн
                    controller: titleController,
                    //decoration=> жасалгалоо, кооздоо/ InputDecoration=> ички кооздолуусу, жасалгалоосу
                    decoration: const InputDecoration(
                        //Эгер чын болсо, декорациянын контейнери [fillColor] менен толтурулат.
                        filled: true,
                        fillColor: AppColors.textFormFieldColor,
                        // hintText:=> тексттин подсказкасы
                        hintText: 'Title',
                        // border:=> чек арасы / OutlineInputBorder() => контр киргизүү чек арасы
                        border: OutlineInputBorder(
                            // чектин радиусу
                            borderRadius:
                                BorderRadius.all(Radius.circular(15)))),
                    //  validator: => тексттин бар жогун текшергич
                    validator: (value) {
                      // Эгер текшергич алган маани нулга барабар болсо жана маани пустой болсо
                      if (value == null || value.isEmpty) {
                        //'Please add some text' текстин кайтар
                        return 'Please add some text';
                        // анда
                      } else {
                        // нул кайтар өз жолу менен кетсин
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //Текст формасы талаасы
                  TextFormField(
                    // Description текст талаасындагы текстти контролдоо үчүн
                    controller: descriptionController,
                    // maxLines => сызыкты өзүнөн 7 эсе чоңойтуп берет
                    maxLines: 7,
                    //  decoration => Текст форма талаасын жасалгалайт/InputDecoration => Текст форма талаасын жасалгалайт
                    decoration: const InputDecoration(
                        //Эгер чын болсо, декорациянын контейнери [fillColor] менен толтурулат.
                        filled: true,
                        fillColor: AppColors.textFormFieldColor,
                        // hintText => Тексттин подсказкасы
                        hintText: 'Description',
                        // border:=> чек арасы / OutlineInputBorder() => контр киргизүү чек арасы
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        )),
                    // validator => тексттин бар жогун текшергич
                    validator: (value) {
                      // Эгер текшерүүчүнүн мааниси нулга барабар болсо жана маани пустой болсо
                      if (value == null || value.isEmpty) {
                        // 'Please add some text'текстин кайтра
                        return 'Please add some text';
                        //Эгер андай эмес болсо
                      } else {
                        // нул кайтар, өз жолу менен кетсин
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //ListTile с флажком. Другими словами, флажок с меткой.
                  CheckboxListTile(
                      title: const Text('Click here'),
                      checkColor: Color.fromARGB(255, 255, 255, 255),
                      activeColor: Color.fromARGB(255, 132, 252, 132),
                      tileColor: Color.fromARGB(255, 238, 198, 184),
                      // ListTile маани алат. Ал маани флажокту басканда метка пайда болуп, өчүп туруусу үчүн атайын булен.
                      value: isComplated,
                      // өзгөртүлгөн боюнча ал булен алат, булен маанисинин аталышы isCompletedUchun =>
                      onChanged: ((bool? isCompletedUchun) {
                        setState(() {
                          isComplated = isCompletedUchun ?? false;
                        });
                      })),
                  const SizedBox(
                    height: 20,
                  ),
                  //Текст формасы талаасы
                  TextFormField(
                    // Author текст талаасындагы текстти контролдоо үчүн
                    controller: authorController,
                    //decoration=> жасалгалоо, кооздоо
                    decoration: const InputDecoration(
                        //Эгер чын болсо, декорациянын контейнери [fillColor] менен толтурулат.
                        filled: true,
                        fillColor: AppColors.textFormFieldColor,
                        // Тексттин подсказкасы
                        hintText: 'Author',
                        // Чек ара сызыгын берүү
                        border: OutlineInputBorder(
                            //чек ара сызыгынын радиусун берүү
                            borderRadius:
                                BorderRadius.all(Radius.circular(15)))),
                    //validator => текшерүүчү
                    validator: (value) {
                      // Эгер текшерүүнүн мааниси нулга(форма толтурулбаса) жана ал пустой болсо
                      if (value == null || value.isEmpty) {
                        // 'Please add some text' текстин кайтарып бер
                        return 'Please add some text';
                      } else {
                        // Болбосо нул кайтар

                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  /*3.Create a button to validate and submit the form.
                  Эми сизде текст талаасы бар форма болгондон кийин, колдонуучу маалымат тапшыра турган баскычты бериңиз.
                  Колдонуучу форманы тапшырууга аракет кылганда, форманын жарактуу экенин текшериңиз. Эгер ошондой болсо,
                  ийгиликтүү билдирүүнү көрсөтүңүз. Эгерде ал жок болсо (текст талаасында мазмун жок) ката билдирүүсүн 
                  көрсөтөт.
                  */
                  ElevatedButton(
                      onPressed: (() async {
                        //Текшерүү форма толтурулган болсо чындыкты кайтарат, же болбосо жалган.
                        if (_formKey.currentState!.validate()) {
                          showDialog(
                              barrierColor: Colors.black87,
                              context: context,
                              builder: (context) {
                                return const CupertinoAlertDialog(
                                  title: Text('Сураныч күтө туруңуз'),
                                  content: CupertinoActivityIndicator(
                                    color: Colors.orange,
                                    radius: 30,
                                  ),
                                );
                              });
                          // Загрузка болуп аткан учурда addTodo() болот.addTodo() функциясына барабыз
                          await addTodo();
                          // ignore: use_build_context_synchronously

                          Navigator.popUntil(context, (route) => route.isFirst);
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: ((context) => const SecondPage())));
                        }
                      }),
                      child: const Text('basss'))
                ],
              ),
            ),
          ),
        ));
  }
}
