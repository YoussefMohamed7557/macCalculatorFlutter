
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_calculator_tassk3/calculator_button.dart';
import 'package:mobile_calculator_tassk3/color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    return MaterialApp(
      title: 'Flutter Demo',
      home: CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String answerText ='0';
  double firstNumber = 0.0;
  double secondNumber = 0.0;
  double answer = 0.0;
  String currentOperation = '';
  String previousOperation = '';
  bool operationIsNotPressed = true;
  bool firstOperationPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Center(
            child: Text(
              'Calculator',
              style: TextStyle(
                  color: Colors.white, fontSize: 26, fontWeight: FontWeight.w700),
            )),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
           Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.all(32.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                        child: Text(answerText, style: const TextStyle(color: Colors.white, fontSize: 54, fontWeight: FontWeight.w400),)
                    ),
                  ],
                ),
              )
          ),
          Expanded(
            flex: 5,
            child: Container(
              padding: EdgeInsets.all(4),
              color: Colors.transparent,
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        CalculatorButton(
                          text: 'c',
                          onPressed: (){},
                          backgroundColor:
                          ColorsAssets.singleValueOperatorsColor,
                        ),
                        CalculatorButton(
                            text: '+/-',
                            onPressed: (){},
                            backgroundColor:
                            ColorsAssets.singleValueOperatorsColor),
                        CalculatorButton(
                            text: '%',
                            onPressed: percentOperatorPressed ,
                            backgroundColor:
                            ColorsAssets.singleValueOperatorsColor),
                        CalculatorButton(
                            text: '÷',
                            onPressed: (){},
                            backgroundColor:
                            ColorsAssets.multiValueOperatorsColor),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        CalculatorButton(
                            text: '7',
                            onPressed: (){
                              digitPressed("7");
                            },
                            backgroundColor: ColorsAssets.numbersColor),
                        CalculatorButton(
                            text: '8',
                            onPressed: (){},
                            backgroundColor: ColorsAssets.numbersColor),
                        CalculatorButton(
                            text: '9',
                            onPressed: (){},
                            backgroundColor: ColorsAssets.numbersColor),
                        CalculatorButton(
                            text: 'x',
                            onPressed: (){},
                            backgroundColor:
                            ColorsAssets.multiValueOperatorsColor),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        CalculatorButton(
                            text: '4',
                            onPressed:(){},
                            backgroundColor: ColorsAssets.numbersColor),
                        CalculatorButton(
                            text: '5',
                            onPressed: (){},
                            backgroundColor: ColorsAssets.numbersColor),
                        CalculatorButton(
                            text: '6',
                            onPressed: (){},
                            backgroundColor: ColorsAssets.numbersColor),
                        CalculatorButton(
                            text: '-',
                            onPressed: (){},
                            backgroundColor:
                            ColorsAssets.multiValueOperatorsColor),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        CalculatorButton(
                            text: '1',
                            onPressed: (){},
                            backgroundColor: ColorsAssets.numbersColor),
                        CalculatorButton(
                            text: '2',
                            onPressed: (){},
                            backgroundColor: ColorsAssets.numbersColor),
                        CalculatorButton(
                          text: '3',
                          onPressed: (){},
                          backgroundColor: ColorsAssets.numbersColor,
                        ),
                        CalculatorButton(
                            text: '+',
                            onPressed: (){},
                            backgroundColor:
                            ColorsAssets.multiValueOperatorsColor),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        CalculatorButton(
                          text: '0',
                          onPressed: (){},
                          flex: 2,
                          backgroundColor: ColorsAssets.numbersColor,
                        ),
                        CalculatorButton(
                          text: '.',
                          onPressed: (){},
                          backgroundColor: ColorsAssets.numbersColor,
                        ),
                        CalculatorButton(
                          text: '=',
                          onPressed: (){},
                          backgroundColor:
                          ColorsAssets.multiValueOperatorsColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  void clearScreen() {
    answerText = '0';
    //setState(() {});
  }
  void addOrRemoveMinusSignPressed(){
    if (answerText.contains('-')){
      answerText = answerText.replaceAll('-', '');
    }else{
      if(answerText != '0'){
        String temp = '-';
        temp = temp + answerText;
        answerText = temp;
        // setState(() { });
      }
    }
  }

  void setDefaultValues(){
    answerText ='0';
    firstNumber = 0.0;
    secondNumber = 0.0;
    answer = 0.0;
    currentOperation = '';
    previousOperation = '';
    operationIsNotPressed = true;
    firstOperationPressed = false;
    // setState(() { });
  }

  String getAnswerFrom({required String firstNumber,required String secondNumber,required String operator}) {
    double answer = 0.0;
    double fn = double.parse(firstNumber);
    double sn = double.parse(secondNumber);
    switch (operator) {
      case '+':
        answer = fn + sn;
        break;
      case '-':
        answer = fn - sn;
        break;
      case 'x':
        answer = fn * sn;
        break;
      case '÷':
        answer = fn / sn;
        break;
    }
    return answer.toString();
  }
  void digitPressed(String btnText){
    answerText += btnText;
    setState(() {}); 
  }

  void percentOperatorPressed(){
    double number = double.parse(answerText);
    answer = number / 100;
    answerText = answer.toString();
    //  setState(() {});
  }

}
