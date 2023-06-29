import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import './Login_Page.dart';
import './UserPage.dart';
import 'package:http/http.dart' as http;
import 'package:projekpam/utils/global.colors.dart';
import 'package:projekpam/widget/text.form.global.dart';
// import 'package:projekpam/widget/button.global.dart';
import 'package:projekpam/Services/auth_service.dart';
import 'package:projekpam/Services/globals.dart';
import 'dart:convert';
import '../RoundedButton.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String _email = '';
  String _password = '';
  String _name = '';

  createAccountPressed() async {
    bool emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(_email);
    if (emailValid) {
      http.Response response =
      await AuthServices.register(_name, _email, _password);
      Map responseMap = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const UserPage(),
          ),
        );
      } else {
        errorSnackBar(context, responseMap.values.first[0]);
      }
    } else {
      errorSnackBar(context, 'email not valid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.blue,
      //   centerTitle: true,
      //   elevation: 0,
      //   title: const Text(
      //     'Registration',
      //     style: TextStyle(
      //       fontSize: 20,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      // ),
      body: ListView( // Wrap the Column with ListView
        padding: const EdgeInsets.symmetric(horizontal: 40),
        children: [
          const SizedBox(
            height: 10,
          ),
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
            height: 40,
          ),
          TextField(
            decoration: const InputDecoration(
              hintText: 'Name',
            ),
            onChanged: (value) {
              _name = value;
            },
          ),
          const SizedBox(
            height: 30,
          ),
          TextField(
            decoration: const InputDecoration(
              hintText: 'Email',
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
              hintText: 'Password',
            ),
            onChanged: (value) {
              _password = value;
            },
          ),
          const SizedBox(
            height: 40,
          ),
          RoundedButton(
            btnText: 'Create Account',
            onBtnPressed: () => createAccountPressed(),
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            'Sudah punya akun??',textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const Login_Page(),
                ),
              );
            },
            child: Text(
              'Login Sekarang',textAlign: TextAlign.center,
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
