// ignore_for_file: deprecated_member_use

import 'package:daily_task/network/edit_task.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'dashboard_scren.dart';

class EditTask extends StatefulWidget {
  const EditTask(
      {Key? key,
      required this.taskName,
      required this.description,
      required this.id,
      required this.wstartDate,
      required this.wendDate})
      : super(key: key);

  final String taskName;
  final String description;
  final int id;
  final String wstartDate;
  final String wendDate;

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  EditTaskk editTsk = EditTaskk();

  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  TextEditingController taskName = TextEditingController();
  TextEditingController description = TextEditingController();

  late String tsk;
  late String desc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startDate.text = widget.wstartDate;
    endDate.text = widget.wendDate;
    taskName.text = widget.taskName;
    description.text = widget.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Task'),
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: TextFormField(
              controller: taskName,
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
                      editTsk.editData(
                          widget.id, taskName.text, description.text, startDate.text, endDate.text);
                      Alert(
                        context: context,
                        type: AlertType.success,
                        title: "SUCCESS",
                        desc: "The task was edited.",
                        buttons: [
                          DialogButton(
                            color: Colors.green,
                            child: const Text(
                              "OK",
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
          ),
        ],
      ),
    );
  }
}
