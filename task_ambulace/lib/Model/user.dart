// ignore_for_file: unused_field, prefer_final_fields
import 'dart:io';
import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  late String _email;
  late int _cnic;
  late String _fullname;
  late String _numberphone;
  late String _password;
  late String _address;
  late String _districts;
  late DateTime _dateTime;
  late File _imgCNIC;
  late String _type;
  late String _quantity;
  late bool _isuplod = false;
  late File _imgState;
  List _userslist = [
    {
      "fullname": "Mukarram mahmoud",
      "email": "mukarrammahmoud@gmail.com",
      "password": "111",
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
      "email": "Mukarram",
      "password": "1234",
      "cnic": 123456,
      "numberphone": "777589435",
      "address": "Yemen",
      "districts": "Sanaa",
      "imgCNIC":
          '/data/user/0/com.example.ambulance/cache/2b39a179-b3cc-4ca1-80ad-ec9dc5b69269/2024_06_19_00_12_39_9106.jpg',
      "type": "fire",
      "quantity": "Major",
      "datetime": "1-2-2024"
    },
  ];
  adduser(
      String email,
      int cnic,
      String fullname,
      String numberphone,
      String type,
      String password,
      String quantity,
      String address,
      String districts,
      File imgCNIC,
      File imgstate,
      DateTime datetime) {
    _email = email;
    _cnic = cnic;
    _fullname = fullname;
    _numberphone = numberphone;
    _type = type;
    _password = password;
    _quantity = quantity;
    _address = address;
    _districts = districts;
    _imgCNIC = imgCNIC;
    _imgState = imgstate;
    _dateTime = datetime;
    _userslist.add({email: password});
    _pendinglist.add({
      "email": email,
      "cnic": cnic,
      "fullname": fullname,
      "numberphone": numberphone,
      "type": type,
      "quantity": quantity,
      "address": address,
      "districts": districts,
      "imgCNIC": imgCNIC,
      "imgstate": imgstate,
      "datetime": datetime
    });
  }

  List _pendinglist = [
    {
      "fullname": "Mukarram mahmoud",
      "email": "Mukarram",
      "password": "111",
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
  List _completedlist = [
    {
      "fullname": "Mukarram mahmoud",
      "email": "Mukarram",
      "password": "111",
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
  List _canceledlist = [
    {
      "fullname": "Mukarram mahmoud",
      "email": "Mukarram",
      "password": "111",
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

  List get getpedinglist => _pendinglist;
  List get getcompletedlist => _completedlist;
  List get getcanceledlist => _canceledlist;

  // set setcanceledlist(List value) {
  //   _canceledlist = value;
  // }

  set setisuplod(bool value) {
    _isuplod = value;
  }

  String get getemail => _email;
  int get getcnic => _cnic;
  String get getfullname => _fullname;
  String get getnumberphone => _numberphone;
  String get getpassword => _password;
  String get getaddress => _address;
  String get getdistricts => _districts;
  File get getimgCNIC => _imgCNIC;
  String get gettype => _type;
  String get getquantity => _quantity;
  bool get getisuplod => _isuplod;
  File get getimgState => _imgState;
  List get getuserslist => _userslist;
  DateTime get getdateTime => _dateTime;
}
