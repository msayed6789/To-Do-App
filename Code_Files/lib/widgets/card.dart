// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

int totalDone_c = 0;

class CardF extends StatelessWidget {
  final String title;
  final bool status;
  final int index;
  Function changeFunc;
  Function taskdel;
  CardF(
      {super.key,
      required this.title,
      required this.status,
      required this.index,
      required this.changeFunc,
      required this.taskdel});
  //CardF({super.key, required this.title, required this.status});

  void changecount_c(bool st) {
    if (st == true) {
      totalDone_c++;
    } else {
      totalDone_c--;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: Container(
        // ignore: prefer_const_constructors
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.all(22),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          //color: Colors.black38,
          //color:status ? Color.fromARGB(255, 117, 202, 120):Color.fromRGBO(242, 190, 209, 0.5)
          color: status
              ? Color.fromARGB(255, 117, 202, 120)
              : Color.fromRGBO(155, 134, 189, 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  decoration:
                      status ? TextDecoration.lineThrough : TextDecoration.none,
                  //color:status?Colors.black: Colors.white
                  color: Colors.black),
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      changeFunc(index);
                    },
                    icon: Icon(
                      size: 27,
                      status ? Icons.check : Icons.close,
                      color:
                          status ? Color.fromARGB(255, 12, 110, 15) : Colors.red,
                    )),
                IconButton(
                    onPressed: () {
                      taskdel(index);
                    },
                    icon: Icon(
                      size: 27,
                      Icons.delete,
                      color: Colors.black,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
