import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class MyInfo extends StatefulWidget {
  MyInfo({super.key});

  @override
  State<MyInfo> createState() => _MyInfoState();
}

class _MyInfoState extends State<MyInfo> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _goalController = TextEditingController();

  double _result = 0;

  void waterNeeds() {
    double weight = double.parse(_weightController.text);
    double result = weight * 0.033;
    print(result);
    _result = result;
    setState(() {});
  }

  void setGoal() {
    double goal = double.parse(_goalController.text);
    print(goal);
    _result = goal;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 180,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Profile Page",
                    style: GoogleFonts.abhayaLibre(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 28, 31, 61),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                      decoration: InputDecoration(
                    labelText: 'Name ',
                    icon: Icon(Icons.face),
                  )),
                  TextField(
                      decoration: InputDecoration(
                    labelText: 'Age ',
                    icon: Icon(Icons.numbers),
                  )),
                  TextField(
                      decoration: InputDecoration(
                    labelText: 'height in cm',
                    icon: Icon(Icons.line_weight),
                  )),
                  TextField(
                    controller: _weightController,
                    decoration: InputDecoration(
                      labelText: 'weight in kg',
                      icon: Icon(Icons.line_weight),
                    ),
                  ),
                  SizedBox(height: 15),
                  ElevatedButton.icon(
                    onPressed: waterNeeds,
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 159, 215, 254),
                    ),
                    icon: Icon(Icons.water_drop),
                    label: Text(
                      "Calculate My Water",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "You Have to Drink ",
                    style: GoogleFonts.abhayaLibre(
                      color: Color.fromARGB(255, 148, 25, 25),
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                      _result == null
                          ? "Enter Value"
                          : "${_result.toStringAsFixed(2)} L",
                      style: GoogleFonts.abhayaLibre(
                        color: Color.fromARGB(255, 148, 25, 25),
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                      )),
                  TextField(
                    controller: _goalController,
                    decoration: InputDecoration(
                      labelText: 'Choose your goal in L',
                      icon: Icon(Icons.water_drop),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: setGoal,
                    child: Text(
                      'Set',
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 159, 215, 254),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget inputFile({label, obscureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      SizedBox(height: 15),
      Text(
        label,
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
      ),
      SizedBox(height: 15),
      TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 169, 168, 168)),
            ),
            border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 169, 168, 168)))),
      ),
      // ElevatedButton(
      //   onPressed: ,
      //   style: ElevatedButton.styleFrom(
      //     primary: Color.fromARGB(255, 159, 215, 254),
      //   ),
      //   child: Text(
      //     "Set",
      //     style: TextStyle(fontSize: 20),
      //   ),
      // ),
    ],
  );
}
