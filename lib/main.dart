import 'package:flutter/material.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "lecture",
      home: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Fill this out in the next step.
    return Scaffold(
      appBar: AppBar(
        title: Text('lecture de valeur'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: myController,
          decoration: const InputDecoration(
            hintText: 'votre age ici',
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          return showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text(evaluation()),
                );
              });
        },
        tooltip: 'appuyez pour tester',
        child: Icon(Icons.text_fields),
      ),
    );
  }

  String evaluation() {
    int age = 0;
    String message = "votre ages est " + myController.text + "vous êtes ";
    try {
      age = int.parse(myController.text);
    } catch (exp) {
      return "veuillez saisir un entier";
    }
    if (age < 18)
      return message + " mineur";
    else
      return message + " majeur";
  }
}
