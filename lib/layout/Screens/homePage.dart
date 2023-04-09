import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:todo/Style/My_Theme_Data.dart';
import 'package:todo/layout/Screens/menu/menuPage.dart';
import 'package:todo/layout/floatingButton/floatingSheet.dart';
import 'package:todo/layout/setting/settingsScreen.dart';

class homePage extends StatefulWidget {
  homePage({super.key});
  static const String id = 'homePage';

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  List<Widget> ScreensTaps = [menuPage(), settingsScreen()];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'To Do List',
              style: Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.left,
            ),
          ],
        ),
        toolbarHeight: MediaQuery.of(context).size.height * .2,
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 5,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.menu_rounded), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: '')
          ],
          currentIndex: currentIndex,
          onTap: (index) {
            currentIndex = index;
            setState(() {});
          },
        ),
      ),
      body: ScreensTaps[currentIndex],
      floatingActionButton: Ink(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white,
            width: 4,
          ),
        ),
        child: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            showBottmShet();
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void showBottmShet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return floatingSheet();
      },
    );
  }
}
