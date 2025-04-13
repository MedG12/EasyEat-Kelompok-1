import 'package:easy_eat/screens/activity/history_section.dart';
import 'package:easy_eat/screens/activity/onGoing_section.dart';
import 'package:easy_eat/static/navigation_route.dart';
import 'package:flutter/material.dart';

class ActivityPage extends StatefulWidget {
  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text(
              'Aktivitas',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'SF-Pro',
                fontWeight: FontWeight.w500,
              ),
            ),
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, NavigationRoute.cartRoute.name);
                },
              )
            ],
            centerTitle: true,
            backgroundColor: Color.fromRGBO(239, 239, 232, 1),
          ),
          SliverFillRemaining(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  padding: EdgeInsets.zero,
                  color: Color.fromRGBO(217, 217, 217, 1),
                  child: TabBar(
                    controller: _tabController,
                    labelPadding: const EdgeInsets.only(
                      left: 0,
                      right: 32,
                    ),
                    indicatorPadding: EdgeInsets.zero,
                    tabs: [
                      Tab(text: "Dalam Proses"),
                      Tab(text: "Riwayat"),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      OngoingSection(),
                      HistorySection(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
