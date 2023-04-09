import 'package:flutter/material.dart';

ShowLoading(BuildContext context, String text) {
  showDialog(
    barrierDismissible: true,
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Row(
          children: [
            CircularProgressIndicator(),
            SizedBox(
              width: 10,
            ),
            Text(text, style: Theme.of(context).textTheme.subtitle1)
          ],
        ),
      );
    },
  );
}

ShowsucsessDialog(BuildContext context, String text) {
  showDialog(
    barrierDismissible: true,
    context: context,
    builder: (context) {
      return AlertDialog(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Text('ok', style: Theme.of(context).textTheme.subtitle1))
        ],
        content: Text(text, style: Theme.of(context).textTheme.subtitle1),
      );
    },
  );
}
