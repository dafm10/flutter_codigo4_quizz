import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fultter_codigo4_quiz/question_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Icon> scoreKeeper = [];

  List<Question> questions = [
    Question(questionText: '¿El hombre llegó a la luna?', questionAnswer: true),
    Question(questionText: '¿La Tierra es plana?', questionAnswer: false),
    Question(questionText: '¿Ella te ama?', questionAnswer: false),
    Question(questionText: '¿Desayunaste?', questionAnswer: true)
  ];

  int questionNumber = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xff212121),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 5,
                child: Center(
                  child: Text(
                    questions[questionNumber].questionText,
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
                    child: const Text('Verdadero'),
                    onPressed: () {
                      bool correctAnswer = questions[questionNumber].questionAnswer;
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
                    child: const Text('Falso'),
                    onPressed: () {
                      bool correctAnswer = questions[questionNumber].questionAnswer;
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
