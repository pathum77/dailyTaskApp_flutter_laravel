// ignore_for_file: deprecated_member_use

import 'package:daily_task/network/add_task.dart';
import 'package:daily_task/screens/dashboard_scren.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  AddTaskk addtsk = AddTaskk();

  final _formKey = GlobalKey<FormState>();

  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  TextEditingController taskName = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.always,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: TextFormField(
                  validator: (value) => value!.isEmpty ? 'Field cannot be empty':null,
                  maxLength: 14,
                  controller: taskName,
                  autofocus: true,
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
                  validator: (value) => value!.isEmpty ? 'Field cannot be empty':null,
                    controller: startDate,
                    decoration: const InputDecoration(
                      suffixIcon: Icon(
                        Icons.calendar_today,
                        color: Colors.green,
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'Start Date',
                    ),
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(
                              2000), //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2101));
                      if (pickedDate != null) {
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        setState(() {
                          startDate.text = formattedDate;
                        });
                      }
                    }),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: TextFormField(
                    controller: endDate,
                    decoration: const InputDecoration(
                      suffixIcon: Icon(
                        Icons.calendar_today,
                        color: Colors.red,
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'End Date',
                    ),
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(
                              2000), //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2101));
                      if (pickedDate != null) {
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        setState(() {
                          endDate.text = formattedDate;
                        });
                      }
                    }),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: TextFormField(
                  validator: (value) => value!.isEmpty ? 'Field cannot be empty':null,
                  controller: description,
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
                          FocusManager.instance.primaryFocus?.unfocus();
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
                          FocusManager.instance.primaryFocus?.unfocus();
                          if (endDate.text == '') {
                            endDate.text = '(Not set)';
                          }
                          addtsk.addData(taskName.text, description.text,
                              startDate.text, endDate.text);
                          taskName.clear();
                          description.clear();
                          Alert(
                            context: context,
                            type: AlertType.success,
                            title: "SUCCESS",
                            desc: "The task was added successfully.",
                            buttons: [
                              DialogButton(
                                child: const Text(
                                  "ADD",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
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
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
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
        ),
      ),
    );
  }
}
