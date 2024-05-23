
import 'package:flutter/material.dart';
import 'package:mobile_calculator_tassk3/calculator_button.dart';
import 'package:mobile_calculator_tassk3/color.dart';

import 'calculator_utilities.dart';

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
      debugShowCheckedModeBanner: false,
    );
  }
}

class CalculatorPage extends StatefulWidget {
  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
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
                        child: Text(CalculatorLogic.answerText, style: const TextStyle(color: Colors.white, fontSize: 54, fontWeight: FontWeight.w400),)
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
                          onPressed: (){
                            CalculatorLogic.clearScreen();
                            setState(() {});
                          },
                          backgroundColor:
                          ColorsAssets.singleValueOperatorsColor,
                        ),
                        CalculatorButton(
                            text: '+/-',
                            onPressed: (){
                              CalculatorLogic.addOrRemoveMinusSignPressed();
                              setState(() {});
                            },
                            backgroundColor:
                            ColorsAssets.singleValueOperatorsColor),
                        CalculatorButton(
                            text: '%',
                            onPressed: (){
                              CalculatorLogic.percentOperatorPressed();
                              setState(() {});
                            },
                            backgroundColor:
                            ColorsAssets.singleValueOperatorsColor),
                        CalculatorButton(
                            text: '÷',
                            onPressed: (){
                              CalculatorLogic.operationPressed("÷");
                              setState(() {});
                            },
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
                              CalculatorLogic.digitPressed("7");
                              setState(() {});
                            },
                            backgroundColor: ColorsAssets.numbersColor),
                        CalculatorButton(
                            text: '8',
                            onPressed: (){
                              CalculatorLogic.digitPressed("8");
                              setState(() {});
                            },
                            backgroundColor: ColorsAssets.numbersColor),
                        CalculatorButton(
                            text: '9',
                            onPressed: (){
                              CalculatorLogic.digitPressed("9");
                              setState(() {});
                            },
                            backgroundColor: ColorsAssets.numbersColor),
                        CalculatorButton(
                            text: 'x',
                            onPressed: (){
                              CalculatorLogic.operationPressed("x");
                              setState(() {});
                            },
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
                            onPressed:(){
                              CalculatorLogic.digitPressed("4");
                              setState(() {});
                            },
                            backgroundColor: ColorsAssets.numbersColor),
                        CalculatorButton(
                            text: '5',
                            onPressed: (){
                              CalculatorLogic.digitPressed("5");
                              setState(() {});
                            },
                            backgroundColor: ColorsAssets.numbersColor),
                        CalculatorButton(
                            text: '6',
                            onPressed: (){
                              CalculatorLogic.digitPressed("6");
                              setState(() {});
                            },
                            backgroundColor: ColorsAssets.numbersColor),
                        CalculatorButton(
                            text: '-',
                            onPressed: (){
                              CalculatorLogic.operationPressed("-");
                              setState(() {});
                            },
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
                            onPressed: (){
                              CalculatorLogic.digitPressed("1");
                              setState(() {});
                            },
                            backgroundColor: ColorsAssets.numbersColor),
                        CalculatorButton(
                            text: '2',
                            onPressed: (){
                              CalculatorLogic.digitPressed("2");
                              setState(() {});
                            },
                            backgroundColor: ColorsAssets.numbersColor),
                        CalculatorButton(
                          text: '3',
                          onPressed: (){
                            CalculatorLogic.digitPressed("3");
                            setState(() {});
                          },
                          backgroundColor: ColorsAssets.numbersColor,
                        ),
                        CalculatorButton(
                            text: '+',
                            onPressed: (){
                              CalculatorLogic.operationPressed("+");
                              setState(() {});
                            },
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
                          onPressed: (){
                            CalculatorLogic.digitPressed("0");
                            setState(() {});
                          },
                          flex: 2,
                          backgroundColor: ColorsAssets.numbersColor,
                        ),
                        CalculatorButton(
                          text: '.',
                          onPressed: (){
                            CalculatorLogic.dotPressed();
                            setState(() {});
                          },
                          backgroundColor: ColorsAssets.numbersColor,
                        ),
                        CalculatorButton(
                          text: '=',
                          onPressed: (){
                            CalculatorLogic.equalPressed();
                            setState(() {});
                          },
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

}
