import 'package:dent_o_doctor/screens/widget/dashboard_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

import '../utils/appColors.dart';
import '../utils/appDimentions.dart';
import '../utils/appString.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        title: Text(
          appName,
          style: TextStyle(
              fontSize: font32,
              fontWeight: FontWeight.w700,
              color: primaryColor),
        ),
        leading: Image.asset(
          "assets/actionbar_icon.png",
          height: 32,
          width: 32,
        ),
        actions: <Widget>[
          Row(
            children: [
              Image.asset(
                "assets/actionbar_icon.png",
                height: 32,
                width: 32,
              ),
              SizedBox(
                width: 5,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                ],
              ),
              SizedBox(
                width: 15,
              )
            ],
          )
        ],
      ),
      body: AdaptiveLayout(
        body: SlotLayout(
          config: {
            Breakpoints.small: SlotLayout.from(
                key: const Key('Body Small'),
                builder: (_) => MainLayout()),
            Breakpoints.mediumAndUp: SlotLayout.from(
                key: const Key('Body Medium'),
                builder: (_) => MainLayout()),
          },
        ),
      ),
    );
  }
}

