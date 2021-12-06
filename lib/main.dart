import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fultter_codigo4_quiz/question_model.dart';
import 'package:fultter_codigo4_quiz/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List<Icon> scoreKeeper = [];

  QuizBrain mandarina = QuizBrain();

  void checkAnswer(bool userPickAnswer) {

    if(mandarina.isFinished() == true){

      Alert(
        context: context,
        type: AlertType.error,
        title: "RFLUTTER ALERT",
        desc: "Flutter is more awesome with RFlutter Alert.",
        buttons: [
          DialogButton(
            child: Text(
              "COOL",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();

      // reiniciamos el quizz
      mandarina.restart();
      // limpiamos la lista
      scoreKeeper.clear();
      setState(() {

      });

    }else{

      bool correctAnswer = mandarina.getQuestionAnswer();
      if (correctAnswer == userPickAnswer) {
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
      mandarina.nextQuestion();
      setState(() {});

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff212121),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  mandarina.getQuestionText(),
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
                    checkAnswer(true);
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
                    checkAnswer(false);
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
    );
  }
}
