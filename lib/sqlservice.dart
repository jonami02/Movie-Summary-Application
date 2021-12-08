import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class SQLService {
  static const UrlDatabase = "192.168.64.2/moviecs202/actions.php";
  static const LOGIN_ACCOUNT = 'LOGIN ACCOUNT';
  static const _ADD_USER = 'ADD_USER';

  //LOGIN user

  static Future<String> loginuser (String email, String userpass) async
  {
      try{
            var map = Map<String, dynamic>();
            map['action'] = 'LOGIN_ACCOUNT';
            map['useremail'] = email;
            map['password'] = userpass;

            final response = await http.post(UrlDatabase, body:map);

            if (200 == response.statusCode)
            {
              //No error
              print(response.body);

            }

            else {
              return "error";
                 }
        }

          catch(e){
            return "error";
          }

  }

  //ADDUSER METHOD

  static Future<String>addnewuser(String email, String username, String password) async 
  {
    try {
        var map = Map<String, dynamic>();
        map['action']= _ADD_USER;
        map['useremail'] = email;
        map['username'] = username;
        map['password'] = password;
        final response = await http.post(UrlDatabase,body:map);
        print('Adding New User : ${response.body}');
        if (200 == response.statusCode)
        { 
            return 'success';
        }
        else{
          return 'error';
        }

    }
    catch (e){
      return 'error';
    }
  }

}