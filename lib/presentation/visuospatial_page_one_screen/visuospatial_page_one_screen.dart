import 'package:adas_development/core/app_export.dart';
import 'package:adas_development/widgets/custom_elevated_button.dart';
import 'package:adas_development/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:collection/collection.dart';

class VisuospatialPageOneScreen extends StatefulWidget {
  const VisuospatialPageOneScreen({Key? key}) : super(key: key);

  @override
  State<VisuospatialPageOneScreen> createState() =>
      _VisuospatialPageOneScreenState();
}

class _VisuospatialPageOneScreenState extends State<VisuospatialPageOneScreen> {
  List<Offset> touchedPositions = [];
  List<String> userSequence = [];
  int score = 0;

  // Correct sequence
  final List<String> correctSequence = [
    "1",
    "A",
    "2",
    "B",
    "3",
    "C",
    "4",
    "D",
    "5",
    "E"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Stack(
      children: [
        Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 41.v),
            child: Column(children: [
              SizedBox(height: 4.v),
              _buildClockSection(context),
              SizedBox(height: 56.v),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                    width: 27.adaptSize,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.h, vertical: 1.v),
                    decoration: AppDecoration.fillOnSecondaryContainer.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder12),
                    child: Text("1",
                        style: CustomTextStyles.bodyMediumSecondaryContainer)),
                Container(
                    width: 27.adaptSize,
                    margin: EdgeInsets.only(left: 12.h, bottom: 1.v),
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.h, vertical: 1.v),
                    decoration: AppDecoration.outlineBlack90002.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder12),
                    child: Text("2", style: theme.textTheme.bodyMedium)),
                Container(
                    width: 27.adaptSize,
                    margin: EdgeInsets.only(left: 12.h, bottom: 1.v),
                    padding:
                        EdgeInsets.symmetric(horizontal: 7.h, vertical: 1.v),
                    decoration: AppDecoration.outlineBlack90002.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder12),
                    child: Text("3", style: theme.textTheme.bodyMedium))
              ]),
              SizedBox(height: 18.v),
              Container(
                  width: 400.h,
                  margin: EdgeInsets.only(left: 13.h),
                  child: Text(
                      "Please draw a line, going from a number\nto a letter in ascending order. Begin here [point to (1)] and draw a line from 1 then to A\nthen to 2 and so on. End here [point to (E)]",
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: CustomTextStyles.bodyMedium_1
                          .copyWith(height: 2.07))),
              SizedBox(height: 17.v),
              _buildESection(context),
              Spacer(),
              CustomElevatedButton(
                  width: 146.h,
                  text: "Next",
                  margin: EdgeInsets.only(right: 10.h),
                  buttonTextStyle: theme.textTheme.titleSmall!,
                  onPressed: () {
                    _calculateScore(); // Calculate score
                    print('Final Score: $score'); // Debugging purpose
                    onTapNext(context);
                  },
                  alignment: Alignment.centerRight)
            ])),
        ..._buildLineIcons(),
      ],
    )));
  }

  /// Section Widget
  Widget _buildClockSection(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomIconButton(
              height: 45.adaptSize,
              width: 45.adaptSize,
              onTap: () {},
              child:
                  CustomImageView(imagePath: ImageConstant.imgClockBlack9000234x34)),
          Padding(
              padding: EdgeInsets.only(left: 19.h, top: 11.v, bottom: 8.v),
              child: Text("Visuospatial / Executive",
                  style: theme.textTheme.headlineMedium))
        ]));
  }

  /// Section Widget
  Widget _buildESection(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 20.h, right: 9.h),
        padding: EdgeInsets.symmetric(horizontal: 41.h, vertical: 21.v),
        decoration: AppDecoration.fillGray200
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder30),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 52.h),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                            onTapDown: (TapDownDetails details) {
                              final Offset position = details.globalPosition;

                              setState(() {
                                if (userSequence.isEmpty ||
                                    userSequence.last != "E") {
                                  userSequence.add("E");
                                  touchedPositions.add(position);
                                }
                              });
                              print('Circle  touched at: $position');
                            },
                            child: Container(
                                width: 40.adaptSize,
                                margin: EdgeInsets.only(bottom: 20.v),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12.h, vertical: 1.v),
                                decoration: AppDecoration.fillOnPrimaryContainer
                                    .copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.circleBorder20),
                                child: Text("E",
                                    style: theme.textTheme.headlineSmall))),
                        GestureDetector(
                            onTapDown: (TapDownDetails details) {
                              final Offset position = details.globalPosition;

                              setState(() {
                                if (userSequence.isEmpty ||
                                    userSequence.last != "A") {
                                  userSequence.add("A");
                                  touchedPositions.add(position);
                                }
                              });
                              print('Circle touched at: $position');
                            },
                            child: Container(
                                width: 40.adaptSize,
                                margin: EdgeInsets.only(left: 69.h, top: 20.v),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 11.h, vertical: 1.v),
                                decoration: AppDecoration.fillOnPrimaryContainer
                                    .copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.circleBorder20),
                                child: Text("A",
                                    style: theme.textTheme.headlineSmall)))
                      ])),
              SizedBox(height: 15.v),
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                GestureDetector(
                    onTapDown: (TapDownDetails details) {
                      final Offset position = details.globalPosition;

                      setState(() {
                        if (userSequence.isEmpty ||
                                    userSequence.last != "5") {
                                  userSequence.add("5");
                                  touchedPositions.add(position);
                                }
                      });
                      print('Circle touched at: $position');
                    },
                    child: Container(
                        width: 40.adaptSize,
                        margin: EdgeInsets.only(bottom: 66.v),
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.h, vertical: 1.v),
                        decoration: AppDecoration.fillOnPrimaryContainer
                            .copyWith(
                                borderRadius: BorderRadiusStyle.circleBorder20),
                        child:
                            Text("5", style: theme.textTheme.headlineSmall))),
                GestureDetector(
                    onTapDown: (TapDownDetails details) {
                      final Offset position = details.globalPosition;

                      setState(() {
                        if (userSequence.isEmpty ||
                                    userSequence.last != "1") {
                                  userSequence.add("1");
                                  touchedPositions.add(position);
                                }
                      });
                      print('Circle touched at: $position');
                    },
                    child: Container(
                        width: 40.adaptSize,
                        margin: EdgeInsets.only(left: 15.h, top: 66.v),
                        padding: EdgeInsets.symmetric(
                            horizontal: 14.h, vertical: 1.v),
                        decoration: AppDecoration.fillOnPrimaryContainer
                            .copyWith(
                                borderRadius: BorderRadiusStyle.circleBorder20),
                        child:
                            Text("1", style: theme.textTheme.headlineSmall))),
                Spacer(flex: 52),
                GestureDetector(
                    onTapDown: (TapDownDetails details) {
                      final Offset position = details.globalPosition;

                      setState(() {
                        if (userSequence.isEmpty ||
                                    userSequence.last != "B") {
                                  userSequence.add("B");
                                  touchedPositions.add(position);
                                }
                      });
                      print('Circle touched at: $position');
                    },
                    child: Container(
                        width: 40.adaptSize,
                        margin: EdgeInsets.only(top: 56.v, bottom: 10.v),
                        padding: EdgeInsets.symmetric(
                            horizontal: 11.h, vertical: 1.v),
                        decoration: AppDecoration.fillOnPrimaryContainer
                            .copyWith(
                                borderRadius: BorderRadiusStyle.circleBorder20),
                        child:
                            Text("B", style: theme.textTheme.headlineSmall))),
                Spacer(flex: 47),
                GestureDetector(
                    onTapDown: (TapDownDetails details) {
                      final Offset position = details.globalPosition;
                      setState(() {
                        if (userSequence.isEmpty ||
                                    userSequence.last != "2") {
                                  userSequence.add("2");
                                  touchedPositions.add(position);
                                }
                      });
                      print('Circle touched at: $position');
                    },
                    child: Container(
                        width: 40.adaptSize,
                        margin: EdgeInsets.only(top: 26.v, bottom: 40.v),
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.h, vertical: 1.v),
                        decoration: AppDecoration.fillOnPrimaryContainer
                            .copyWith(
                                borderRadius: BorderRadiusStyle.circleBorder20),
                        child: Text("2", style: theme.textTheme.headlineSmall)))
              ]),
              SizedBox(height: 25.v),
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                GestureDetector(
                    onTapDown: (TapDownDetails details) {
                      final Offset position = details.globalPosition;
                      setState(() {
                        if (userSequence.isEmpty ||
                                    userSequence.last != "D") {
                                  userSequence.add("D");
                                  touchedPositions.add(position);
                                }
                      });
                      print('Circle touched at: $position');
                    },
                    child: Container(
                        width: 40.adaptSize,
                        margin: EdgeInsets.only(top: 10.v, bottom: 20.v),
                        padding: EdgeInsets.symmetric(
                            horizontal: 11.h, vertical: 1.v),
                        decoration: AppDecoration.fillOnPrimaryContainer
                            .copyWith(
                                borderRadius: BorderRadiusStyle.circleBorder20),
                        child:
                            Text("D", style: theme.textTheme.headlineSmall))),
                Spacer(flex: 55),
                GestureDetector(
                    onTapDown: (TapDownDetails details) {
                      final Offset position = details.globalPosition;
                      setState(() {
                        if (userSequence.isEmpty ||
                                    userSequence.last != "4") {
                                  userSequence.add("4");
                                  touchedPositions.add(position);
                                }
                      });
                      print('Circle touched at: $position');
                    },
                    child: Container(
                        width: 40.adaptSize,
                        margin: EdgeInsets.only(bottom: 30.v),
                        padding: EdgeInsets.symmetric(
                            horizontal: 11.h, vertical: 1.v),
                        decoration: AppDecoration.fillOnPrimaryContainer
                            .copyWith(
                                borderRadius: BorderRadiusStyle.circleBorder20),
                        child:
                            Text("4", style: theme.textTheme.headlineSmall))),
                Spacer(flex: 44),
                GestureDetector(
                    onTapDown: (TapDownDetails details) {
                      final Offset position = details.globalPosition;
                      setState(() {
                        if (userSequence.isEmpty ||
                                    userSequence.last != "3") {
                                  userSequence.add("3");
                                  touchedPositions.add(position);
                                }
                      });
                      print('Circle touched at: $position');
                    },
                    child: Container(
                        width: 40.adaptSize,
                        margin: EdgeInsets.only(top: 30.v),
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.h, vertical: 1.v),
                        decoration: AppDecoration.fillOnPrimaryContainer
                            .copyWith(
                                borderRadius: BorderRadiusStyle.circleBorder20),
                        child: Text("3", style: theme.textTheme.headlineSmall)))
              ]),
              SizedBox(height: 12.v),
              GestureDetector(
                  onTapDown: (TapDownDetails details) {
                    final Offset position = details.globalPosition;
                    setState(() {
                      if (userSequence.isEmpty ||
                                    userSequence.last != "C") {
                                  userSequence.add("C");
                                  touchedPositions.add(position);
                                }
                    });
                    print('Circle touched at: $position');
                  },
                  child: Container(
                      width: 40.adaptSize,
                      margin: EdgeInsets.only(left: 55.h),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.h, vertical: 1.v),
                      decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
                          borderRadius: BorderRadiusStyle.circleBorder20),
                      child: Text("C", style: theme.textTheme.headlineSmall))),
              SizedBox(height: 4.v)
            ]));
  }

  List<Widget> _buildLineIcons() {
    List<Widget> lineWidgets = [];
    for (int i = 0; i < touchedPositions.length - 1; i++) {
      final Offset start = touchedPositions[i];
      final Offset end = touchedPositions[i + 1];

      final double angle = atan2(end.dy - start.dy, end.dx - start.dx);
      final double distance = (start - end).distance;

      lineWidgets.add(
        Positioned(
          left: (start.dx + end.dx) / 2 - (distance / 2),
          top: (start.dy + end.dy) / 2 - 8,
          child: Transform.rotate(
            angle: angle,
            child: Container(
              width: distance,
              height: 2,
              color: Colors.black,
            ),
          ),
        ),
      );
    }
    return lineWidgets;
  }

  void _calculateScore() {
    if (userSequence.length == correctSequence.length &&
        ListEquality().equals(userSequence, correctSequence)) {
      score = 1; // Correct sequence
    } else {
      score = 0; // Incorrect sequence
    }
  }

  /// Navigates to the homePageScreen when the action is triggered.
  onTapBtnClock(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.homePageScreen);
  }

  /// Navigates to the visuospatialPageTwoScreen when the action is triggered.
  onTapNext(BuildContext context) {
    Navigator.pushNamed(
      context,
      AppRoutes.visuospatialPageTwoScreen,
      arguments: {"score": score}, // Pass the score as an argument
    );
  }
}
