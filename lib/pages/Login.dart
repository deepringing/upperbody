import 'package:flutter/material.dart';
import 'Main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'upper_singup',
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xffFFFFFF),
        appBar: buildAppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(30.0),
              child: Text(
                "입력한 정보가 맞다면\n아래 확인 버튼을 눌러주세요.",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
            ),
            buildTextFeild("이메일"),
            buildTextFeild("닉네임"),
            buildTextFeild("비밀번호"),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 50),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context, MaterialPageRoute(builder: (_) => MainPage()));
                },
                // ignore: sort_child_properties_last
                child: const Text(
                  "로그인",
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xffFFFFFFF),
                    fontWeight: FontWeight.w300,
                  ),
                ),
                style: TextButton.styleFrom(
                  elevation: 0,
                  backgroundColor: const Color(0xff7591F7),
                  minimumSize: const Size(double.infinity, 52),
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 1.0, color: Color(0xffD6A7D7)),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column buildTextFeild(String s) {
    return Column(children: [
      Row(children: [
        Container(
          margin: const EdgeInsets.fromLTRB(30, 20, 30, 5),
          child: Text(
            s,
            style: const TextStyle(
                fontSize: 15,
                color: Color(0xff757575),
                fontWeight: FontWeight.w300),
          ),
        ),
      ]),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          SizedBox(
            width: 335,
            height: 50,
            child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffFFFFFF),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Color(0xff6A6A6A), width: 0.7),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Color(0xff6A6A6A), width: 0.7),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                )),
          ),
        ],
      ),
    ]);
  }

  AppBar buildAppBar() {
    return AppBar(
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
    );
  }
}