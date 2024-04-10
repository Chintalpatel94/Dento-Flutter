import 'package:dent_o_doctor/screens/widget/login_widget.dart';
import 'package:dent_o_doctor/utils/appColors.dart';
import 'package:dent_o_doctor/utils/appDimentions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import '../utils/appString.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
      ),
      body: Container(
        color: primaryColor,
        child: AdaptiveLayout(
          body: SlotLayout(
            config: {
              Breakpoints.small: SlotLayout.from(
                  key: const Key('Body Small'),
                  builder: (_) => Expanded(child: LoginWidget())),
              Breakpoints.mediumAndUp: SlotLayout.from(
                  key: const Key('Body Medium'),
                  builder: (_) => Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            flex: 6,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Dentist’s Dashboard",
                                  style: TextStyle(
                                      fontSize: font26,
                                      fontWeight: FontWeight.w700,
                                      color: white),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Flexible(
                                    child:
                                        Image.asset("assets/login_banner.png"))
                              ],
                            ),
                          ),
                          Expanded(flex: 4, child: LoginWidget()),
                        ],
                      )),
            },
          ),
        ),
      ),
    );
  }
}
