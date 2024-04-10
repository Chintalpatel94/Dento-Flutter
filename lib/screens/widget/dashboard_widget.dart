import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import '../../utils/appColors.dart';
import '../../utils/appDimentions.dart';
import '../../utils/appString.dart';

class DashboardCalenderWidget extends StatelessWidget {
  const DashboardCalenderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          dashboardText,
          style: TextStyle(
              color: darkTextColor,
              fontWeight: FontWeight.w100,
              fontSize: font26),
        ),
        OutlinedButton(
          onPressed: () => {},
          child: Row(
            children: [
              Text(
                selectDateText,
                style: TextStyle(
                    fontSize: fontSmall,
                    fontWeight: FontWeight.w500,
                    color: darkTextColor),
              ),
              SizedBox(
                width: 10,
              ),
              Image.asset(
                "assets/calendar.png",
                height: 20,
                width: 20,
              )
            ],
          ),
        )
      ],
    );
  }
}

class MainLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
            margin: EdgeInsets.only(top: 20, right: 20),
            padding: EdgeInsets.only(top: 30),
            width: MediaQuery.of(context).size.width * 0.15,
            color: backgroundColor,
            child: LeftProfileWidget()),
        Expanded(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20, right: 20),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 60,
                color: backgroundColor,
                child: DashboardCalenderWidget(),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(height: 150, child: DashboardDetailList()),
              SizedBox(child: DashboardViewProfileWidget()),
              Expanded(child: TabViewWithListView())
            ],
          ),
        ),
      ],
    );
  }
}

class DashboardDetailList extends StatelessWidget {
  const DashboardDetailList({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150, // Adjust h
      alignment: Alignment.center, // eight as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
              width: (MediaQuery.of(context).size.width -
                      (MediaQuery.of(context).size.width * 0.15)) /
                  3, // Adjust width as needed
              child: Container(
                margin: EdgeInsets.only(left: 10),
                padding: EdgeInsets.all(20),
                width: double.infinity,
                color: backgroundColorDashboard,
                child: Row(
                  children: [
                    Image.asset("assets/actionbar_icon.png"),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "number of calls received",
                          style: TextStyle(
                              color: darkTextColor,
                              fontWeight: FontWeight.w500,
                              fontSize: fontLarge),
                        ),
                        Text(
                          "2000+",
                          style: TextStyle(
                              color: darkTextColor,
                              fontWeight: FontWeight.w500,
                              fontSize: font26),
                        ),
                        Text(
                          "Till Today",
                          style: TextStyle(
                              color: darkTextColor,
                              fontWeight: FontWeight.w500,
                              fontSize: fontLarge),
                        ),
                      ],
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }
}

class DashboardViewProfileWidget extends StatelessWidget {
  const DashboardViewProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20, right: 20),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            viewProfileText,
            style: TextStyle(
                color: darkTextColor,
                fontWeight: FontWeight.w500,
                fontSize: font20),
          ),
          ElevatedButton(
              onPressed: () => {},
              child: Text(
                editProfileText,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: fontMedium,
                    color: Colors.white),
              ))
        ],
      ),
    );
  }
}

class LeftProfileWidget extends StatelessWidget {
  const LeftProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/actionbar_icon.png",
          height: 32,
          width: 32,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          "Dr. David Thomson",
          style: TextStyle(
              color: darkTextColor,
              fontSize: fontMedium,
              fontWeight: FontWeight.w600),
        ),
        Text(
          "Dental Surgon",
          style: TextStyle(
              color: darkTextColor,
              fontSize: fontSmall,
              fontWeight: FontWeight.w400),
        ),
        SizedBox(
          width: 15,
        )
      ],
    );
  }
}

class TabViewWithListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      child: DefaultTabController(
        length: 4,
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: backgroundColorDashboard,
              child: TabBar(
                indicator: BoxDecoration(
                    color: white, // Def
                    border: Border.all(
                        color: backgroundColorDashboard,
                        width: 5) // ault tab background color
                    ),
                labelStyle: TextStyle(
                  color: primaryColor,
                  // Change the text color of the selected tab
                  fontWeight: FontWeight.w500,
                  fontSize: fontMedium,
                ),
                unselectedLabelColor: darkTextColor,
                tabs: [
                  Tab(
                    child: Text(
                      "Info",
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Team",
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Patient",
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Price List",
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  InfoTabWidgetList(),
                  TeamTabWidgetList(),
                  TeamTabWidgetList(),
                  TeamTabWidgetList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoTabWidgetList extends StatelessWidget {
  const InfoTabWidgetList({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft, // eight as needed
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "London, United Kingdom",
                          style: TextStyle(
                              fontSize: fontLarge,
                              color: darkTextColor,
                              fontWeight: FontWeight.w500),
                        ),
                        Text("Smiles Dental Care",
                            style: TextStyle(
                                fontSize: fontMedium,
                                color: primaryColor,
                                fontWeight: FontWeight.w500)),
                        Text("Orthodontics Implantologist",
                            style: TextStyle(
                                fontSize: fontMedium,
                                color: darkTextColor,
                                fontWeight: FontWeight.w500)),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              "assets/actionbar_icon.png",
                              height: 30,
                              width: 30,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Image.asset(
                              "assets/actionbar_icon.png",
                              height: 30,
                              width: 30,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Image.asset(
                              "assets/actionbar_icon.png",
                              height: 30,
                              width: 30,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                          ],
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Mon-Sat",
                            style: TextStyle(
                                fontSize: fontLarge,
                                color: darkTextColor,
                                fontWeight: FontWeight.w500)),
                        SizedBox(
                          height: 10,
                        ),
                        Text("11:00-16:00 ",
                            style: TextStyle(
                                fontSize: fontLarge,
                                color: darkTextColor,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("100 For consultation",
                            style: TextStyle(
                                fontSize: fontLarge,
                                color: darkTextColor,
                                fontWeight: FontWeight.w700)),
                        SizedBox(
                          height: 5,
                        ),
                        Text("Flat 5% discount on First time",
                            style: TextStyle(
                                fontSize: fontSmall,
                                color: darkTextColor,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  height: 0.5,
                  color: lightTextColor,
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class TeamTabWidgetList extends StatelessWidget {
  const TeamTabWidgetList({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft, // eight as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
              width: (MediaQuery.of(context).size.width -
                      (MediaQuery.of(context).size.width * 0.15)) /
                  3, // Adjust width as needed
            height: 400,
              child: Container(
                margin: EdgeInsets.only(left: 10),
                padding: EdgeInsets.all(20),
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/login_banner.png",
                      width: 100,
                      height: 100,
                    ),
                    Text(
                      "number of calls received",
                      style: TextStyle(
                          color: darkTextColor,
                          fontWeight: FontWeight.w500,
                          fontSize: fontLarge),
                    ),
                    Text(
                      "2000+",
                      style: TextStyle(
                          color: darkTextColor,
                          fontWeight: FontWeight.w500,
                          fontSize: font26),
                    ),
                    OutlinedButton(
                      onPressed: () => {},
                      child: Text(
                        "Till Today",
                        style: TextStyle(
                            color: darkTextColor,
                            fontWeight: FontWeight.w500,
                            fontSize: fontLarge),
                      ),
                    )
                  ],
                ),
              ));
        },
      ),
    );
  }
}
