import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const String URL = 'https://elephant-api.herokuapp.com/elephants';

class ChatMessageData {
  Future<String> getData() async {
    http.Response response = await http.get(URL);
    if (response.statusCode == 200) {
      String data = response.body;
      return data;
    } else {
      print(response.statusCode);
    }
  }
}
