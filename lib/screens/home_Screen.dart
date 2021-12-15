
import 'package:fitness_app/constants.dart';
import 'package:fitness_app/screens/activity_screen.dart';
import 'package:fitness_app/screens/dashboard_screen.dart';
import 'package:fitness_app/screens/metric_screen.dart';
import 'package:fitness_app/size_config.dart';
import 'package:fitness_app/widget/navigation_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _currentIndex = 0;

  final tabs = [
    DashboardScreen(),
    ActivityScreen(),
    MetricScreen(),
    Center(
      child: Text('Profile'),
    )
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // This is to instantiate the class responsible for Responsive UI
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: CustomColors.kPrimaryColor,
              size: 30,
            ),
            onPressed: () {mydrawer(); }),
        title: SvgPicture.asset(
          'assets/icons/dumbell.svg',
          height: SizeConfig.blockSizeHorizontal * 10,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Icon(
              Icons.notifications,
              size: 30,
              color: CustomColors.kPrimaryColor,
            ),
          )
        ],
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          elevation: 10,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.bolt_horizontal,
                color: _currentIndex == 0
                    ? CustomColors.kPrimaryColor
                    : Colors.grey,
              ),
              title: Text(
                "Dashboard",
                style: TextStyle(
                    color: _currentIndex == 0
                        ? CustomColors.kPrimaryColor
                        : Colors.transparent),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.ant,
                color: _currentIndex == 1
                    ? CustomColors.kPrimaryColor
                    : Colors.grey,
              ),
              title: Text(
                "Activities",
                style: TextStyle(
                    color: _currentIndex == 1
                        ? CustomColors.kPrimaryColor
                        : Colors.transparent),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.graph_square,
                color: _currentIndex == 2
                    ? CustomColors.kPrimaryColor
                    : Colors.grey,
              ),
              title: Text(
                "Stats",
                style: TextStyle(
                    color: _currentIndex == 2
                        ? CustomColors.kPrimaryColor
                        : Colors.transparent),
              ),

            ),
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.person,
                color: _currentIndex == 3
                    ? CustomColors.kPrimaryColor
                    : Colors.grey,
              ),
              title: Text(
                "Profile",
                style: TextStyle(
                    color: _currentIndex == 3
                        ? CustomColors.kPrimaryColor
                        : Colors.transparent),
              ),
            ),
          ]),
    );
  }
}
