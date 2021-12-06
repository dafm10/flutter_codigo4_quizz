import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Icon> scoreKeeper = [];

  List<String> questions = [
    'El hombre llegó a la luna?',
    'La tierra es plana?',
    'Ella te ama?',
  ];

  List<bool> answers = [true, false, false];

  int questionNumber = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xff212121),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 5,
                child: Center(
                  child: Text(
                    questions[questionNumber],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: MaterialButton(
                    color: Colors.greenAccent,
                    child: Text('Verdadero'),
                    onPressed: () {
                      bool correctAnswer = answers[questionNumber];
                      if (correctAnswer == true) {
                        scoreKeeper.add(
                          const Icon(
                            Icons.check,
                            color: Colors.greenAccent,
                          ),
                        );
                      } else {
                        scoreKeeper.add(
                          const Icon(
                            Icons.close,
                            color: Colors.redAccent,
                          ),
                        );
                      }
                      questionNumber++;
                      setState(() {});
                    },
                  ),
                ),
              ),
              Expanded(
                // colocamos MaterialButton dentro para trabajar margenes
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: MaterialButton(
                    color: Colors.redAccent,
                    child: Text('Falso'),
                    onPressed: () {
                      bool correctAnswer = answers[questionNumber];
                      if (correctAnswer == false) {
                        scoreKeeper.add(
                          const Icon(
                            Icons.check,
                            color: Colors.greenAccent,
                          ),
                        );
                      } else {
                        scoreKeeper.add(
                          const Icon(
                            Icons.close,
                            color: Colors.redAccent,
                          ),
                        );
                      }
                      questionNumber++;
                      setState(() {});
                    },
                  ),
                ),
              ),
              Row(
                children: scoreKeeper,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
