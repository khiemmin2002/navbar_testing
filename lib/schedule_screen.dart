import 'package:flutter/material.dart';
import 'package:navbar_testing/tabs/menu_tab.dart';
import 'package:navbar_testing/tabs/timetable_tab.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            TabBar(
              controller: _tabController,
              indicatorColor: Color.fromRGBO(254, 206, 38, 1),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 3,
              tabs: [
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.calendar_month_rounded,
                        color: _tabController.index == 0
                            ? Color.fromRGBO(254, 206, 38, 1)
                            : Color.fromRGBO(136, 136, 136, 1),
                      ),
                      SizedBox(width: 8), // Add some space between icon and label
                      Text(
                        "Timetable",
                        style: TextStyle(
                          color: _tabController.index == 0
                              ? Color.fromRGBO(254, 206, 38, 1)
                              : Color.fromRGBO(136, 136, 136, 1),
                          fontWeight: _tabController.index == 0 ? FontWeight.bold : FontWeight.normal,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.dining_outlined,
                        color: _tabController.index == 1
                            ? Color.fromRGBO(254, 206, 38, 1)
                            : Color.fromRGBO(136, 136, 136, 1),
                      ),
                      SizedBox(width: 8), // Add some space between icon and label
                      Text(
                        "Menu",
                        style: TextStyle(
                          color: _tabController.index == 1
                              ? Color.fromRGBO(254, 206, 38, 1)
                              : Color.fromRGBO(136, 136, 136, 1),
                          fontWeight: _tabController.index == 1 ? FontWeight.bold : FontWeight.normal,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  TimetableTab(),
                  MenuTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}