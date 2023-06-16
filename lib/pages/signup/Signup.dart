import 'package:flutter/material.dart';
import 'package:upper/pages/signup/setcategory.dart';
import '../Main.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class InputData {
  static User? inputData;
}

class _SignupPageState extends State<SignupPage> {
  InputData inputData = InputData();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nicknameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController checkpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String nickname = nicknameController.text;
    String password = passwordController.text;
    String email = emailController.text;

    User user = User(email : email, nickname: nickname, password: password);
    InputData.inputData = user;

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
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(top: 45.0),
                    child : Text(
                        '입력한 정보가 맞다면 \n확인 버튼을 눌러주세요',
                      style: TextStyle(fontSize:20, fontWeight: FontWeight.bold),
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0, bottom: 12.0),
                  child: Text(
                    '이메일',
                    style: TextStyle(fontSize: 16),
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
                Padding(
                  padding: const EdgeInsets.only(top: 25.0, bottom: 12.0),
                  child: Text(
                    '닉네임',
                    style: TextStyle(fontSize: 16),
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
                          controller: nicknameController,
                          decoration: InputDecoration(
                            hintText: '닉네임을 입력해주세요.',
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
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0, top: 21),
                  child: Text(
                    '비밀번호',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: 360,
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            contentPadding:
                            EdgeInsets.symmetric(horizontal: 12.0),
                            hintText: '비밀번호를 입력해주세요.',
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
                          controller: passwordController,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0, top: 21),
                  child: Text(
                    '비밀번호 확인',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: 360,
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            contentPadding:
                            EdgeInsets.symmetric(horizontal: 12.0),
                            hintText: '비밀번호를 다시 입력해주세요.',
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
                          controller: checkpasswordController,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 54.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          nickname;
                          email;
                          password;
                        });
                        print(email);
                        print(nickname);
                        print(password);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => setCategoryPage()),
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
          ],
        ),
      ),
    );
  }
}

class User {
  final String email;
  final String nickname;
  final String password;

  User({required this.email, required this.nickname, required this.password});
}