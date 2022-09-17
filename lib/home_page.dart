import 'package:flutter/material.dart';
import 'package:iphone_calculator_app/Components/buttons.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userInput = "";
  var answer = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Align(
                            alignment: Alignment.bottomRight,
                            child: Text(userInput.toString(),
                                style: const TextStyle(
                                    fontSize: 30, color: Colors.white))),
                        Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              answer.toString(),
                              style: const TextStyle(
                                  fontSize: 30, color: Colors.white),
                            )),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          MyButton.MyButton(
                            title: "AC",
                            onPress: () {
                              userInput = "";
                              answer = "";
                              setState(() {});
                            },
                          ),
                          MyButton.MyButton(
                            title: "+/-",
                            onPress: () {
                              userInput += "+/-";
                              setState(() {});
                            },
                          ),
                          MyButton.MyButton(
                            title: "%",
                            onPress: () {
                              userInput += "%";
                              setState(() {});
                            },
                          ),
                          MyButton.MyButton(
                            color: Colors.orange,
                            title: "/",
                            onPress: () {
                              userInput += "/";
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          MyButton.MyButton(
                            title: "7",
                            onPress: () {
                              userInput += "7";
                              setState(() {});
                            },
                          ),
                          MyButton.MyButton(
                            title: "8",
                            onPress: () {
                              userInput += "8";
                              setState(() {});
                            },
                          ),
                          MyButton.MyButton(
                            title: "9",
                            onPress: () {
                              userInput += "9";
                              setState(() {});
                            },
                          ),
                          MyButton.MyButton(
                            color: Colors.orange,
                            title: "x",
                            onPress: () {
                              userInput += "x";
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          MyButton.MyButton(
                            title: "4",
                            onPress: () {
                              userInput += "4";
                              setState(() {});
                            },
                          ),
                          MyButton.MyButton(
                            title: "5",
                            onPress: () {
                              userInput += "5";
                              setState(() {});
                            },
                          ),
                          MyButton.MyButton(
                            title: "6",
                            onPress: () {
                              userInput += "6";
                              setState(() {});
                            },
                          ),
                          MyButton.MyButton(
                            color: Colors.orange,
                            title: "-",
                            onPress: () {
                              userInput += "-";
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          MyButton.MyButton(
                            title: "1",
                            onPress: () {
                              userInput += "1";
                              setState(() {});
                            },
                          ),
                          MyButton.MyButton(
                            title: "2",
                            onPress: () {
                              userInput += "2";
                              setState(() {});
                            },
                          ),
                          MyButton.MyButton(
                            title: "3",
                            onPress: () {
                              userInput += "3";
                              setState(() {});
                            },
                          ),
                          MyButton.MyButton(
                            color: Colors.orange,
                            title: "+",
                            onPress: () {
                              userInput += "+";
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          MyButton.MyButton(
                            title: "0",
                            onPress: () {
                              userInput += "0";
                              setState(() {});
                            },
                          ),
                          MyButton.MyButton(
                            title: ".",
                            onPress: () {
                              userInput += ".";
                              setState(() {});
                            },
                          ),
                          MyButton.MyButton(
                            title: "DEL",
                            onPress: () {
                              userInput =
                                  userInput.substring(0, userInput.length - 1);
                              setState(() {});
                            },
                          ),
                          MyButton.MyButton(
                            color: Colors.orange,
                            title: "=",
                            onPress: () {
                              equalPress();
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void equalPress() {
    String finalUserInput = userInput;
    finalUserInput = userInput.replaceAll("x", "*");
    Parser p = Parser();
    Expression expression = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toStringAsFixed(3).toString();
  }
}
