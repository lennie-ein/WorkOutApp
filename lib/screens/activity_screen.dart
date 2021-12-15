import 'package:animated_horizontal_calendar/animated_horizontal_calendar.dart';
import 'package:fitness_app/constants.dart';
import 'package:fitness_app/size_config.dart';
import 'package:fitness_app/widget/heading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

String formatDate(DateTime d) {
  return d.toString().substring(0, 19);
}

class ActivityScreen extends StatefulWidget {
  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  var selectedDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.blockSizeVertical * 90,
      width: double.infinity,
      child: Column(
        children: [
          _buildDateSection(),
          _buildActivitySection(),
        ],
      ),
    );
  }

  Widget _buildActivitySection() {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: CustomColors.kBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        // Ideally these cards should be the data fetched from API or they have a specific model but for simplicity let's just go like this :)
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeadingWidget(
                text1: 'ACTIVITY',
                text2: '',
              ),
              Padding(
                padding: const EdgeInsets.only(left: 300.0, top: 0.0),
                child: FloatingActionButton.extended(
                  onPressed: () {},icon: Icon(CupertinoIcons.add),
                  label: Text(
                    "Goals",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  elevation: 10,
                  backgroundColor: CustomColors.kPurpleColor,
                  splashColor: CustomColors.kLightPinkColor,
                ),
              ),
              _buildCard(
                  color: CustomColors.kYellowColor,
                  iconPath: 'assets/icons/running.svg',
                  time: '6:00 AM',
                  title: 'Running',
                  subtitle: '5KM Hard Run'),
              _buildCard(
                  color: CustomColors.kCyanColor,
                  iconPath: 'assets/icons/bike.svg',
                  time: '10:00 AM',
                  title: 'Cycling',
                  subtitle: '5KM Cycling'),
              HeadingWidget(
                text1: 'MEAL',
                text2: 'Show All',
              ),
              _buildCard(
                  color: CustomColors.kLightPinkColor,
                  iconPath: 'assets/icons/coffee.svg',
                  time: '10:00 AM',
                  title: 'Breakfast',
                  subtitle: 'Tea and Bread'),
              _buildCard(
                  color: CustomColors.kPrimaryColor,
                  iconPath: 'assets/icons/food.svg',
                  time: '02:00 PM',
                  title: 'Lunch',
                  subtitle: 'Hamburger'),
              _buildCard(
                  color: CustomColors.kCyanColor,
                  iconPath: 'assets/icons/food.svg',
                  time: '10:00 PM',
                  title: 'Dinner',
                  subtitle: 'Chicken and Waffles'),
              _buildCard(
                  color: CustomColors.kCyanColor,
                  iconPath: 'assets/icons/bike.svg',
                  time: '10:00 AM',
                  title: 'Cycling',
                  subtitle: '5KM Cycling'),
              _buildCard(
                  color: CustomColors.kCyanColor,
                  iconPath: 'assets/icons/bike.svg',
                  time: '10:00 AM',
                  title: 'Cycling',
                  subtitle: '5KM Cycling'),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildCard(
      {Color color,
      String iconPath,
      String title,
      String subtitle,
      String time}) {
    return Container(
      width: SizeConfig.blockSizeHorizontal * 90,
      margin: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 2),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(12.0)),
            child: Padding(
              padding: EdgeInsets.all(SizeConfig.blockSizeVertical * 1.2),
              child: SvgPicture.asset(
                iconPath,
                height: SizeConfig.blockSizeVertical * 5,
              ),
            ),
          ),
          SizedBox(
            width: 15.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 1,
              ),
              Text(
                subtitle,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0),
              )
            ],
          ),
          Expanded(child: Container()),
          Text(
            time,
            style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 15.0),
          ),
        ],
      ),
    );
  }

  Container _buildDateSection() {
    return Container(
      height: SizeConfig.blockSizeVertical * 10,
      child: Container(
        height: 100,
        child: AnimatedHorizontalCalendar(
            tableCalenderIcon: Icon(
              Icons.calendar_today,
              color: Colors.white,
            ),
            date: DateTime.now(),
            textColor: CustomColors.kPurpleColor,
            backgroundColor: Colors.white,
            selectedColor: CustomColors.kPurpleColor,
            selectedBoxShadow:
                BoxShadow(color: CustomColors.kLightColor, blurRadius: 10),
            unSelectedBoxShadow:
                BoxShadow(color: CustomColors.kPurpleColor, blurRadius: 10),
            onDateSelected: (date) {
              setState(() {
                selectedDate = DateTime.now();
              });
            }),
      ),
    );
  }
}
