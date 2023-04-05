import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class textFormField extends StatelessWidget {
  textFormField({required this.hinText});
  String hinText;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return hinText;
              }
            },
            decoration: InputDecoration(
                labelText: hinText,
                labelStyle: TextStyle(color: Colors.grey, fontSize: 20),
                border: UnderlineInputBorder(
                    borderSide: BorderSide(strokeAlign: 5)))));
  }
}
