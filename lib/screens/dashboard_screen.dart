import 'package:fitness_app/constants.dart';
import 'package:fitness_app/size_config.dart';
import 'package:fitness_app/widget/heading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pedometer/pedometer.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  Stream<StepCount> _stepCountStream;
  Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '?', _steps = '0';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      _steps = event.steps.toString();
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    print(event);
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    setState(() {
      _status = 'Pedestrian Status not available';
    });
    print(_status);
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      _steps = 'Step Count not available';
    });
  }

  void initPlatformState() {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.blockSizeVertical * 90,
      child: Column(
        children: [_buildDaysBar(), _buildDashboardCards()],
      ),
    );
  }

  Widget _buildDashboardCards() {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: CustomColors.kBackgroundColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        ),
        child: Column(
          children: [
            HeadingWidget(text1: 'ACTIVITY', text2: ''),
            // _buildCard(
            //     color1: CustomColors.kLightPinkColor,
            //     color2: CustomColors.kCyanColor,
            //     color3: CustomColors.kYellowColor,
            //     color4: CustomColors.kPurpleColor,
            //     value: 0.6,
            //     iconPath: 'assets/icons/running.svg',
            //     metricType: 'Running',
            //     metricCount1: '2500',
            //     metricCount2: '4000'),
            _buildCard(
                color1: CustomColors.kCyanColor,
                color2: CustomColors.kYellowColor,
                color3: CustomColors.kPurpleColor,
                color4: CustomColors.kLightPinkColor,
                value: 0.8,
                iconPath: 'assets/icons/footprints.svg',
                metricType: 'Steps',
                metricCount1: _steps,
                metricCount2: _status)
          ],
        ),
      ),
    );
  }

  Container _buildCard(
      {Color color1,
      Color color2,
      Color color3,
      Color color4,
      String metricType,
      String metricCount1,
      String metricCount2,
      double value,
      String iconPath}) {
    return Container(
      height: SizeConfig.blockSizeVertical * 30, // 30% of screen
      width:
          SizeConfig.blockSizeHorizontal * 90, // 90% of total width of screen
      margin: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 1),
      decoration: BoxDecoration(
          color: CustomColors.kPrimaryColor,
          borderRadius: BorderRadius.circular(20.0)),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: SizeConfig.blockSizeVertical * 12, // 12% of screen
              width:
                  SizeConfig.blockSizeHorizontal * 23, // 23% of width of screen
              decoration: BoxDecoration(
                  color: color1,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(130),
                      topRight: Radius.circular(20))),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 20.0),
              child: CircleAvatar(
                backgroundColor: color2,
                radius: SizeConfig.blockSizeHorizontal * 8,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: SizeConfig.blockSizeVertical * 10, // 12% of screen
              width:
                  SizeConfig.blockSizeHorizontal * 10, // 23% of width of screen
              decoration: BoxDecoration(
                  color: color3,
                  borderRadius: BorderRadius.only(
                      topRight:
                          Radius.circular(SizeConfig.blockSizeVertical * 5),
                      bottomRight:
                          Radius.circular(SizeConfig.blockSizeVertical * 5))),
            ),
          ),
          Positioned(
            top: SizeConfig.blockSizeVertical * 10,
            left: SizeConfig.blockSizeHorizontal * 16,
            child: CircleAvatar(
              backgroundColor: color4,
              radius: SizeConfig.blockSizeHorizontal * 2,
            ),
          ),
          Positioned(
            bottom: SizeConfig.blockSizeVertical * 5,
            right: SizeConfig.blockSizeHorizontal * 10,
            child: CircleAvatar(
              backgroundColor: color4,
              radius: SizeConfig.blockSizeHorizontal * 6,
            ),
          ),
          Positioned(
            top: SizeConfig.blockSizeVertical * 3,
            left: SizeConfig.blockSizeHorizontal * 6,
            child: Container(
              child: Row(
                children: [
                  SvgPicture.asset(
                    iconPath,
                    height: SizeConfig.blockSizeVertical * 5,
                  ),
                  SizedBox(
                    width: SizeConfig.blockSizeVertical * 1,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        metricType,
                        style: TextStyle(color: CustomColors.kLightColor),
                      ),
                      Text(
                        metricCount1,
                        style: CustomTextStyle.metricTextStyle,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: SizeConfig.blockSizeVertical * 5,
            left: SizeConfig.blockSizeHorizontal * 6,
            child: Container(
              child: Row(
                children: [
                  Text(
                    metricCount2,
                    style: CustomTextStyle.metricTextStyle,
                  ),
                  Text(
                    ' ',
                    style: TextStyle(color: CustomColors.kLightColor),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: SizeConfig.blockSizeVertical * 1, // 12% of screen
              width:
                  SizeConfig.blockSizeHorizontal * 75, // 23% of width of screen
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: LinearProgressIndicator(
                    value: value,
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                    backgroundColor: CustomColors.kLightColor.withOpacity(0.2)),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container _buildDaysBar() {
    return Container(
      margin: EdgeInsets.only(
        top: SizeConfig.blockSizeVertical * 2,
        bottom: SizeConfig.blockSizeVertical * 2,
      ),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Today',
            style: CustomTextStyle.dayTabBarStyleActive,
          ),
          Text(
            'Yesterday',
            style: CustomTextStyle.dayTabBarStyleInactive,
          ),

        ],
      ),
    );
  }
}
