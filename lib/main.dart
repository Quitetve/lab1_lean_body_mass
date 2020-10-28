import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nicesnippets',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Welcome to Nicesnippets'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  State createState() => _State();
}

class _State extends State {
  TextEditingController nameController = TextEditingController();
  TextEditingController nameController1 = TextEditingController();
  int _radioValue = 0;
  int _radioValue1 = 0;

  final TextEditingController _acontroller = TextEditingController();
  final TextEditingController _bcontroller = TextEditingController();

  double h = 0.0,
      w = 0.0,
      result1 = 0.0,
      result2 = 0.0,
      result3 = 0.0,
      result4 = 0.0,
      f1 = 0.0,
      f2 = 0.0,
      f3 = 0.0,
      f4 = 0.0;
  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          break;
        case 1:
          break;
      }
    });
  }

  void _handleRadioValueChange1(int value) {
    setState(() {
      _radioValue1 = value;

      switch (_radioValue1) {
        case 2:
          break;
        case 3:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lean Body Mass'),
        ),
        body: Padding(
            padding: EdgeInsets.all(5),
            child: ListView(
              children: [
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(0),
                    margin: const EdgeInsets.only(top: 0),
                    child: Text(
                      'Gender',
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    )),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    new Radio(
                      value: 0,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    new Text(
                      'Male',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                    new Radio(
                      value: 1,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    new Text(
                      'Female',
                      style: new TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: EdgeInsets.all(0),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(0),
                          margin: const EdgeInsets.only(top: 0),
                          child: Text(
                            'Age 14 or younger?',
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                          )),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          new Radio(
                            value: 2,
                            groupValue: _radioValue1,
                            onChanged: _handleRadioValueChange1,
                          ),
                          new Text(
                            'Yes',
                            style: new TextStyle(fontSize: 16.0),
                          ),
                          new Radio(
                            value: 3,
                            groupValue: _radioValue1,
                            onChanged: _handleRadioValueChange1,
                          ),
                          new Text(
                            'No',
                            style: new TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Height in cm",
                            suffixIcon: IconButton(
                              onPressed: () => _acontroller.clear(),
                              icon: Icon(Icons.clear),
                            ),
                          ),
                          keyboardType: TextInputType.numberWithOptions(),
                          controller: _acontroller,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Weight in kg",
                            suffixIcon: IconButton(
                              onPressed: () => _bcontroller.clear(),
                              icon: Icon(Icons.clear),
                            ),
                          ),
                          keyboardType: TextInputType.numberWithOptions(),
                          controller: _bcontroller,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(0),
                            child: RaisedButton(
                              textColor: Colors.white,
                              color: Colors.red,
                              child: Text("Calculate"),
                              onPressed: _onPress,
                            ),
                          ),
                        ],
                      ),
                      Column(children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Result",
                            textScaleFactor: 1.5,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(0),
                          child: Table(
                            textDirection: TextDirection.rtl,
                            defaultVerticalAlignment:
                                TableCellVerticalAlignment.bottom,
                            border:
                                TableBorder.all(width: 3.0, color: Colors.red),
                            children: [
                              TableRow(children: [
                                Text('Body Fat   ',
                                    textAlign: TextAlign.center,
                                    textScaleFactor: 1.5,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    )),
                                Text('Lean Body Mass(KG)',
                                    textAlign: TextAlign.center,
                                    textScaleFactor: 1.5,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    )),
                                Text('Formula   ',
                                    textAlign: TextAlign.center,
                                    textScaleFactor: 1.5,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    )),
                              ]),
                              TableRow(children: [
                                Text("$f1 %",
                                    textAlign: TextAlign.center,
                                    textScaleFactor: 1.3),
                                Text(" $result1",
                                    textAlign: TextAlign.center,
                                    textScaleFactor: 1.3),
                                Text(
                                  'Boer: ',
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ]),
                              TableRow(children: [
                                Text("$f2 %",
                                    textAlign: TextAlign.center,
                                    textScaleFactor: 1.3),
                                Text("$result2 ",
                                    textAlign: TextAlign.center,
                                    textScaleFactor: 1.3),
                                Text(
                                  'James: ',
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ]),
                              TableRow(children: [
                                Text("$f3 %",
                                    textAlign: TextAlign.center,
                                    textScaleFactor: 1.3),
                                Text(
                                  "$result3",
                                  textScaleFactor: 1.3,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'Hume: ',
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ]),
                              TableRow(children: [
                                Text("$f4 %",
                                    textAlign: TextAlign.center,
                                    textScaleFactor: 1.3),
                                Text(
                                  "$result4",
                                  textScaleFactor: 1.3,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'Peter (C): ',
                                  textScaleFactor: 1.5,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ]),
                            ],
                          ),
                        ),
                      ]),
                    ], //children Age
                  ), // ListView Age
                ) //Padding Age
              ], //children Gender
            ) //ListView Gender
            ) //Padding Gender
        ); // Scaffold
  }

  void _onPress() {
    setState(() {
      if (_radioValue == 0 && _radioValue1 == 2) {
        h = double.parse(_acontroller.text);
        w = double.parse(_bcontroller.text);
        result1 = 0.407 * w + 0.267 * h - 19.2;
        result1 = double.parse((result1).toStringAsFixed(1));
        f1 = 100 - (result1 / w) * 100;
        f1 = double.parse((f1).toStringAsFixed(0));
        h = double.parse(_acontroller.text);
        w = double.parse(_bcontroller.text);
        result2 = 1.1 * w - 128 * (w / h) * (w / h);
        result2 = double.parse((result2).toStringAsFixed(1));
        f2 = 100 - (result2 / w) * 100;
        f2 = double.parse((f2).toStringAsFixed(0));
        h = double.parse(_acontroller.text);
        w = double.parse(_bcontroller.text);
        result3 = 0.32810 * w + 0.33929 * h - 29.5336;
        result3 = double.parse((result3).toStringAsFixed(1));
        f3 = 100 - (result3 / w) * 100;
        f3 = double.parse((f3).toStringAsFixed(0));
        result4 = 3.8 * (0.0215 * (pow(w, 0.6469)) * (pow(h, 0.7236)));
        f4 = 100 - (result4 / w) * 100;
        result4 = double.parse((result4).toStringAsFixed(1));
        f4 = double.parse((f4).toStringAsFixed(0));
      } else if (_radioValue == 0 && _radioValue1 == 3) {
        h = double.parse(_acontroller.text);
        w = double.parse(_bcontroller.text);
        result1 = 0.407 * w + 0.267 * h - 19.2;
        result1 = double.parse((result1).toStringAsFixed(1));
        f1 = 100 - (result1 / w) * 100;
        f1 = double.parse((f1).toStringAsFixed(0));
        h = double.parse(_acontroller.text);
        w = double.parse(_bcontroller.text);
        result2 = 1.1 * w - 128 * (w / h) * (w / h);
        result2 = double.parse((result2).toStringAsFixed(1));
        f2 = 100 - (result2 / w) * 100;
        f2 = double.parse((f2).toStringAsFixed(0));
        h = double.parse(_acontroller.text);
        w = double.parse(_bcontroller.text);
        result3 = 0.32810 * w + 0.33929 * h - 29.5336;
        result3 = double.parse((result3).toStringAsFixed(1));
        f3 = 100 - (result3 / w) * 100;
        f3 = double.parse((f3).toStringAsFixed(0));
        f4 = 0.0;
        result4 = 0.0;
      } else if (_radioValue == 1 && _radioValue1 == 2) {
        h = double.parse(_acontroller.text);
        w = double.parse(_bcontroller.text);
        result1 = 0.252 * w + 0.473 * h - 48.3; //Boer
        result1 = double.parse((result1).toStringAsFixed(1));
        f1 = 100 - (result1 / w) * 100;
        f1 = double.parse((f1).toStringAsFixed(0));
        h = double.parse(_acontroller.text);
        w = double.parse(_bcontroller.text);
        result2 = 1.07 * w - 148 * (w / h) * (w / h); //James
        result2 = double.parse((result2).toStringAsFixed(1));
        f2 = 100 - (result2 / w) * 100;
        f2 = double.parse((f2).toStringAsFixed(0));
        h = double.parse(_acontroller.text);
        w = double.parse(_bcontroller.text);
        result3 = 0.29569 * w + 0.418134 * h - 43.2933; //Hume
        result3 = double.parse((result3).toStringAsFixed(1));
        f3 = 100 - (result3 / w) * 100;
        f3 = double.parse((f3).toStringAsFixed(0));
        result4 = 3.8 * (0.0215 * (pow(w, 0.6469)) * (pow(h, 0.7236)));
        f4 = 100 - (result4 / w) * 100;
        result4 = double.parse((result4).toStringAsFixed(1));
        f4 = double.parse((f4).toStringAsFixed(0));
      } else if (_radioValue == 1 && _radioValue1 == 3) {
        h = double.parse(_acontroller.text);
        w = double.parse(_bcontroller.text);
        result1 = 0.252 * w + 0.473 * h - 48.3; //Boer
        result1 = double.parse((result1).toStringAsFixed(1));
        f1 = 100 - (result1 / w) * 100;
        f1 = double.parse((f1).toStringAsFixed(0));
        h = double.parse(_acontroller.text);
        w = double.parse(_bcontroller.text);
        result2 = 1.07 * w - 148 * (w / h) * (w / h); //James
        result2 = double.parse((result2).toStringAsFixed(1));
        f2 = 100 - (result2 / w) * 100;
        f2 = double.parse((f2).toStringAsFixed(0));
        h = double.parse(_acontroller.text);
        w = double.parse(_bcontroller.text);
        result3 = 0.29569 * w + 0.418134 * h - 43.2933; //Hume
        result3 = double.parse((result3).toStringAsFixed(1));
        f3 = 100 - (result3 / w) * 100;
        f3 = double.parse((f3).toStringAsFixed(0));
        f4 = 0.0;
        result4 = 0.0;
      }
    });
  }
}
