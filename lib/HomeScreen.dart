import 'package:calculator/CalcButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _history = ""; // This will store the previous expression
  String _expression = ""; // This will store the expression being evaluated
  // This will store the expression being evaluated

  void numClick (String text) {
    setState(() {
      _expression += text;
    });
  }

  void allClear (String text) {
    setState(() {
      _history = "";
      _expression = "";
    });
  }

  void clear (String text) {
    setState(() {
      _expression = "";
    });
  }

  void evaluate (String text) {
    late String temp;

    // EASTER EGG
    if(_expression == "/**/00") {
      temp = "Created by Maulik";
    }
    else {
      Parser p = Parser();
      Expression exp = p.parse(_expression);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      temp = eval.toString();

      // Gets last 2 characters from eval and if it is ".0" then removes it
      var newString = temp.substring((temp.length - 2).clamp(0, temp.length));
      if (newString == ".0") {
        temp = temp.substring(0, temp.length - 2);
      }
    }
    setState(() {
      _history = _expression;
      _expression = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      home: Scaffold(
        backgroundColor: const Color(0xFF5776E0),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(right: 12.0),
              alignment: const Alignment(1 ,1),
              child: Text(_history,
                style: GoogleFonts.rubik(
                  textStyle: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12.0),
              alignment: const Alignment(1 ,1),
              child: Text(
                _expression,
                style: GoogleFonts.rubik(
                  textStyle: const TextStyle(
                    fontSize: 48,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Container(
              color: const Color(0xFFEAEDFE),
              child: Column(
                children: [
                  Container(
                    color: const Color(0xFFEAEDFE),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CalcButton(
                          text: "AC",
                          fillColor: 0xFFFAD5CF,
                          textSize: 22.0,
                          callback: allClear,
                        ),
                        CalcButton(
                          text: "(",
                          fillColor: 0xFFEAEDFE,
                          textColor: 0xFF5E73CC,
                          callback: numClick,
                        ),
                        CalcButton(
                          text: ")",
                          fillColor: 0xFFEAEDFE,
                          textColor: 0xFF5E73CC,
                          callback: numClick,
                        ),
                        CalcButton(
                          text: "/",
                          fillColor: 0xFFEAEDFE,
                          textColor: 0xFF5E73CC,
                          callback: numClick,
                        ),
                      ],
                    ),
                  ),


              Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalcButton(
                      text: "7",
                      fillColor: 0xFFFFFFFF,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: "8",
                      fillColor: 0xFFFFFFFF,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: "9",
                      fillColor: 0xFFFFFFFF,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: "*",
                      fillColor: 0xFFEAEDFE,
                      textColor: 0xFF5E73CC,
                      callback: numClick,
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalcButton(
                      text: "4",
                      fillColor: 0xFFFFFFFF,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: "5",
                      fillColor: 0xFFFFFFFF,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: "6",
                      fillColor: 0xFFFFFFFF,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: "-",
                      fillColor: 0xFFEAEDFE,
                      textColor: 0xFF5E73CC,
                      callback: numClick,
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalcButton(
                      text: "1",
                      fillColor: 0xFFFFFFFF,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: "2",
                      fillColor: 0xFFFFFFFF,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: "3",
                      fillColor: 0xFFFFFFFF,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: "+",
                      fillColor: 0xFFEAEDFE,
                      textColor: 0xFF5E73CC,
                      callback: numClick,
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalcButton(
                      text: ".",
                      fillColor: 0xFFFFFFFF,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: "0",
                      fillColor: 0xFFFFFFFF,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: "00",
                      fillColor: 0xFFFFFFFF,
                      textSize: 25.0,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: "=",
                      fillColor: 0xFFCFDAFA,
                      textColor: 0xFF5E73CC,
                      callback: evaluate,
                    ),
                  ],
                ),
              ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}