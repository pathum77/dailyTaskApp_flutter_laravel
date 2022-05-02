import 'package:daily_task/network/get_list.dart';
import 'package:daily_task/screens/add_task.dart';
import 'package:daily_task/screens/edit_task.dart';
import 'package:daily_task/screens/view_task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  ListDataa listData = ListDataa();
  bool isSelected = false;
  bool dbError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Tasks'),
      ),
      body: FutureBuilder<List>(
        future: listData.getAllList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SpinKitFadingCircle(
              color: Colors.grey,
              size: 50.0,
            );
          } else if (snapshot.hasError) {
            dbError = true;
            return const Center(
              child: Text('Something went wrong'),
            );
          } else {
            if (snapshot.hasData) {
              dbError = false;
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            // return EditTask(
                            //   taskName: snapshot.data![i]['taskname'],
                            //   description: snapshot.data![i]['description'],
                            //   id: snapshot.data![i]['id'],
                            // );
                            return ViewTask(
                              taskName: snapshot.data![i]['taskname'],
                              description: snapshot.data![i]['description'],
                              id: snapshot.data![i]['id'],
                            );
                          },
                        ),
                      );
                    },
                    child: Card(
                      child: ListTile(
                        title: Text(
                          snapshot.data![i]['taskname'],
                        ),
                        subtitle: Text(
                          snapshot.data![i]['description'],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: Text('No data'),
              );
            }
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (dbError == false) {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const AddTask();
            }));
          } else {
            Alert(
              context: context,
              type: AlertType.error,
              title: "ACCESS DENIED",
              desc: "Something went wrong. Please try again.",
              buttons: [
                DialogButton(
                  child: const Text(
                    "OK",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const DashboardScreen();
                    }));
                  },
                  width: 120,
                ),
              ],
            ).show();
          }
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
