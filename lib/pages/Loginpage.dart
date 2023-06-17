import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String token = "";

  Future<void> Login(email, password) async {
    var url = Uri.parse('http://localhost:3000/auth');
    var body = {
      'email': email,       // 이메일
      'password': password, // 비밀번호
    };
    Map<String,String> header = {'Content-Type': 'application/json'};

    try {
      var response = await http.post(url, body: jsonEncode(body), headers: header);

      if (response.statusCode == 200) {
        // 회원가입 성공
        print('로그인이 성공적으로 완료되었습니다.');
        // 추가적인 동작 수행 가능
      } else {
        // 회원가입 실패
        print('로그인 성공 BUT ${response.statusCode}');
        print('응답 본문: ${response.body}');
        token = response.body;
        // 실패 이유에 따라 처리
      }

    }catch(e) {

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 15,
              ),
              SizedBox(
                width: 50,
                child: Image.asset(
                  'assets/images/logo/logo.png',
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
              children: [
                logintext(),
                email(),
                password(),
                button(),
              ],
            ),
        ),
    );
  }

  Padding logintext() {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child : Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '로그인을 하기 위해 \n닉네임과 비밀번호를 입력해주세요.',
                style: TextStyle(fontSize:20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding email() {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child : Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:30.0, left:30, bottom: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '이메일',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: 360,
                  height: 48,
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: '이메일을 입력해주세요.',
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Color(0xff6A6A6A), width: 0.7),
                          borderRadius: BorderRadius.all(Radius.circular(10.0))),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Color(0xff6A6A6A), width: 0.7),
                          borderRadius: BorderRadius.all(Radius.circular(10.0))),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding password() {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:30.0, left: 30, bottom: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '비밀번호',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: 360,
                  height: 48,
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: '비밀번호를 입력해주세요.',
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Color(0xff6A6A6A), width: 0.7),
                          borderRadius: BorderRadius.all(
                              Radius.circular(10.0))),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Color(0xff6A6A6A), width: 0.7),
                          borderRadius: BorderRadius.all(
                              Radius.circular(10.0))),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding button() {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child : Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 54.0),
              child: ElevatedButton(
                onPressed: () {
                  Login(emailController.text, passwordController.text);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MainPage()),
                  );
                },
                child: Text(
                  "확인",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  onSurface: Color(0xff98C26C),
                  backgroundColor: Color(0xff7591F7),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0)),
                  minimumSize: Size(360, 48),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
