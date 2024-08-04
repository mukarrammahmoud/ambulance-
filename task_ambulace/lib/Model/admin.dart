// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';

class Admin extends ChangeNotifier {
  List _userslist = [
    {"email": "admin@gmail.com", "password": "11"}
  ];

  List _newlist = [
    {
      "fullname": "Mukarram mahmoud",
      "email": "admin@gmail.com",
      "password": "11",
      "cnic": 123456,
      "numberphone": "779629928",
      "address": "Yemen",
      "districts": "Sanaa",
      "imgCNIC":
          '/data/user/0/com.example.ambulance/cache/2b39a179-b3cc-4ca1-80ad-ec9dc5b69269/2024_06_19_00_12_39_9106.jpg',
      "type": "fire",
      "quantity": "Major",
      "datetime": "1-2-2024"
    },
    {
      "fullname": "Mukarram mahmoud",
      "email": "admin@gmail.com",
      "password": "11",
      "cnic": 123456,
      "numberphone": "779629928",
      "address": "Yemen",
      "districts": "Sanaa",
      "imgCNIC":
          '/data/user/0/com.example.ambulance/cache/148de8f5-cf20-4987-8d0f-3db0e7c0fbfd/Screenshot_2024-06-29-17-29-45-971_com.whatsapp.jpg',
      "type": "fire",
      "quantity": "Major",
      "datetime": "1-2-2024"
    }
  ];
  List _activelist = [];
  List _blocklist = [];
  List _unblocklist = [];

  set setnewlist(List value) {
    _newlist = value;
  }

  set setblocklist(List value) {
    _blocklist = value;
  }

  set setunblocklist(List value) {
    _unblocklist = value;
  }

  List get getnewlist => _newlist;
  List get getactivelist => _activelist;
  List get getblocklist => _blocklist;
  List get getuserslist => _userslist;
  List get getunblocklist => _unblocklist;
}
