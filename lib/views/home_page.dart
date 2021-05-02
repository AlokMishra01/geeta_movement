import 'package:flutter/material.dart';

import 'audio_bookui.dart';
import 'ebookui.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: SafeArea(
          child: AppBar(
            actions: [],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0))),
            elevation: 2,
            backgroundColor: Color(0xffE40007),
            flexibleSpace: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 70.0, 25.0, 0.0),
                  child: Center(
                    child: Text(
                      'Bhagwat Geeta',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(95.0, 65.0, 5.0, 0.0),
                  child: Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 31,
          ),
          // give the tab bar a height [can change hheight to preferred height]
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0)),
            elevation: 5,
            child: Container(
              width: 250,
              height: 45,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
              ),
              child: TabBar(
                physics: NeverScrollableScrollPhysics(),
                controller: _tabController,
                // give the indicator a decoration (color and border radius)
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                  color: Color(0xCCE40007),
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: [
                  // first tab [you can add an icon using the icon property]
                  Tab(
                    text: 'EBook',
                  ),

                  // second tab [you can add an icon using the icon property]
                  Tab(
                    text: 'AudioBook',
                  ),
                ],
              ),
            ),
          ),
          // tab bar view here
          SizedBox(
            height: 35,
          ),
          Container(
            height: 50,
            width: 380,
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0)),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(90.0)),
                        borderSide: BorderSide(
                          color: Color(0xCCE40007),
                        )),
                    focusColor: Color(0xCCE40007),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    hintStyle: TextStyle(
                        color: Colors.grey, fontFamily: "WorkSansLight"),
                    filled: false,
                    fillColor: Colors.white24,
                    hintText: 'search'),
              ),
            ),
          ),
          SizedBox(
            height: 38,
          ),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // first tab bar view widget
                EBook(),

                // second tab bar view widget
                AudioBook()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
