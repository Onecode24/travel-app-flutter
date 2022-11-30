import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travel_app/widgets/app_large_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Menu container
          Container(
            padding: EdgeInsets.only(top: 70, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.menu_rounded,
                  size: 30,
                  color: Colors.black54,
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.5)),
                )
              ],
            ),
          ),
          SizedBox(height: 40),
          // Discover text
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: AppLargeText(text: 'Discover'),
          ),
          SizedBox(height: 30),
          // Tabbar
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
                child: TabBar(
                    controller: tabController,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey.withOpacity(0.7),
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: [
                  Tab(text: "Places"),
                  Tab(text: "Inspiration"),
                  Tab(text: "Emotions")
                ])),
          ),
          // TabBarView
          Container(
            height: 300,
            width: double.maxFinite,
            child: TabBarView(controller: tabController, children: [
              Text("Let's dicovers best places"),
              Text("Inspiration View"),
              Text("Emotion View"),
            ]),
          )
        ],
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: Implement createBoxPainter
    throw UnimplementedError();
  }
}
