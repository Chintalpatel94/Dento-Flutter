import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class NetworkConnection {

  NetworkConnection(BuildContext context) {
    checkInternet(context);
  }

  static Future<bool> checkInternet(BuildContext context) async {
    final conResult = await Connectivity().checkConnectivity();

    if (conResult == ConnectivityResult.none) {
      //not connected
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Internet connection not available")));

      return false;
    } else {
      //connected

      /*final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }*/

      return true;
    }
  }
}
