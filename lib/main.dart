import 'package:flutter/material.dart';
import 'package:calculator/CalcButton.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(Calculator());
}

class Calculator extends StatelessWidget {
  const Calculator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SimpleCalculator(),
    );
  }
}

class SimpleCalculator extends StatefulWidget {
  const SimpleCalculator({Key key}) : super(key: key);

  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  String _history=' ';
  String _exp=' ';

  void numClick(String txt){
    setState(() {
      _exp += txt;
    });
  }

  void allClear(String txt){
    setState(() {
      _history='';
      _exp='';
    });
  }

  void Clear(String txt){
    setState(() {
      _exp='';
    });
  }

  void Evaluate(String txt){

    Parser p = Parser();
    Expression exp = p.parse(_exp);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);


    setState(() {
      _history = _exp;
      _exp = eval.toString();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF283637),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(right: 12),
          child: Text(
            _history,
            style: GoogleFonts.rubik(
                textStyle: TextStyle(
                  fontSize: 26,
                  color: Color(0xFF545F61),
                )
            ),
          ),
          alignment: Alignment(1,1),
        ),
        Container(
          margin:EdgeInsets.fromLTRB(0, 0, 0, 10),
          padding: EdgeInsets.all(12),
          child: Text(
              _exp,
              style: GoogleFonts.rubik(
                textStyle: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                )
              ),
          ),
          alignment: Alignment(1,1),
        ),
         Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:<Widget>[
              CalcButton(
                text:"AC",
                fillColor:0xFF6C807F ,
                callback: allClear,
              ),
              CalcButton(
                text:"C",
                fillColor:0xFF6C807F ,
                callback: Clear,
              ),
              CalcButton(
                text:"%",
                fillColor:0xFFFFFFFF ,
                textColor: 0xFF658DAC,
                callback: numClick,
              ),
              CalcButton(
                text:"/",
                fillColor:0xFFFFFFFF ,
                textColor: 0xFF658DAC,
                callback: numClick,
              ),
            ]
        ),

         Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:<Widget>[
              CalcButton(
                text:"7",
                callback: numClick,
              ),
              CalcButton(
                text:"8",
                callback: numClick,
              ),
              CalcButton(
                text:"9",
                callback: numClick,
              ),
              CalcButton(
                text:"*",
                fillColor:0xFFFFFFFF ,
                textColor: 0xFF658DAC,
                textSize: 30,
                callback: numClick,
              ),
            ]
        ),

         Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:<Widget>[
              CalcButton(
                text:"4",
                callback: numClick,
              ),
              CalcButton(
                text:"5",
                callback: numClick,
              ),
              CalcButton(
                text:"6",
                callback: numClick,
              ),
              CalcButton(
                text:"-",
                fillColor:0xFFFFFFFF ,
                textColor: 0xFF658DAC,
                textSize: 30,
                callback: numClick,
              ),
            ]
        ),

         Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:<Widget>[
              CalcButton(
                text:"1",
                callback: numClick,
              ),
              CalcButton(
                text:"2",
                callback: numClick,
              ),
              CalcButton(
                text:"3",
                callback: numClick,
              ),
              CalcButton(
                text:"+",
                fillColor:0xFFFFFFFF ,
                textColor: 0xFF658DAC,
                textSize: 30,
                callback: numClick,
              ),
            ]
        ),

         Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:<Widget>[
              CalcButton(
                text:".",
                callback: numClick,
              ),
              CalcButton(
                text:"0",
                textSize: 26,
                callback: numClick,
              ),
              CalcButton(
                text:"00",
                textSize: 26,
                callback: numClick,
              ),
              CalcButton(
                text:"=",
                fillColor:0xFFFFFFFF ,
                textColor: 0xFF658DAC,
                textSize: 30,
                callback: Evaluate,
              ),
            ]
        ),

      ],
      ),
    );
  }
}



