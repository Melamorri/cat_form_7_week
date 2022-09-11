import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Опрос котовладельцев')),
        body: const Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  MyFormState createState() => MyFormState();
}

class MyFormState extends State {
  final _formKey = GlobalKey<FormState>();
  Gender? _gender;
  var _agreement = false;
  bool checkbox1 = false;
  bool checkbox2 = false;
  bool checkbox3 = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            const Text(
              'Кличка питомца:',
              style: TextStyle(fontSize: 20.0),
            ),
            TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 32.0),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 1.0),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty)
                    return 'Пожалуйста, укажите кличку питомца';
                }),
            const SizedBox(height: 20.0),
            const Text(
              'Имя владельца:',
              style: TextStyle(fontSize: 20.0),
            ),
            TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 32.0),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 1.0),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) return 'Пожалуйста, укажите ваше имя';
                }),
            const SizedBox(height: 20.0),
            const Text(
              'Контакты:',
              style: TextStyle(fontSize: 20.0),
            ),
            TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 32.0),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 1.0),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty)
                    return 'Пожалуйста, введите свои контактные данные';
                }),
            const SizedBox(height: 20.0),
            const Text(
              'Порода питомца:',
              style: TextStyle(fontSize: 20.0),
            ),
            TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 32.0),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 1.0),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty)
                    return 'Пожалуйста, укажите породу питомца';
                }),
            const SizedBox(height: 20.0),
            const Text(
              'Пол питомца:',
              style: TextStyle(fontSize: 20.0),
            ),
            RadioListTile(
              title: const Text('Самец'),
              value: Gender.male,
              groupValue: _gender,
              onChanged: (Gender? value) {
                setState(() {
                  if (value != null) _gender = value;
                });
              },
            ),
            RadioListTile(
              title: const Text('Самка'),
              value: Gender.female,
              groupValue: _gender,
              onChanged: (Gender? value) {
                setState(() {
                  if (value != null) _gender = value;
                });
              },
            ),
            const SizedBox(height: 20.0),
            Text(
              'Чем питается:',
              style: TextStyle(fontSize: 20.0),
            ),
            CheckboxListTile(
              title: Text(
                'Сухой корм',
                style: TextStyle(fontSize: 18.0),
              ),
              controlAffinity: ListTileControlAffinity.leading,
              value: checkbox1,
              onChanged: (value) {
                setState(() {
                  checkbox1 = !checkbox1;
                });
              },
            ),
            CheckboxListTile(
              title: Text(
                'Влажный корм',
                style: TextStyle(fontSize: 18.0),
              ),
              controlAffinity: ListTileControlAffinity.leading,
              value: checkbox2,
              activeColor: Colors.green,
              onChanged: (value) {
                setState(() {
                  checkbox2 = !checkbox2;
                });
              },
            ),
            CheckboxListTile(
              title: Text(
                'Натуральный корм',
                style: TextStyle(fontSize: 18.0),
              ),
              controlAffinity: ListTileControlAffinity.leading,
              value: checkbox3,
              onChanged: (value) {
                setState(() {
                  checkbox3 = !checkbox3;
                });
              },
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Color color = Colors.red;
                  String text;

                  if (_gender == null) {
                    text = 'Выберите пол питомца';
                  } else if (!checkbox1 && !checkbox2 && !checkbox3) {
                    text = 'Укажите хотя бы один тип корма';
                  } else {
                    text = 'Форма успешно заполнена';
                    color = Colors.green;
                  }

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(text),
                      backgroundColor: color,
                    ),
                  );
                }
              },
              child: const Text('Сохранить'),
            ),
          ],
        ),
      ),
    );
  }
}

enum Gender { male, female }
