import 'package:easy_eat/screens/activity/activity_page.dart';
import 'package:flutter/material.dart';

import 'package:easy_eat/screens/home/home_page.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';

import 'package:easy_eat/screens/profile/profile_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  late int currentPage;
  late TabController tabController;

  @override
  void initState() {
    currentPage = 0;
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(239, 239, 232, 1),
        body: SafeArea(
          child: BottomBar(
            width: MediaQuery.of(context).size.width * 0.91,
            borderRadius: BorderRadius.circular(40.0),
            barColor: Color(0xFFDFD87B),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        iconSize: 28,
                        onPressed: () => tabController.animateTo(0),
                        icon: Icon(
                          Icons.home,
                          color: Colors.black,
                        )),
                    IconButton(
                        iconSize: 28,
                        onPressed: () => tabController.animateTo(1),
                        icon: Icon(
                          Icons.receipt_long_outlined,
                          color: Colors.black,
                        )),
                    IconButton(
                        iconSize: 28,
                        onPressed: () => Navigator.pushNamed(context, '/profile'),
                        icon: Icon(
                          Icons.person,
                          color: Colors.black,
                        )),
                  ]),
            ),
            body: (context, controller) => TabBarView(
                children: [homePage(context, controller), ActivityPage()],
                controller: tabController),
          ),
        ));
  }
}
