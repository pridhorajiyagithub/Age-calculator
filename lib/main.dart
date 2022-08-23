//Age Calculator

//Program :

//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var DD;
  var MM;
  var YYYY;

  String presentDate = "00";
  String presentMonth = "00";
  String presentYear = "00";

  String nextMonth = "00";
  String nextDate = "00";

  DateTime currentDateTime = DateTime.now();

  final TextEditingController dateController = TextEditingController();
  final TextEditingController monthController = TextEditingController();
  final TextEditingController yearController = TextEditingController();

  TextStyle myStyle = const TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );

  TextStyle titleStyle = const TextStyle(
    color: Colors.white,
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Age Calculator"),
        backgroundColor: const Color(0xff203a43),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 25, top: 25),
            child: Text(
              "Today's Date",
              style: myStyle,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 25, top: 5),
            padding: const EdgeInsets.only(
              top: 15,
              bottom: 15,
              left: 15,
              right: 250,
            ),
            child: const Text(
              "08 Dec, 2021",
              style: TextStyle(
                color: Color(0xff1c003e),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            margin: const EdgeInsets.only(left: 25, top: 5),
            child: const Text("Date of Birth",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
          ),
          Container(
            margin: const EdgeInsets.only(left: 25, top: 5, right: 25),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: dateController,
                    /*onChanged: (val) {
                      DD = val;
                    },*/
                    decoration: const InputDecoration(
//border :UnderlineInputBorder(),
                        border: OutlineInputBorder(),
                        hintText: "DD"),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: monthController,
                    /* onChanged: (val) {
                      MM = val;
                    },*/
                    decoration: const InputDecoration(
//border :UnderlineInputBorder(),
                        border: OutlineInputBorder(),
                        hintText: "MM"),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: yearController,
                    /* onChanged: (val) {
                      YYYY = val;
                    },*/
                    decoration: const InputDecoration(
//border :UnderlineInputBorder(),
                        border: OutlineInputBorder(),
                        hintText: "YYYY"),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 25, top: 5, right: 25),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      dateController.clear();
                      monthController.clear();
                      yearController.clear();

                      DD = 0;
                      MM = 0;
                      YYYY = 0;
                    },
                    child: Ink(
                      child: Container(
                        alignment: Alignment.center,
                        height: 80,
                        child: const Text(
                          "Clear",
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: const Color(0xff13547a),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      DD = dateController.text;
                      MM = monthController.text;
                      YYYY = yearController.text;

                      setState(
                        () {
                          presentYear =
                              "${currentDateTime.year - int.parse(YYYY)}";
                          if (currentDateTime.month < MM) {
                            YYYY--;
                            presentMonth =
                                "${12 - (int.parse(MM) - currentDateTime.month)}";
                          } else {
                            presentMonth =
                                "${currentDateTime.month - int.parse(MM)}";
                          }
                          ;
                        },
                      );

                      /*   print(DD);
                      print(MM);
                      print(YYYY);*/
                    },
                    child: Ink(
                      child: Container(
                        alignment: Alignment.center,
                        height: 80,
                        child: const Text(
                          "Calculate",
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: const Color(0xff13547a),
                          ),
                        ),
                      ),
                      color: const Color(0xff13547a),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.only(left: 25, top: 10),
            child: const Text(
              "Present Age",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
// style: myStyle,
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(presentYear, style: titleStyle),
                    Text("Year", style: titleStyle),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(presentMonth, style: titleStyle),
                    Text("MM", style: titleStyle),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(presentDate, style: titleStyle),
                    Text("DD", style: titleStyle),
                  ],
                ),
              ],
            ),
            margin: const EdgeInsets.only(left: 25, top: 10),
            height: 150,
            width: 390,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xff13547a),
                  Color(0xff203a43),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.only(left: 25, top: 10),
            child: const Text(
              "Next Birthday",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
// style: myStyle,
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("00", style: titleStyle),
                    Text("MM", style: titleStyle),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("00", style: titleStyle),
                    Text("DD", style: titleStyle),
                  ],
                ),
              ],
            ),
            margin: const EdgeInsets.only(left: 25, top: 10),
            height: 150,
            width: 390,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xff6bbed9),
                  Color(0xff006acb),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
