import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'config.dart';

class APIService {
  static var client = http.Client();

  static Future otpLogin(String username, password) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json'
    };

    var url = Uri.http(Config.apiURL, Config.loginAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode({
        "username" : username,
        "password" : password
      }),
    );

    Map<String, dynamic> result = jsonDecode(response.body);
    //dynamic result = jsonDecode(response.body);
    return result;
  }

  static Future getEduList() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json'
    };

    var url = Uri.http(Config.apiURL, Config.eduListAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(
          {
            "titleid" : 1,
            "memberid" : 1
          }),
    );

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body.toString());


      //Or put here your next screen using Navigator.push() method
      print('success');
    } else {
      print('error');
    }
    List<dynamic> result = jsonDecode(response.body);
    //dynamic result = jsonDecode(response.body);
    return result;
  }


  static Future getBranch(
      String phoneNumber,
      String activationCode,
      ) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      '_token' : '476225C7-7591-4C92-A990-F32ACFE1AB0F'
    };

    var url = Uri.http(Config.apiURL, Config.getBranchAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(
          {

          }),
    );

//    return loginResponseJson(response.body);
  }
}
