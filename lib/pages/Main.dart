import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upper/pages/Chat.dart';
import 'package:upper/pages/DetailPage.dart';
import 'package:http/http.dart' as http;
import 'ProfilePage.dart';
import 'SampleData.dart';
import 'SearchPage.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Map<String, dynamic>> _backendData = [];
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    myMainPage(),
    ChatPage(),
    searchpage(),
    profilepage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        // 선택된 아이템 색상 설정
        selectedItemColor: Color(0xff7591F7),
        // 선택되지 않은 아이템 색상 설정
        unselectedItemColor: Color(0xff929292),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: '채팅',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '검색',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_outlined),
            label: '마이페이지',
          ),
        ],
      ),
    );
  }
}

class myMainPage extends StatelessWidget {
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
            const Padding(
              padding: EdgeInsets.only(top: 60, left: 30),
              child: Text(
                "안녕하세요. 박다은님, \n졸업선배님께 조언을 받아보아요.", // 인삿말
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal), //TODO : fontWeight normal
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 35, left: 30),
              child: Text(
                "진주여자중학교",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal), //TODO : fontWeight normal
              ),
            ),
            buildCenter(context),
            const Padding(
              padding: EdgeInsets.only(top: 25, left: 25),
              child: Text(
                "좋아요 한 선배님",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal), //TODO : fontWeight normal
              ),
            ),
            buildCenter(context),
          ],
        ),
      ),
    );
  }

  Center buildCenter(BuildContext context) {
    return Center(
      child: Column(
        // 재학중인 학교 선배 리스트
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 19.0),
            child: ListView(
              shrinkWrap: true,
              children: List.generate(
                SampleData.samples.length,
                (index) => InkWell(
                  onTap: () {
                    print('click -> $index : ');
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DetailPage(SampleData.samples[index]);
                    }));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Image.asset(
                                  SampleData.samples[index].imageAddress,
                                  height: 50),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(SampleData.samples[index].name),
                              const SizedBox(
                                width: 100,
                              ),
                              Container(
                                width: 115,
                                height: 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xff7591F7),
                                ),
                                child: Center(
                                  child: Text(
                                    "${SampleData.samples[index].schoolName} 재학 중",
                                    style: const TextStyle(
                                        fontSize: 10, color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
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
