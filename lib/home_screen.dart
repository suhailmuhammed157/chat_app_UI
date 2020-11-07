import 'package:chat_app_machine_test/pages/business_page.dart';
import 'package:chat_app_machine_test/pages/calls_page.dart';
import 'package:chat_app_machine_test/pages/huddles_page.dart';
import 'package:chat_app_machine_test/pages/personal_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      initialIndex: 1,
      length: 4,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            new SliverAppBar(
              pinned: true,
              floating: true,
              forceElevated: innerBoxIsScrolled,
              toolbarHeight: 70.0,
              // leading: CircleAvatar(
              //   radius: 20,
              //   backgroundImage: NetworkImage(
              //       'https://elephant-api.herokuapp.com/pictures/005.jpg'),
              // ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        'https://elephant-api.herokuapp.com/pictures/005.jpg'),
                  ),
                  Text(
                    'FLASHAT',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              elevation: 7.0,
              bottom: TabBar(
                controller: _tabController,
                indicatorColor: Color(0xFFFBFEFB),
                labelColor: Color(0xFFFBFEFB),
                unselectedLabelColor: Color(0xFFFBFEFB),
                tabs: [
                  Tab(
                    text: 'PERSONAL',
                  ),
                  Tab(
                    text: 'BUSINESS',
                  ),
                  Tab(
                    text: 'HUDDLES',
                  ),
                  Tab(
                    text: 'CALLS',
                  ),
                ],
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                  child: Icon(
                    Icons.search,
                    color: Color(0xFFFBFEFB),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0, right: 10.0),
                  child: Icon(
                    Icons.more_vert,
                    color: Color(0xFFFBFEFB),
                  ),
                ),
              ],
            )
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            PersonalPage(),
            BusinessPage(),
            HuddlesPage(),
            CallsPage(),
          ],
        ),
      ),
    );
  }
}
