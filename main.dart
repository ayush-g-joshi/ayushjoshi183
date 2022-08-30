import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'button.dart';

void main() {
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ); // MaterialApp
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userInput = '';
  var answer = '';
  var count = 0;
  var pcount=0;
  var mcount=0;
  var mulcount=0;
  var divcount=0;
  final List<String>operator=["+","-","x","/"];

  final List<String> buttons = [
    'Clear',
    '',
    '',
    'Delete',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    'x',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '=',
    '+',
  ];





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(

        backgroundColor: Colors.white,
        title: new Text("Calculator", style: TextStyle(color: Colors.black),),
      ), //AppBar
      backgroundColor: Colors.blue,
      body: Column(
        children: <Widget>[


          Expanded(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[

              Container(

                alignment: Alignment.bottomRight,
                child: Text(
                  userInput,
                  style: TextStyle(fontSize: 25, color: Colors.black),
                ),
              ),
              Container(

                alignment: Alignment.bottomRight,
                child: Text(
                  answer,
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              )
            ]),
          ),

          Expanded(
            flex: 2,
            child: Container(

              child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {

                    if (index == 0) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                     count=0;
                            mcount=0;
                            pcount=0;
                            mulcount=0;
                            divcount=0;
                            userInput = '';
                            answer = '';
                          });
                        },
                        buttonText: buttons[index],
                        textColor: Colors.blue,
                        color: Colors.white,
                      );
                    } else if (index == 3) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            pcount=0;
                            mcount=0;
                            count=0;
                            mulcount=0;
                            divcount=0;

                            userInput = userInput.substring(0, userInput.length - 1);

                          });
                        },
                        buttonText: buttons[index],
                        textColor: Colors.blue,
                        color: Colors.white,
                      );
                    } else if (index == 18) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            equalPressed();
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.white,
                        textColor: Colors.black,
                      );
                    }
                    else if (index == 17) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            mulcount=1;
                            mcount=1;
                            divcount=1;

                            if (count == 0) {
                              userInput = userInput+ ".";
                              count++;
                              pcount++;
                            }

                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.white,
                        textColor: Colors.black,
                      );
                    }

                    else if (index == 19) {
                      return MyButton(
                        buttontapped: () {

                          setState(() {
                            mulcount=1;
                            mcount++;
                            divcount=1;

                            if (pcount == 0) {
                              userInput = userInput+ "+";
                              pcount++;
                              count=0;

                            }

                         else {
                           userInput = userInput.replaceRange(
                               userInput.length - 1, userInput.length, "+");
                         count++;
                         pcount++;
                         }


                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.white,
                        textColor: Colors.blue,
                      );
                    }

                    else if (index == 15) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                          pcount=1;
                          divcount=1;
                          mulcount=1;


                            if (mcount == 0) {
                              userInput = userInput+ "-";
                              mcount++;
                              count=0;
                            }
                            else {
                              userInput = userInput.replaceRange(
                                  userInput.length - 1, userInput.length, "-");
                              count++;
                            }

                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.white,
                        textColor: Colors.blue,
                      );
                    }
                    else if (index == 11) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                             divcount=1;
                             mcount=1;
                             pcount=1;

                            if (mulcount == 0) {
                              userInput = userInput+ "x";
                              mulcount++;
                              count=0;
                            }
                            else {
                              userInput = userInput.replaceRange(
                                  userInput.length - 1, userInput.length, "x");
                            count++;
                            }
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.white,
                        textColor: Colors.blue,
                      );
                    }
                    else if (index == 7) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {

                            pcount=1;
                            mulcount=1;
                            mcount=1;

                            if (divcount == 0) {
                              userInput = userInput+ "/";
                              divcount++;
                              count=0;
                            }
                            else {
                              userInput = userInput.replaceRange(
                                  userInput.length - 1, userInput.length, "/");
                            count++;
                            }
                            });
                        },
                        buttonText: buttons[index],
                        color: Colors.white,
                        textColor: Colors.blue,
                      );
                    }
                    else if (index == 4 || index == 5 || index == 6|| index == 8 || index == 9 || index == 10 || index == 12 || index == 13 || index == 14|| index == 16  ) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userInput += buttons[index];

                            pcount=0;
                            mcount=0;
                            mulcount=0;
                            divcount=0;
                          });

                        },
                        buttonText: buttons[index],
                        color: Colors.white,
                        textColor: Colors.black,
                      );}

                    else  {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userInput += buttons[index];
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.white,
                        textColor: Colors.black,

                      );
                    }

                  }), // GridView.builder
            ),
          ),
        ],
      ),
    );
  }

  void equalPressed() {
    String finaluserinput = userInput;
    finaluserinput = userInput.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
  }

}

