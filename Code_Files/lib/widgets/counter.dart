// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  //const Counter({super.key});

  final int totalDone_C;
  final int totalNotDone_C;
  
  // ignore: non_constant_identifier_names
  const Counter(
      {super.key, required this.totalDone_C, required this.totalNotDone_C});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      alignment: Alignment.center,
      //color: Colors.black54,
    //  color: Color.fromRGBO  (242, 190, 209,10),
      color:Color.fromRGBO(155, 134, 189,1),
    
      width: double.infinity,
      child: Text(
        "$totalDone_C/$totalNotDone_C",
        style: TextStyle(
            fontSize: 44,
            color: totalNotDone_C == 0
                ? Colors.black
                : totalDone_C == totalNotDone_C
                    ? Color.fromARGB(255, 185, 234, 186) //Colors.green
                    : Colors.black,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
