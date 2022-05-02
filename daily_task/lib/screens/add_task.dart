// ignore_for_file: deprecated_member_use

import 'package:daily_task/network/add_task.dart';
import 'package:daily_task/screens/dashboard_scren.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  AddTaskk addtsk = AddTaskk();

  TextEditingController tsk = TextEditingController();
  TextEditingController desc = TextEditingController();
  late String taskName;
  late String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: TextFormField(
              controller: tsk,
              autofocus: true,
              onChanged: (value) => {
                taskName = value,
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Task Name',
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: TextFormField(
              controller: desc,
              onChanged: (value) => {
                description = value,
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Task Description',
              ),
              maxLines: 2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.08,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.blue, width: 2),
                  ),
                  child: FlatButton(
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.08,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue,
                  ),
                  child: FlatButton(
                    child: const Text(
                      'SAVE',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      addtsk.addData(taskName, description);
                      tsk.clear();
                      desc.clear();
                      Alert(
                        context: context,
                        type: AlertType.success,
                        title: "SUCCESS",
                        desc: "The task is added successfully.",
                        buttons: [
                          DialogButton(
                            child: const Text(
                              "ADD",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              FocusScope.of(context).previousFocus();
                            },
                            width: 120,
                          ),
                          DialogButton(
                            color: Colors.green,
                            child: const Text(
                              "HOME",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () => Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const DashboardScreen();
                            })),
                            width: 120,
                          )
                        ],
                      ).show();
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
