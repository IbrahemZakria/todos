import 'package:flutter/material.dart';
import 'package:todo/Style/My_Theme_Data.dart';


class taskItem extends StatelessWidget {
  const taskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      padding: EdgeInsets.all(15),
      height: MediaQuery.of(context).size.height * .15,
      child: Row(
        children: [
          VerticalDivider(
            width: 50,
            thickness: 3,
            color: MyThemeData.PrimaryColor,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'play Pppp',
                  style: TextStyle(
                      color: MyThemeData.PrimaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.watch_later_outlined,
                      size: 18,
                    ),
                    Text(
                      'play Pppp',
                      style: TextStyle(
                          color: MyThemeData.PrimaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
              width: 70,
              decoration: BoxDecoration(
                  color: MyThemeData.PrimaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.done_rounded,
                    color: Colors.white,
                    size: 40,
                  )))
        ],
      ),
    );
  }
}
