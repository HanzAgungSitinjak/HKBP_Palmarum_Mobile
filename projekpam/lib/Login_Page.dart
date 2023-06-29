import 'package:flutter/material.dart';
import 'package:projekpam/utils/global.colors.dart';
import 'package:projekpam/widget/text.form.global.dart';
import 'package:projekpam/widget/button.global.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import './RegisterPage.dart';
import './UserPage.dart';
import 'package:projekpam/Services/auth_service.dart';
import 'package:projekpam/Services/globals.dart';
import 'dart:convert';
import '../RoundedButton.dart';

class Login_Page extends StatefulWidget {
  const Login_Page({Key? key}) : super(key: key);

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  String _email = '';
  String _password = '';

  loginPressed() async {
    if (_email.isNotEmpty && _password.isNotEmpty) {
      http.Response response = await AuthServices.login(_email, _password);
      Map responseMap = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const UserPage(),
          ),
        );
      } else {
        errorSnackBar(context, responseMap.values.first);
      }
    } else {
      errorSnackBar(context, 'enter all required fields');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView( // Wrap the Column with ListView
        padding: const EdgeInsets.symmetric(horizontal: 30),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Image.asset(
              'assets/images/logo.png',
              width: 300,
              height: 180,
            ),
          ),
          Text(
            'HKBP Palmarum',textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: GlobalColors.mainColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            decoration: const InputDecoration(
              hintText: 'Enter your email',
              // width: 200
            ),
            onChanged: (value) {
              _email = value;
            },
          ),
          const SizedBox(
            height: 30,
          ),
          TextField(
            obscureText: true,
            decoration: const InputDecoration(
              hintText: 'Enter your password',
            ),
            onChanged: (value) {
              _password = value;
            },
          ),
          const SizedBox(
            height: 60,
          ),
          RoundedButton(
            btnText: 'LOG IN',
            onBtnPressed: () => loginPressed(),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Belum punya akun??',textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const RegisterPage(),
                ),
              );
            },
            child: Text(
              'Buat akun',textAlign: TextAlign.center,
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: GlobalColors.mainColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
