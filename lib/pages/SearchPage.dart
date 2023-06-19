import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class searchpage extends StatefulWidget {
  const searchpage({Key? key}) : super(key: key);

  @override
  State<searchpage> createState() => _SearchPageState();
}

class _SearchPageState extends State<searchpage> {
  final TextEditingController nameController = TextEditingController();
  bool showContainer = false;
  List<Map<String, dynamic>> _backendData = [];
  int length = 0;

  Future<void> searchname(String name) async {
    try {
      // 백엔드에서 데이터를 가져오는 HTTP 요청을 보냅니다.
      final response =
          await http.get(Uri.parse('http://localhost:3000/group?q=%$name'));

      if (response.statusCode == 200) {
        showContainer = true;
        length = _backendData.length;
        // HTTP 요청이 성공하면 데이터를 가져옵니다.
        final responseData = jsonDecode(response.body);
        if (responseData is List<dynamic>) {
          setState(() {
            _backendData = responseData
                .map((item) => item as Map<String, dynamic>)
                .toList();
          });
          //setState(() {
          //_backendData = responseData.map((item) => item['name'] as String).toList();
          //});
        }
        // 데이터를 처리하는 로직을 추가합니다.
        print('백엔드에서 가져온 데이터: $_backendData');
      } else {
        // HTTP 요청이 실패한 경우에 대한 처리를 추가할 수 있습니다.
        print('HTTP 요청 실패: ${response.statusCode}');
      }
    } catch (e) {
      // 예외가 발생한 경우에 대한 처리를 추가할 수 있습니다.
      print('오류 발생: $e');
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
        child: Center(
          child: Column(
            children: [
              search(),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  children: [
                    if (showContainer)
                      for (int i = 0; i < length; i++)
                        nameslist(
                            _backendData[i]['name'], _backendData[i]['id']),
                    // 여기서 받은 값이 int형
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding search() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 360,
              child: Column(
                children: [
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
                      hintText: '궁금한 학교/회사 이름을 입력하세요',
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xffF2F2F2), width: 0.7),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xffF2F2F2), width: 0.7),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      filled: true,
                      fillColor: Color(0xffF2F2F2),
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(width: 8.0),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                // 플러스 아이콘을 눌렀을 때 수행할 동작을 추가합니다.
                                searchname(nameController.text);
                              },
                              child:
                                  Icon(Icons.search, color: Color(0xff9F9F9F)),
                            ),
                          ),
                        ],
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

  Padding nameslist(name, String idnumber) {
    return Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: SizedBox(
            width: 360,
            height: 30,
            child: Container(
              child: Center(
                child: Text(
                  '$name',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
            )));
  }
}
