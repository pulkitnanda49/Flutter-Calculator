import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  Widget button(String buttontext) {
    return Expanded(
      child: FlatButton(
        child: Text(
          buttontext,
          style: TextStyle(color: Colors.tealAccent, fontSize: 22.0),
        ),
        onPressed: () => buttonPressed(buttontext),
        color: Colors.black,
        padding: EdgeInsets.all(13),
        
        shape: RoundedRectangleBorder(),
      ),
    );
  }

  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttontext) {
    if (buttontext == "Clear") {
       _output = "0";
       num1 = 0.0;
       num2 = 0.0;
       operand ="";
    } else if (buttontext == "+" ||
        buttontext == "*" ||
        buttontext == "-" ||
        buttontext == "/") {
      num1 = double.parse(output);
      operand = buttontext;
      _output = "0";
    } else if (buttontext == ".") {
      if (_output.contains(".")) {
        print("Already a decimal value");
        return;
      } else {
        _output = _output + buttontext;
      }
    } else if (buttontext == "Equal") {
        num2 = double.parse(output);
        if (operand == "+") {
          _output = (num1 + num2).toString();
        }
        if (operand == "-") {
          _output = (num1 - num2).toString();
        }
        if (operand == "*") {
          _output = (num1 * num2).toString();
        }
        if (operand == "/") {
          _output = (num1 / num2).toString();
        }
        num1 = 0.0;
        num2 = 0.0;
        operand = "";
      } else {
        _output = _output + buttontext;
      }
    
    print(_output);
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top:20.0),
          child: Align(alignment:Alignment.center,child: Text("Calculator",style: TextStyle(color: Colors.tealAccent,fontSize: 22.0),)),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.grey[300],
        child: Column(children: <Widget>[
         
          Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Text(
                output,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 50.0),
              )),
          Expanded(
            child: Divider(),
          ),
          Row(
            children: [
              button("7"),
              button("8"),
              button("9"),
              button("/"),
            ],
          ),
          Row(
            children: [
              button("4"),
              button("5"),
              button("6"),
              button("*"),
            ],
          ),
          Row(
            children: [
              button("1"),
              button("2"),
              button("3"),
              button("-"),
            ],
          ),
          Row(
            children: [
              button("."),
              button("0"),
              button("00"),
              button("+"),
            ],
          ),
          Container(
            
            padding: EdgeInsets.all(5.0),
            child: Row(
              children: [
                button("Clear"),
                Padding(
                  padding: EdgeInsets.only(right: 5.0),
                ),
                button("Equal"),
              ],
            ),
          ),
        ]),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
