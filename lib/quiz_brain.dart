
import 'package:fultter_codigo4_quiz/question_model.dart';

class QuizBrain{

  List<Question> _questions = [
    Question(questionText: '¿El hombre llegó a la luna?', questionAnswer: true),
    Question(questionText: '¿La Tierra es plana?', questionAnswer: false),
    Question(questionText: '¿Ella te ama?', questionAnswer: false),
    Question(questionText: '¿Desayunaste?', questionAnswer: true)
  ];

  int _questionNumber = 0;

  String getQuestionText(){
    return _questions[_questionNumber].questionText;
  }

  bool getQuestionAnswer(){
    return _questions[_questionNumber].questionAnswer;
  }

  nextQuestion() {
    if (_questionNumber < _questions.length - 1) {
      _questionNumber++;
    }
  }

  // Quiz finalizado
  bool isFinished(){
    if(_questionNumber >= _questions.length - 1) {
      return true;
    }
    return false;
  }

  // Quiz reiniciando
  void restart(){
    _questionNumber = 0;
  }

}