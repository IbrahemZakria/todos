import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Style/My_Theme_Data.dart';
import '../../../moduls/MyProvider.dart';

class bottomThemeSheet extends StatefulWidget {
  const bottomThemeSheet({super.key});

  @override
  State<bottomThemeSheet> createState() => _bottomThemeSheetState();
}

class _bottomThemeSheetState extends State<bottomThemeSheet> {
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    gitShared();
    return Container(
      color: pro.theme == MyThemeData.Lighttheme
          ? Colors.white
          : MyThemeData.darkaccentColor,
      child: Column(
        children: [
          InkWell(
              onTap: () {
                pro.ChangeTheme(MyThemeData.Lighttheme);
              },
              child: SelectedLanuage('LightMode',
                  pro.theme == MyThemeData.Lighttheme ? true : false)),
          InkWell(
              onTap: () {
                pro.ChangeTheme(MyThemeData.darkTheme);
              },
              child: SelectedLanuage('DarkMode',
                  pro.theme == MyThemeData.darkTheme ? true : false))
        ],
      ),
    );
  }

  Widget SelectedLanuage(String text, bool selection) {
    var pro = Provider.of<MyProvider>(context);

    if (selection) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$text',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Icon(
            Icons.check,
            color: pro.theme == MyThemeData.Lighttheme
                ? MyThemeData.PrimaryColor
                : MyThemeData.PrimaryColor,
          )
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$text',
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(fontWeight: FontWeight.w300),
          ),
          Icon(
            Icons.check,
            color: pro.theme == MyThemeData.Lighttheme
                ? Colors.black
                : Colors.white,
          )
        ],
      );
    }
  }

  Future<void> gitShared() async {
    var provider = Provider.of<MyProvider>(context);

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getString('theme') == 'light') {
      provider.ChangeTheme(MyThemeData.Lighttheme);
    } else {
      provider.ChangeTheme(MyThemeData.darkTheme);
    }
  }
}
