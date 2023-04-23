import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> entries = [];
  String entry = '';

  void printEntry() {
    setState(() {
      entry = entries.join();
    });
  }

  void calculate() {
    double res = 0.0;
    double x = 0.0, y = 0.0;
    String expression = '';
    int power = 1;
    bool decimal = false;
    for (int i = 0; i < entries.length; i++) {
      if (entries[i] == '+' ||
          entries[i] == '-' ||
          entries[i] == '*' ||
          entries[i] == '/' ||
          entries[i] == '%' ||
          entries[i] == '^0.5') {
        expression = entries[i];
        decimal = false;
        power = 1;
        x = y;
        y = 0.0;
      } else if (entries[i] == '.') {
        decimal = true;
      } else {
        if (decimal == false) {
          y = y * 10.0 + (double.parse(entries[i]));
        } else {
          y = y + (double.parse(entries[i])) / pow(10.0, power);
          power++;
        }
      }
    }
    if (expression == '+') {
      res = x + y;
    } else if (expression == '-') {
      res = x - y;
    } else if (expression == '*') {
      res = x * y;
    } else if (expression == '/') {
      res = x / y;
    } else if (expression == '%') {
      res = x % y;
    } else if (expression == '^0.5') {
      res = sqrt(x);
    }

    // print(x);
    // print(y);
    entries.clear();
    entries.add(res.toStringAsFixed(2));
    print(entries);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calculator'),
          backgroundColor: Colors.pinkAccent,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    entry,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xFFD0E7F1),
                    child: IconButton(
                      onPressed: () {
                        entries.removeLast();
                        printEntry();
                      },
                      icon: Icon(
                        Icons.undo,
                      ),
                      iconSize: 25,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            entries.clear();
                            printEntry();
                          });
                        },
                        child: Text(
                          'C',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                        backgroundColor: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            entries.add('^0.5');
                            printEntry();
                          });
                        },
                        child: Text(
                          '1/2',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            entries.add('%');
                            printEntry();
                          });
                        },
                        child: Text(
                          '%',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          entries.add('/');
                          printEntry();
                        });
                      },
                      child: Text(
                        '/',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      backgroundColor: Colors.green,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            entries.add('7');
                            printEntry();
                          });
                        },
                        child: Text(
                          '7',
                          style: TextStyle(color: Colors.black, fontSize: 30),
                        ),
                        backgroundColor: Colors.white70,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            entries.add('8');
                            printEntry();
                          });
                        },
                        child: Text(
                          '8',
                          style: TextStyle(color: Colors.black, fontSize: 30),
                        ),
                        backgroundColor: Colors.white70,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            entries.add('9');
                            printEntry();
                          });
                        },
                        child: Text(
                          '9',
                          style: TextStyle(color: Colors.black, fontSize: 30),
                        ),
                        backgroundColor: Colors.white70,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          entries.add('*');
                          printEntry();
                        });
                      },
                      child: Text(
                        '*',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      backgroundColor: Colors.green,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            entries.add('4');
                            printEntry();
                          });
                        },
                        child: Text(
                          '4',
                          style: TextStyle(color: Colors.black, fontSize: 30),
                        ),
                        backgroundColor: Colors.white70,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            entries.add('5');
                            printEntry();
                          });
                        },
                        child: Text(
                          '5',
                          style: TextStyle(color: Colors.black, fontSize: 30),
                        ),
                        backgroundColor: Colors.white70,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            entries.add('6');
                            printEntry();
                          });
                        },
                        child: Text(
                          '6',
                          style: TextStyle(color: Colors.black, fontSize: 30),
                        ),
                        backgroundColor: Colors.white70,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          entries.add('-');
                          printEntry();
                        });
                      },
                      child: Text(
                        '-',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      backgroundColor: Colors.green,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            entries.add('1');
                            printEntry();
                          });
                        },
                        child: Text(
                          '1',
                          style: TextStyle(color: Colors.black, fontSize: 30),
                        ),
                        backgroundColor: Colors.white70,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            entries.add('2');
                            printEntry();
                          });
                        },
                        child: Text(
                          '2',
                          style: TextStyle(color: Colors.black, fontSize: 30),
                        ),
                        backgroundColor: Colors.white70,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            entries.add('3');
                            printEntry();
                          });
                        },
                        child: Text(
                          '3',
                          style: TextStyle(color: Colors.black, fontSize: 30),
                        ),
                        backgroundColor: Colors.white70,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          entries.add('+');
                          printEntry();
                        });
                      },
                      child: Text(
                        '+',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      backgroundColor: Colors.green,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            entries.add('0');
                            printEntry();
                          });
                        },
                        child: Text(
                          '0',
                          style: TextStyle(color: Colors.black, fontSize: 30),
                        ),
                        backgroundColor: Colors.white70,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            entries.add('.');
                            printEntry();
                          });
                        },
                        child: Text(
                          '.',
                          style: TextStyle(color: Colors.black, fontSize: 30),
                        ),
                        backgroundColor: Colors.white70,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: FloatingActionButton(
                      onPressed: () {
                        calculate();
                        setState(() {
                          printEntry();
                          entries.clear();
                        });
                      },
                      child: Text(
                        '=',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      backgroundColor: Colors.yellow,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
