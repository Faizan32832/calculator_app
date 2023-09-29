import 'package:calculator/constants.dart';
import 'package:calculator/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  bool isCalculated = false;
  var userInput = '';
  var answer = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 28, 28, 28),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(height: 10),
              const Row(
                children: [
                  SizedBox(width: 10),
                  Text(
                    "F-Calculator",
                    style: TextStyle(
                      fontSize: 38,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    userInput.toString(),
                    style: const TextStyle(
                        color: Color.fromARGB(255, 201, 194, 194),
                        fontSize: 50,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    answer.toString(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 55,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 18,
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: MyButton(
                          title: 'AC',
                          onPress: clear,
                        ),
                      ),
                      Expanded(
                        child: MyButton(
                          title: '+/-',
                          onPress: () {},
                        ),
                      ),
                      Expanded(
                        child: MyButton(
                          title: '%',
                          onPress: () {
                            if (isCalculated) clear();
                            userInput += '%';
                            setState(() {});
                          },
                        ),
                      ),
                      Expanded(
                        child: MyButton(
                          title: '/',
                          color: amberColor,
                          onPress: () {
                            userInput += '/';
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: MyButton(
                          title: '7',
                          onPress: () {
                            userInput += '7';
                            setState(() {});
                          },
                        ),
                      ),
                      Expanded(
                        child: MyButton(
                          title: '8',
                          onPress: () {
                            userInput += '8';
                            setState(() {});
                          },
                        ),
                      ),
                      Expanded(
                        child: MyButton(
                          title: '9',
                          onPress: () {
                            userInput += '9';
                            setState(() {});
                          },
                        ),
                      ),
                      Expanded(
                        child: MyButton(
                          title: 'x',
                          color: amberColor,
                          onPress: () {
                            userInput += 'x';
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: MyButton(
                          title: '4',
                          onPress: () {
                            userInput += '4';
                            setState(() {});
                          },
                        ),
                      ),
                      Expanded(
                        child: MyButton(
                          title: '5',
                          onPress: () {
                            userInput += '5';
                            setState(() {});
                          },
                        ),
                      ),
                      Expanded(
                        child: MyButton(
                          title: '6',
                          onPress: () {
                            userInput += '6';
                            setState(() {});
                          },
                        ),
                      ),
                      Expanded(
                        child: MyButton(
                          title: '-',
                          color: amberColor,
                          onPress: () {
                            userInput += '-';
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: MyButton(
                          title: '1',
                          onPress: () {
                            userInput += '1';
                            setState(() {});
                          },
                        ),
                      ),
                      Expanded(
                        child: MyButton(
                          title: '2',
                          onPress: () {
                            userInput += '2';
                            setState(() {});
                          },
                        ),
                      ),
                      Expanded(
                        child: MyButton(
                          title: '3',
                          onPress: () {
                            userInput += '3';
                            setState(() {});
                          },
                        ),
                      ),
                      Expanded(
                        child: MyButton(
                          title: '+',
                          color: amberColor,
                          onPress: () {
                            userInput += '+';
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: MyButton(
                          title: '0',
                          onPress: () {
                            userInput += '0';
                            setState(() {});
                          },
                        ),
                      ),
                      Expanded(
                        child: MyButton(
                          title: '.',
                          onPress: () {
                            userInput += '.';
                            setState(() {});
                          },
                        ),
                      ),
                      Expanded(
                        child: MyButton(
                          title: 'Del',
                          onPress: () {
                            userInput =
                                userInput.substring(0, userInput.length - 1);
                            setState(() {});
                          },
                        ),
                      ),
                      Expanded(
                        child: MyButton(
                          title: '=',
                          color: amberColor,
                          onPress: () {
                            equalPress();
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void clear() {
    setState(() {
      userInput = '';
      answer = '';
      isCalculated = false;
    });
  }

  void equalPress() {
    Parser parser = Parser();
    String finalUserInput = userInput.replaceAll('x', '*');
    Expression expression = parser.parse(finalUserInput);
    ContextModel contextModel = ContextModel();
    double evaluate = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = evaluate.toString().endsWith('.0')
        ? evaluate.toInt().toString()
        : evaluate.toString();
    isCalculated = true;
  }
}
