import 'package:expense_tracker_app/constants/colors.dart';
import 'package:expense_tracker_app/screens/home/dashboardPage.dart';
import 'package:expense_tracker_app/screens/home/signoutPage.dart';
import 'package:expense_tracker_app/screens/home/walletPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BasePage extends StatefulWidget {
  const BasePage({Key? key}) : super(key: key);

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> with TickerProviderStateMixin {
  int index = 1;
  late TabController tabController;
  List<String> tabs = ["dashboard", "wallet", "signOut"];
  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 1,
      length: tabs.length,
      vsync: this,
    );
  }

  Widget iconContainer({iconName}) {
    return Container(
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
      ),
      child: Icon(
        iconName,
        size: 30,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      iconContainer(iconName: CupertinoIcons.graph_circle_fill),
      iconContainer(iconName: CupertinoIcons.home),
      iconContainer(iconName: CupertinoIcons.power),
    ];

    final screens = [DashboardPage(), WalletPage(), SignoutPage()];
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Theme.of(context).brightness == Brightness.light
          ? Color.fromARGB(255, 32, 32, 39)
          : AppColors.darkpinkColor,
    ));
    return Scaffold(
        // extendBody: true,
        body: TabBarView(
          controller: tabController,
          children: [DashboardPage(), WalletPage(), SignoutPage()],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.pink
                  : AppColors.black),
          child: TabBar(
            // indicatorColor: AppColors.purpleColor,
            indicator: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.pink.shade100
                    : AppColors.darkpinkColor),
            controller: tabController,
            tabs: [
              Tab(
                child: items[0],
              ),
              Tab(
                child: items[1],
              ),
              Tab(
                child: items[2],
              ),
            ],
          ),
        )
        // CurvedNavigationBar(
        //   height: 60,
        //   index: index,`
        //   items: items,
        //   animationCurve: Curves.easeInOut,
        //   animationDuration: Duration(milliseconds: 500),
        //   color: AppColors.purpleColor,
        //   backgroundColor: Colors.transparent,
        //   onTap: (index) => setState(() => this.index = index),
        // ),
        );
  }
}
