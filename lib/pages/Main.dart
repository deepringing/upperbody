import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xffFFFFFF),
        appBar: buildAppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top:67, left:30),
              child: Text(
                  "안녕하세요. 가나다은님, \n졸업선배님께 조언을 받아보아요.", // 인삿말
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), //TODO : fontWeight bold
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:35, left: 30),
              child: Text(
                  "진주여자중학교",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold), //TODO : fontWeight bold
              ),
            ),
            Center(
                child: Column( // 재학중인 학교 선배 리스트
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top:19.0),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 0, // 그림자 퍼지는 정도
                                  blurRadius: 10, // 그림자의 흐림 정도
                                  offset: Offset(0, 0),
                                ),
                              ],
                              color: Colors.white,
                            ),
                            height: 61,
                            width: 350,
                          ),
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(''),
                          )
                        ],
                      ),

                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:24.0),
                      child: Container(
                        height: 61,
                        width: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0,                      // 그림자 퍼지는 정도
                              blurRadius: 10,                        // 그림자의 흐림 정도
                              offset: Offset(0, 0),
                            ),
                          ],
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:24.0),
                      child: Container(
                        height: 61,
                        width: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0,                      // 그림자 퍼지는 정도
                              blurRadius: 10,                        // 그림자의 흐림 정도
                              offset: Offset(0, 0),
                            ),
                          ],
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:25, left: 30),
              child: Text(
                "좋아요 한 선배님",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold), //TODO : fontWeight bold
              ),
            ),
            Center(
              child: Column( // 재학중인 학교 선배 리스트
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top:19.0),
                    child: Container(
                      height: 61,
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0,                      // 그림자 퍼지는 정도
                            blurRadius: 10,                        // 그림자의 흐림 정도
                            offset: Offset(0, 0),
                          ),
                        ],
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:24.0),
                    child: Container(
                      height: 61,
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0,                      // 그림자 퍼지는 정도
                            blurRadius: 10,                        // 그림자의 흐림 정도
                            offset: Offset(0, 0),
                          ),
                        ],
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:24.0),
                    child: Container(
                      height: 61,
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0,                      // 그림자 퍼지는 정도
                            blurRadius: 10,                        // 그림자의 흐림 정도
                            offset: Offset(0, 0),
                          ),
                        ],
                        color: Colors.white,
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
