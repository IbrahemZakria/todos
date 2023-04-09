import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:todo/layout/Screens/menu/taskItem.dart';
import 'package:todo/models/taskModel.dart';
import 'package:todo/moduls/MyProvider.dart';
import 'package:todo/utilits/addtaskfromFireBase.dart';

import '../../../Style/My_Theme_Data.dart';

class menuPage extends StatefulWidget {
  @override
  State<menuPage> createState() => _menuPageState();
}

class _menuPageState extends State<menuPage> {
  DateTime SelectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Column(
      children: [
        CalendarTimeline(
          dayNameColor: MyThemeData.PrimaryColor,
          showYears: false,
          initialDate: SelectedDate,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(Duration(days: 365 * 8)),
          onDateSelected: (date) {
            SelectedDate = date;
            setState(() {});
          },
          leftMargin: 20,
          monthColor:
              (pro.theme == MyThemeData.darkTheme ? Colors.blue : Colors.white),
          dayColor:
              (pro.theme == MyThemeData.darkTheme ? Colors.blue : Colors.white),
          activeDayColor: MyThemeData.PrimaryColor,
          activeBackgroundDayColor: Colors.white,
          dotsColor: Colors.transparent,
          selectableDayPredicate: (date) => date.day != 23,
          locale: 'en_ISO',
        ),
        Expanded(
            child: StreamBuilder<QuerySnapshot<TaskModel>>(
          stream: readTaskFromFireStore(SelectedDate),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("Something went wrong");
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            List<TaskModel> Tasks =
                snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
            return ListView.builder(
              itemCount: Tasks.length,
              itemBuilder: (context, index) {
                return taskItem(taskModel: Tasks[index]);
              },
            );
          },
        ))
      ],
    );
  }
}
