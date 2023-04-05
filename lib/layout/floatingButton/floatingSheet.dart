import 'package:flutter/material.dart';
import 'package:todo/constant/textFormField.dart';

class floatingSheet extends StatefulWidget {
  @override
  State<floatingSheet> createState() => _floatingSheetState();
}

class _floatingSheetState extends State<floatingSheet> {
  DateTime selectedDate = DateTime.now();
  var formKey = GlobalKey<FormState>();
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
            style: Theme.of(context).textTheme.subtitle1,
          ),
          textFormField(
            hinText: 'Enter Your Task Title',
          ),
          textFormField(
            hinText: 'Enter Your Task descreption',
          ),
          Row(
            children: [
              Text(
                'select Time',
                style: Theme.of(context).textTheme.subtitle1,
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
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Icon(Icons.arrow_drop_down)
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {}
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
