import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class MyWater extends StatefulWidget {
  const MyWater({super.key});

  @override
  State<MyWater> createState() => _MyWaterState();
}

class _MyWaterState extends State<MyWater> {
  final TextEditingController _waterController = TextEditingController();

  double _totalWater = 0;
  var num = 1;
  double total = 0;

  void bodyFeeling() {
    if (_totalWater == 0) num = 1;
    if (_totalWater >= 350) num = 2;
    if (_totalWater >= 700) num = 3;
    if (_totalWater >= 1000) num = 4;
    if (_totalWater >= 1350) num = 5;

    setState(() {});
  }

  void waterAdded() {
    double water = double.parse(_waterController.text);
    double totalWater = _totalWater + water;
    print(totalWater);
    _totalWater = totalWater;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 360,
              child: Text(
                "“ Thousands have lived without love, not one without water. ” ",
                style: GoogleFonts.abhayaLibre(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Color.fromARGB(255, 87, 100, 104)),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 40, 20, 30),
              height: 350,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Color.fromARGB(255, 159, 215, 254),
              ),
              child: Container(
                padding: EdgeInsets.all(30),
                child: Image.asset(
                  'assets/$num.png',
                  height: 120,
                  width: 120,
                ),
              ),
            ),
            Text(
              _totalWater == null
                  ? "Enter Value"
                  : " You Reached ${_totalWater.toStringAsFixed(2)} ml",
              style: GoogleFonts.abhayaLibre(
                  fontSize: 30, color: Color.fromARGB(255, 87, 100, 104)),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton.icon(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25.0),
                  ),
                ),
                builder: (context) {
                  return SizedBox(
                    height: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                            leading: Icon(Icons.water_drop_outlined),
                            title: Text('350 ml'),
                            onTap: () {
                              _totalWater += 350;
                              setState(
                                bodyFeeling,
                              );
                            }),
                        ListTile(
                            leading: Icon(Icons.water_drop_outlined),
                            title: Text('500 ml'),
                            onTap: () {
                              _totalWater += 500;
                              setState(
                                bodyFeeling,
                              );
                            }),
                        ListTile(
                          leading: Icon(Icons.water_drop_outlined),
                          title: TextField(
                            controller: _waterController,
                            decoration: InputDecoration(
                              hintText: ('add ur water amount ml '),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 3, color: Colors.blue),
                              ),
                            ),
                            keyboardType:
                                defaultTargetPlatform == TargetPlatform.iOS
                                    ? TextInputType.numberWithOptions(
                                        decimal: true, signed: true)
                                    : TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            onTap: () {
                              waterAdded();
                              setState(
                                bodyFeeling,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                });
          },
          icon: Icon(Icons.water_drop),
          label: Text("Add"),
          style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 159, 215, 254),
          ),
        ),
      ],
    );
  }
}
