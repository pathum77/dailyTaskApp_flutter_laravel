import 'package:daily_task/network/delete_task.dart';
import 'package:daily_task/screens/dashboard_scren.dart';
import 'package:daily_task/screens/edit_task.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ViewTask extends StatelessWidget {
  const ViewTask(
      {Key? key,
      required this.taskName,
      required this.description,
      required this.id,
      required this.startDate,
      required this.endDate})
      : super(key: key);

  final String taskName;
  final String description;
  final int id;
  final String startDate;
  final String endDate;

  @override
  Widget build(BuildContext context) {
    DeleteTask deleteTsk = DeleteTask();

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Container(
            decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            width: MediaQuery.of(context).size.width * 0.9,
            child: Padding(
              padding: EdgeInsets.only(
                  top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    taskName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return EditTask(
                          taskName: taskName,
                          description: description,
                          id: id,
                          wstartDate: startDate,
                          wendDate: endDate,
                        );
                      }));
                    },
                    icon: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.10,
          ),
          ///////////////////
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              //color: Colors.white,
              width: MediaQuery.of(context).size.width * 0.97,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      //color: Colors.white,
                      width: MediaQuery.of(context).size.width * 0.10,
                      height: MediaQuery.of(context).size.width * 0.10,
                      child: Icon(
                        Icons.calendar_today,
                        color: Colors.green,
                        size: MediaQuery.of(context).size.width * 0.10,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      //color: Colors.white,
                      child: Text(startDate),
                    ),
                  )
                ],
              ),
            ),
          ),
          /////////////////
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              //color: Colors.white,
              width: MediaQuery.of(context).size.width * 0.97,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      //color: Colors.white,
                      width: MediaQuery.of(context).size.width * 0.10,
                      height: MediaQuery.of(context).size.width * 0.10,
                      child: Icon(
                        Icons.calendar_today,
                        color: Colors.red,
                        size: MediaQuery.of(context).size.width * 0.10,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      //color: Colors.white,
                      child: Text(endDate),
                    ),
                  )
                ],
              ),
            ),
          ),
          /////////////////////
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              //color: Colors.white,
              width: MediaQuery.of(context).size.width * 0.97,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      //color: Colors.white,
                      width: MediaQuery.of(context).size.width * 0.10,
                      height: MediaQuery.of(context).size.width * 0.10,
                      child: Icon(
                        Icons.list,
                        color: Colors.yellow,
                        size: MediaQuery.of(context).size.width * 0.10,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      //color: Colors.white,
                      child: Text(description),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Row(
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.08,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue,
                  ),
                  child: FlatButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'MARK AS DONE',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Icon(
                          Icons.check_circle,
                          color: Colors.white,
                        )
                      ],
                    ),
                    onPressed: () {
                      deleteTsk.deleteData(id);
                      Alert(
                        context: context,
                        type: AlertType.success,
                        title: "SUCCESS",
                        desc:
                            "The task is completed and it removed from your tasks.",
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
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
