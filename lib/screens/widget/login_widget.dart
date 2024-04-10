import 'dart:collection';

import 'package:dent_o_doctor/response/base_response.dart';
import 'package:dent_o_doctor/utils/appDimentions.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:dent_o_doctor/utils/appColors.dart';
import 'package:dent_o_doctor/utils/Validtion.dart';
import 'package:go_router/go_router.dart';
import '../../retrofit/api_client.dart';
import '../../utils/NetworkConnection.dart';
import '../../utils/appString.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();

}

class _LoginWidgetState extends State<LoginWidget> {

  bool validation = false;
  bool _isChecked = false;
  final _formKey = GlobalKey<FormState>();
  ApiClient mClient = ApiClient(Dio());

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Text(
                Login,
                style: TextStyle(
                    fontSize: font26,
                    fontWeight: FontWeight.w700,
                    color: darkTextColor),
              )),
              SizedBox(
                height: 20,
              ),
              Text(
                Email,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: fontMedium,
                    color: lightTextColor),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (value) {
                  if (!value!.isValidEmail) {
                    return "Invalid Email";
                  }
                  return null;
                },
                decoration: formFieldDecoration(emailHint),
                autovalidateMode: validation
                    ? AutovalidateMode.onUserInteraction
                    : AutovalidateMode.disabled,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: fontMedium,
                    color: darkTextColor),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                Password,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: fontMedium,
                    color: lightTextColor),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 10),
              TextFormField(
                validator: (value) {
                  if (!value!.isValidPassword) {
                    return "Invalid Password";
                  }
                  return null;
                },
                decoration: formFieldDecoration(passwordHint),
                autovalidateMode: validation
                    ? AutovalidateMode.onUserInteraction
                    : AutovalidateMode.disabled,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: fontMedium,
                    color: darkTextColor),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: _isChecked,
                    onChanged: (value) {
                      setState(() {
                        _isChecked = !_isChecked;
                      });
                    },
                  ),
                  Flexible(
                    child: Text.rich(
                      TextSpan(children: [
                        TextSpan(
                            text: ByProceeding,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: fontMedium,
                              color: lightTextColor,
                            )),
                        TextSpan(
                            text: PrivacyPolicy,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: fontMedium,
                              color: darkTextColor,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () {}),
                        TextSpan(
                            text: UserAgreemnet,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: fontMedium,
                              color: lightTextColor,
                            )),
                        TextSpan(
                            text: TermsCondition,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: fontMedium,
                              color: darkTextColor,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () {}),
                      ]),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    ForgotPassword,
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: fontMedium,
                        fontWeight: FontWeight.w500,
                        color: primaryColor),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                      child: SizedBox(
                    height:buttonHeight,
                    child: ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            validation = true;
                          });
                          if (_formKey.currentState!.validate()) {
                            if (await NetworkConnection.checkInternet(context)) {
                              //login api call

                            /*  var email = "sandeep.kiran@global-csg.com";
                              var password = "sandeep";
                              getPostApiCall(email,password);
*/
                              context.go("/Dashboard");

                            }
                          }
                          // _formKey.currentState!.reset();
                        },
                        child: Text(
                          SignIn,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: fontButton,
                              color: white),
                        )),
                  )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                  child: Text.rich(TextSpan(children: [
                TextSpan(
                    text: SignUpText,
                    style: TextStyle(
                        fontSize: fontMedium,
                        fontWeight: FontWeight.w500,
                        color: darkTextColor)),
                TextSpan(
                    text: SignUp,
                    style: TextStyle(
                        fontSize: fontMedium,
                        fontWeight: FontWeight.w500,
                        color: primaryColor,
                        decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        //ontap
                      }),
                TextSpan(
                    text: Here,
                    style: TextStyle(
                        fontSize: fontMedium,
                        fontWeight: FontWeight.w500,
                        color: darkTextColor)),
              ])))
            ],
          ),
        ),
      ),
    );
  }
}

InputDecoration formFieldDecoration(String hint) {
  return InputDecoration(
      hintText: hint,
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      hintStyle: TextStyle(
          color: hintTextColor,
          fontSize: fontMedium,
          fontWeight: FontWeight.w500));
}

Future getPostApiCall(String email, String password ) async{
  final client = ApiClient(Dio(BaseOptions(contentType: "application/json")));
  final response = await client.getLogin(email, password);
  print(response.responseStructure?.userResponse?.email);
  print(response.responseStructure?.message);
  print(response.toJson());
  // final userResponse = LoginResponse.fromJson(response);
}

void getData(String email, String password) async {
  try {

    print("API CALL");

    final dio = Dio();
    final response = await dio.post(BASE_URL+"auth/doctor/login",
      data: {
        'email':email,
        'password': password,
      },
    ).timeout(Duration(seconds: 1));
    print(response.statusCode);
    print(response.data);

  } catch (e) {
    print("error->"+e.toString());
  }
}