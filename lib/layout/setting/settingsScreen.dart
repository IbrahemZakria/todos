import 'package:flutter/material.dart';
import 'package:todo/layout/setting/theme/themeSheet.dart';

class settingsScreen extends StatelessWidget {
  const settingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'theme',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ],
            ),
          ),
         
       
          ThemeSheet(themeMode: 'ThemeMode')
        ],
      ),
    );
  }
}
