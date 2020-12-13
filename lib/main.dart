import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'calculator';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text(appTitle),
          centerTitle: true ,
        ),
        body: AddTwoNumbers(),
      ),
    );
  }
}
class AddTwoNumbers extends StatefulWidget {
  @override
  _AddTwoNumbersState createState() => _AddTwoNumbersState();
}

class _AddTwoNumbersState extends State<AddTwoNumbers> {
  TextEditingController num1controller = new TextEditingController();
  TextEditingController num2controller = new TextEditingController();
  String resulttext = "0";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text("Number 1 : "),
              new Flexible(
                child: new TextField(
                  keyboardType: TextInputType.number,
                  controller: num1controller,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text("Number 2 : "),
              new Flexible(
                child: new TextField(
                  keyboardType: TextInputType.number,
                  controller: num2controller,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text("+"),
                onPressed : () {
                  setState(() {
                    int result = int.parse(num1controller.text) + int.parse(num2controller.text);
                    resulttext = result.toString();
                  });
                },
              ),
              RaisedButton(
                child: Text("-"),
                onPressed : () {
                  setState(() {
                    int result = int.parse(num1controller.text) - int.parse(num2controller.text);
                    resulttext = result.toString();
                  });
                },
              ),
              RaisedButton(
                child: Text("x"),
                onPressed : () {
                  setState(() {
                    int result = int.parse(num1controller.text) * int.parse(num2controller.text);
                    resulttext = result.toString();
                  });
                },
              ),
              RaisedButton(
                child: Text("/"),
                onPressed : () {
                  setState(() {
                    double result = double.parse(num1controller.text)/double.parse(num2controller.text);
                    resulttext = result.toStringAsPrecision(3);
                  });
                },
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Result:",
                style: TextStyle(
                  fontSize: 30,
                ),),
              new Text(resulttext,
                style: TextStyle(
                  fontSize: 30,
                ),),
            ],
          ),
        ],
      ),
    );
  }
}