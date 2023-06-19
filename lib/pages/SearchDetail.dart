import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:upper/pages/signup/Signup.dart';
import 'package:http/http.dart' as http;

class searchdetailpage extends StatefulWidget {
  const searchdetailpage({Key? key}) : super(key: key);

  @override
  State<searchdetailpage> createState() => _SearchDetailPageState();
}

class _SearchDetailPageState extends State<searchdetailpage> {
  User? iinputData = InputData.inputData;
  bool showContainer = true;
  String name = "";
  int id = 0;
  int length = 0;
  List<Map<String, dynamic>> _backendData = [];

  @override
  void initState() {
    super.initState();
    members();
    getname();
  }

  Future<void> members() async {
    try {
      length = _backendData.length;
      // 백엔드에서 데이터를 가져오는 HTTP 요청을 보냅니다.
      final response = await http
          .get(Uri.parse('http://localhost:3000/group/member?id=7'));

      if (response.statusCode == 200) {
        // HTTP 요청이 성공하면 데이터를 가져옵니다.
        final responseData = jsonDecode(response.body);
        if (responseData is List<dynamic>) {
          setState(() {
            length = _backendData.length;
            _backendData = responseData
                .map((item) => item as Map<String, dynamic>)
                .toList();
          });
          //setState(() {
          //_backendData = responseData.map((item) => item['name'] as String).toList();
          //});
        }
        // 데이터를 처리하는 로직을 추가합니다.
        length = _backendData.length;
        print('백엔드에서 가져온 데이터: $_backendData');
        print(length);
      } else {
        // HTTP 요청이 실패한 경우에 대한 처리를 추가할 수 있습니다.
        print('HTTP 요청 실패: ${response.statusCode}');
      }
    } catch (e) {
      // 예외가 발생한 경우에 대한 처리를 추가할 수 있습니다.
      print('오류 발생: $e');
    }
  }

  Future<void> getname() async {
    await GetStorage.init();
    final GetStorage storage = GetStorage();

    setState(() {
      name = storage.read('name');
      id = storage.read('idnumber');
    });
  }

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
              padding: EdgeInsets.only(top: 67, left: 30),
              child: Text(
                "진주여자중학교 선배님들께\n조언을 받아보아요.", // 인삿말
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal), //TODO : fontWeight normal
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Center(
                child: Column(
                  children: [
                      for (int i = 0; i < length; i++)
                        nameslist(_backendData[i]['nickname']), // 여기서 받은 값이 int형
                  ],
                ),
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

  Padding nameslist(String name) {
    return Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: SizedBox(
          width: 360,
          height: 52,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xffA6A6A6), // 테두리 색상
                width: 1.0, // 테두리 너비
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                '$name',
                style: TextStyle(color: Colors.black, fontSize: 13),
              ),
            ),
          ),
        ));
  }
}
