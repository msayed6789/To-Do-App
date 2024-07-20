// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:prj_2/widgets/card.dart';
import 'package:prj_2/widgets/counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: Prj2(),
    );
  }
}

class Prj2 extends StatefulWidget {
  const Prj2({super.key});

  @override
  State<Prj2> createState() => _MyWidgetState();
}

class Task {
  String taskName;
  bool status;

  Task({required this.taskName, required this.status});
}

class _MyWidgetState extends State<Prj2> {
  List tasks = [];
  int totalDone = 0;
  int totalNotDone = 0;

  final task = TextEditingController();

  void AddToList() {
    setState(() {
      if (task.text != "") {
        tasks.add(Task(taskName: task.text, status: false));
        totalNotDone++;
      }
    });
  }

  void changeCount(int index) {
    setState(() {
      if (tasks[index].status == true) {
        tasks[index].status = false;
        totalDone--;
      } else {
        tasks[index].status = true;
        totalDone++;
      }
    });
  }

  void taskdelete(int index) {
    setState(() {
      if (tasks[index].status) {
        totalDone--;
      }
      tasks.removeAt(index);
      totalNotDone--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11)),
                  child: FractionallySizedBox(
                    widthFactor: 0.9,
                    heightFactor: 0.3,
                    child: Container(
                      //color: Color.fromRGBO(58, 66, 86, 0.7),
                      //color: Color.fromRGBO(230, 62, 123, 0.698),
                      color:Color.fromRGBO(90, 99, 156, 0.5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                            margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                            decoration: BoxDecoration(
                                //  color: Color.fromRGBO(209, 224, 224, 0.2),
                                //color: Color.fromRGBO(242, 190, 209, 10),
                                color: Color.fromRGBO(155, 134, 189, 1),
                                borderRadius: BorderRadius.circular(11)),
                            child: TextField(
                              controller: task,
                              maxLength: 20,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  hintText: "New Task",
                                  hintStyle: TextStyle(color: Colors.black),
                                  border: InputBorder.none,
                                  icon: Icon(
                                    Icons.task,
                                    color: Colors.black,
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  AddToList();
                                  Navigator.pop(context);
                                },
                                style: ButtonStyle(
                                  //backgroundColor: MaterialStateProperty.all(
                                    //  Color.fromRGBO(242, 190, 209, 10)),
                                      backgroundColor: MaterialStateProperty.all(
                                      Color.fromRGBO(155, 134, 189, 1)),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadiusDirectional.circular(
                                                  25))),
                                  //  padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(120, 0, 120, 0)),
                                ),
                                child: Text(
                                  "Add",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ButtonStyle(
                                  // backgroundColor: MaterialStateProperty.all(
                                  //     Color.fromRGBO(242, 190, 209, 10)),
                                        backgroundColor: MaterialStateProperty.all(
                                      Color.fromRGBO(155, 134, 189, 1)),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadiusDirectional.circular(
                                                  25))),
                                  //padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(120, 0, 120, 0)),
                                ),
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
        },
        child: Icon(
          Icons.add,
          size: 35,
          color: Colors.black,
        ),
        //backgroundColor: Color.fromRGBO(58, 66, 86, 0.7),
//backgroundColor: Color.fromRGBO(242, 190, 209, 20),
        backgroundColor: Color.fromRGBO(155, 134, 189, 1),

        shape: CircleBorder(),
      ),
      body: SafeArea(
        child: Container(
            height: double.infinity,
            width: double.infinity,
            //color: Color.fromRGBO(58, 66, 86, 0.7),
            //color: Color.fromRGBO(238, 116, 161, 0.925),
            color: Color.fromRGBO(90, 99, 156, 15),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "TO DO",
                        style: TextStyle(
                            fontSize: 35,
                            color: Colors.black,
                            fontWeight: FontWeight.w800),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              tasks.clear();
                              totalNotDone = 0;
                              totalDone = 0;
                            });
                          },
                          icon: Icon(
                            Icons.delete_forever,
                            size: 35,
                            color: Colors.black,
                          ))
                    ],
                  ),
                ),
                Counter(totalDone_C: totalDone, totalNotDone_C: totalNotDone),

                SizedBox(
                    height: 500,
                    child: ListView.builder(
                        itemCount: tasks.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CardF(
                              title: tasks[index].taskName,
                              status: tasks[index].status,
                              index: index,
                              changeFunc: changeCount,
                              taskdel: taskdelete);
                        })),
                // ...tasks.map((item) =>
                //     CardF(title: item.taskName, status: item.status)),
              ],
            )),
      ),
    );
  }
}
