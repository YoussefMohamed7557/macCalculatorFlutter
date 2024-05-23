
class CalculatorLogic{
  static String answerText ="0";
  static double firstNumber = 0.0;
  static double secondNumber = 0.0;
  static double answer = 0.0;
  static String currentOperation = "non";
  static String previousOperation = "non";
  static bool operationIsNotPressed = true;
  static bool firstOperationPressed = false;
  static bool waitSecondNumber = false;
  static void clearScreen() {
    answerText ='0';
    firstNumber = 0.0;
    secondNumber = 0.0;
    answer = 0.0;
    currentOperation = "non";
    previousOperation = "non";
    operationIsNotPressed = true;
    firstOperationPressed = false;
    waitSecondNumber = false;
  }
  static void addOrRemoveMinusSignPressed(){
    if (answerText.contains('-')){
      answerText = answerText.replaceAll('-', '');
    }else{
      if(answerText != '0'){
        String temp = '-';
        temp = temp + answerText;
        answerText = temp;
      }
    }
  }
  static void dotPressed(){
    if(!answerText.contains('.')){
      answerText += ".";
    }
  }
  static void percentOperatorPressed(){
    double number = double.parse(answerText);
    answer = number / 100;
    answerText = (answer % 1 == 0) ? answer.toInt().toString() : answer.toString();
  }
  static String getAnswerFrom({required String firstNumber,required String secondNumber,required String operator}) {
    double answer = 0.0;
    double fn = double.parse(firstNumber);
    double sn = double.parse(secondNumber);
    switch (operator) {
      case "+":
        answer = fn + sn;
        break;
      case "-":
        answer = fn - sn;
        break;
      case "x":
        answer = fn * sn;
        break;
      case "÷":
        answer = fn / sn;
        break;
    }
    print("fistNumber is $fn , secondNumber is $sn , operator is $operator answer is equal $answer");
    return (answer % 1 == 0) ? answer.toInt().toString() : answer.toString();
  }


  static void digitPressed(String btnText){
    if (answerText == "0"){
      answerText = "";
    }
    if(operationIsNotPressed){
      answerText += btnText;
    }else{
      answerText = btnText;
      operationIsNotPressed = true;
    }
    waitSecondNumber = false;
  }

  static void equalPressed(){
    if (!waitSecondNumber) {
      firstNumber = answer;
      secondNumber = double.parse(answerText);
      String temp = getAnswerFrom(firstNumber: firstNumber.toString(),
          secondNumber: secondNumber.toString(),
          operator: currentOperation);
      answer = double.parse(temp);
      answerText = (answer % 1 == 0) ? answer.toInt().toString() : answer.toString();
      firstNumber = 0.0;
      secondNumber = 0.0;
      answer = 0.0;
      currentOperation = "non";
      previousOperation = "non";
      operationIsNotPressed = true;
      firstOperationPressed = false;
      waitSecondNumber = false;
    }
  }
  static void operationPressed(String sign){
    operationIsNotPressed = false;
    if(firstOperationPressed) {
      print("case 1");
      previousOperation = currentOperation;
      currentOperation = sign;
      firstNumber = answer;
      secondNumber = double.parse(answerText);

      String temp = getAnswerFrom(firstNumber: firstNumber.toString(),
          secondNumber: secondNumber.toString(),
          operator: previousOperation);
      answer = double.parse(temp);
      answerText = (answer % 1 == 0) ? answer.toInt().toString() : answer.toString();
    }else{
      print("case 2");
      if (answerText != "0"){
        firstOperationPressed = true;
        currentOperation = sign;
        print("pressed operation $currentOperation");
        firstNumber = secondNumber = answer = double.parse(answerText);
        answerText = (answer % 1 == 0) ? answer.toInt().toString() : answer.toString();
      }
    }
    waitSecondNumber = true;
  }
}