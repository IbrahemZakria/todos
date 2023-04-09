import 'package:flutter/material.dart';
import 'package:todo/constant/textFormField.dart';
import 'package:todo/models/taskModel.dart';
import 'package:todo/shared/components.dart';
import 'package:todo/utilits/addtaskfromFireBase.dart';

class floatingSheet extends StatefulWidget {
  @override
  State<floatingSheet> createState() => _floatingSheetState();
}

class _floatingSheetState extends State<floatingSheet> {
  DateTime selectedDate = DateTime.now();
  var formKey = GlobalKey<FormState>();
  String title = 'kkk ';
  String Describtion = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      width: double.infinity,
      child: Form(
        key: formKey,
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Text(
            'add new task',
            style: Theme.of(context).textTheme.headline1,
          ),
          textFormField(
            hinText: 'Enter Your Task Title',
            onChange: (DATA) {
              title = DATA;
            },
          ),
          textFormField(
            hinText: 'Enter Your Task describtion',
            onChange: (Data) {
              Describtion = Data;
            },
          ),
          Row(
            children: [
              Text(
                'select Time',
                style: Theme.of(context).textTheme.headline2,
              ),
            ],
          ),
          InkWell(
            onTap: () {
              openDatePicer();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${selectedDate.year}/${selectedDate.month}/${selectedDate.day}',
                  style: Theme.of(context).textTheme.headline2,
                ),
                Icon(Icons.arrow_drop_down)
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  CircularProgressIndicator;
                  TaskModel task = TaskModel(
                    title: title,
                    describtion: Describtion,
                    Date: selectedDate.millisecondsSinceEpoch,
                  );
                  ShowLoading(context, 'Loading ...');
                  addtaskfromFireBase(TaskModel(
                    title: title,
                    describtion: Describtion,
                    Date:
                        DateUtils.dateOnly(selectedDate).millisecondsSinceEpoch,
                  )).then((value) {
                    Navigator.pop(context);
                    ShowsucsessDialog(context, 'success');
                  }).catchError(() {});
                  Navigator.pop(context);
                }
              },
              child: Text('add task'))
        ]),
      ),
    );
  }

  Future<void> openDatePicer() async {
    var choseDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (choseDate == null) {
      selectedDate = selectedDate;
    } else {
      selectedDate = choseDate;
    }
    setState(() {});
  }
}
