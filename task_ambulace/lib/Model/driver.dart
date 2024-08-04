// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';

class Driver extends ChangeNotifier {
  List _userslist = <Map<String, dynamic>>[
    {"email": "ahmed@gmail.com", "password": "1234"}
  ];

  List get getuserslist => _userslist;
  List _pendinglist = <Map<String, dynamic>>[
    {
      "fullname": "Mukarram mahmoud",
      "email": "Ahmed",
      "password": "121",
      "cnic": 123456,
      "numberphone": "77799999",
      "address": "Yemen",
      "districts": "Aden",
      "imgCNIC":
          '/data/user/0/com.example.ambulance/cache/148de8f5-cf20-4987-8d0f-3db0e7c0fbfd/Screenshot_2024-06-29-17-29-45-971_com.whatsapp.jpg',
      "type": "fire",
      "quantity": "Major",
      "datetime": "1-2-2024"
    },
    {
      "fullname": "Ahmed ali",
      "email": "ahmed@gmail.com",
      "password": "1234",
      "cnic": 123456,
      "numberphone": "77799999",
      "address": "Yemen",
      "districts": "Aden",
      "imgCNIC":
          '/data/user/0/com.example.ambulance/cache/2b39a179-b3cc-4ca1-80ad-ec9dc5b69269/2024_06_19_00_12_39_9106.jpg',
      "type": "fire",
      "quantity": "Major",
      "datetime": "1-2-2024"
    },
  ];
  List _completedlist = <Map<String, dynamic>>[
    {
      "fullname": "Ahmed ali",
      "email": "ahmed@gmail.com",
      "password": "121",
      "cnic": 123456,
      "numberphone": "777589435",
      "address": "Yemen",
      "districts": "Aden",
      "imgCNIC":
          '/data/user/0/com.example.ambulance/cache/2b39a179-b3cc-4ca1-80ad-ec9dc5b69269/2024_06_19_00_12_39_9106.jpg',
      "type": "fire",
      "quantity": "Major",
      "datetime": "1-2-2024"
    }
  ];
  List _canceledlist = [
    {
      "fullname": "Ahmed ali",
      "email": "ahmed@gmail.com",
      "password": "121",
      "cnic": 123456,
      "numberphone": "7799999",
      "address": "Yemen",
      "districts": "Aden",
      "imgCNIC":
          '/data/user/0/com.example.ambulance/cache/2b39a179-b3cc-4ca1-80ad-ec9dc5b69269/2024_06_19_00_12_39_9106.jpg',
      "type": "fire",
      "quantity": "Major",
      "datetime": "1-2-2024"
    }
  ];
  
  List get getpedinglist => _pendinglist;
  List get getcompletedlist => _completedlist;
  List get getcanceledlist => _canceledlist;
  set setpedinglist(List value) {
    _pendinglist = value;
  }

  set setcanceledlist(List value) {
    _canceledlist = value;
  }
}
