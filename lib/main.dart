import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xff212121),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Expanded(
                flex: 5,
                child: Center(
                  child: Text(
                    'Aquí va las preguntas!!!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
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
                    },
                  ),
                ),
              ),
              Expanded( // colocamos MaterialButton dentro para trabajar margenes
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: MaterialButton(
                    color: Colors.redAccent,
                    child: Text('Falso'),
                    onPressed: () {
                    },
                  ),
                ),
              ),
              Row(
                children: const [
                  Icon(Icons.check, color: Colors.greenAccent,),
                  Icon(Icons.close, color: Colors.redAccent,),
                  Icon(Icons.check, color: Colors.greenAccent,),
                  Icon(Icons.close, color: Colors.redAccent,),
                  Icon(Icons.check, color: Colors.greenAccent,),
                  Icon(Icons.close, color: Colors.redAccent,),
                  Icon(Icons.check, color: Colors.greenAccent,),
                  Icon(Icons.close, color: Colors.redAccent,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
