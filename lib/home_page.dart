import 'package:flutter/material.dart';
import 'package:local_push_notification_app/api/notification_api.dart';
import 'package:local_push_notification_app/second_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listenNotifications();
  }

  void listenNotifications() =>
      NotificationApi.onNotifications.stream.listen(onClickedNotification);

  void onClickedNotification(String? payload) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => SecondPage(payload: payload),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'LOCAL PUSH NOTIFICATION',
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber),
              ),
              SizedBox(
                height: 50,
              ),
              ButtonTheme(
                buttonColor: Colors.blue,
                minWidth: double.infinity,
                height: 60,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: FlatButton.icon(
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {
                      NotificationApi.showNotifications(
                          title: 'Oyebayo Femi',
                          body: 'This is your first Notification',
                          payload: 'oyebayo.femi');
                    },
                    icon: Icon(
                      Icons.add_alert,
                      size: 30,
                    ),
                    label: Text(
                      'Simple Notification',
                      style: TextStyle(fontSize: 20),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              ButtonTheme(
                buttonColor: Colors.green,
                minWidth: double.infinity,
                height: 60,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: FlatButton.icon(
                    color: Colors.green,
                    textColor: Colors.white,
                    onPressed: () {
                      NotificationApi.showScheduleNotifications(
                          title: 'Dinner',
                          body: 'Dinner at 5PM',
                          payload: 'dinner_5pm',
                          scheduleDateTime:
                              DateTime.now().add(Duration(seconds: 15)));
                    },
                    icon: Icon(
                      Icons.alarm,
                      size: 30,
                    ),
                    label: Text(
                      'Schedule Notification',
                      style: TextStyle(fontSize: 20),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
