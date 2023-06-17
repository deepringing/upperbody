import 'dart:convert';
import 'package:flutter/material.dart';
import '../Main.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:http/http.dart' as http;
import 'Signup.dart';

class setCategoryPage extends StatefulWidget {
  const setCategoryPage({Key? key}) : super(key: key);

  @override
  State<setCategoryPage> createState() => _SetCategoryPageState();
}

class _SetCategoryPageState extends State<setCategoryPage> {
  User? inputData = InputData.inputData;
  int length = 0;
  String id = "0";
  bool showContainer = false;
  final TextEditingController categorynameController = TextEditingController();
  String categorytype = "";
  String category = "";
  String categoryname = "";
  String name = "";
  List<Map<String,dynamic>> _backendData = [];

  Future<void> Signup() async {
    String nickname = inputData?.nickname ?? "";
    String password = inputData?.password ?? "";
    String email = inputData?.email ?? "";
    var subid = int.tryParse(id);
    print(subid);
    print(subid.runtimeType);
    print(id.runtimeType);
    // int idnum = int.parse(id);

    var url = Uri.parse('http://localhost:3000/user');
    var body = {
      'nickname' : nickname,
      'email': email,       // 이메일
      'password': password, // 비밀번호
      'groupId' : subid,
    };
    Map<String,String> header = {'Content-Type': 'application/json'};

    try {
      var response = await http.post(url, body: jsonEncode(body), headers: header); // POST 요청 보내기
      print(nickname);
      print(email);
      print(password);
      print(id);

      if (response.statusCode == 200) {
        // 회원가입 성공
        print('회원가입이 성공적으로 완료되었습니다.');
        // 추가적인 동작 수행 가능
      } else {
        // 회원가입 실패
        print('회원가입 성공임. 상태 코드: ${response.statusCode}');
        print('응답 본문: ${response.body}');
        // 실패 이유에 따라 처리
      }

    } catch(e) {
      // 예외 처리
      print('회원가입 도중 오류가 발생하였습니다: $e');
      // 오류 처리 로직 추가
    }
  }

  Future<void> search(String categoryname) async {
    try {
      // 백엔드에서 데이터를 가져오는 HTTP 요청을 보냅니다.
      final response = await http.get(Uri.parse('http://localhost:3000/group?q=%$categoryname'));

      if (response.statusCode == 200) {
        showContainer = true;
        length = _backendData.length;
        // HTTP 요청이 성공하면 데이터를 가져옵니다.
        final responseData = jsonDecode(response.body);
        if (responseData is List<dynamic>) {
          setState(() {
            _backendData = responseData.map((item) => item as Map<String, dynamic>).toList();
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

  Future<void> addcategoryname(String name) async {
    var url = Uri.parse('http://localhost:3000/group');
    var body = {
      'name' : name,
      'domain': 'string',
      'type': categorytype,
    };
    Map<String,String> header = {'Content-Type': 'application/json'};

    try {
      var response = await http.post(url, body: jsonEncode(body), headers: header);

      if (response.statusCode == 200) {
        print("생성 성공");
      }
      else {
        print('생성 실패 : ${response.statusCode}');
        print('응답 본문: ${response.body}');
      }
    }catch(e) {
      print('생성 실패 : $e');
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
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 45.0),
                  child: Text(
                    '원하는 분야를 선택 후 \n아래 확인 버튼을 눌러주세요',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(left: 20, top: 25.0, bottom: 12.0),
                  child: Text(
                    '선택',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: Align(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 93,
                                height: 26,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                        width: 0.5, color: Colors.black),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      categorytype = "MIDDLE_SCHOOL";
                                      category = "중학교";
                                    });
                                  },
                                  child: Text(
                                    '중학교',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 37.0),
                                child: SizedBox(
                                  width: 93,
                                  height: 26,
                                  child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      side: BorderSide(
                                          width: 0.5, color: Colors.black),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        categorytype = "HIGH_SCHOOL";
                                        category = "고등학교";
                                      });
                                    },
                                    child: Text(
                                      '고등학교',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 37.0),
                                child: SizedBox(
                                  width: 93,
                                  height: 26,
                                  child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      side: BorderSide(
                                          width: 0.5, color: Colors.black),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        categorytype = "UNIVERSITY";
                                        category = "대학교";
                                      });
                                    },
                                    child: Text(
                                      '대학교',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25, top: 20),
                        child: SizedBox(
                          width: 93,
                          height: 26,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(width: 0.5, color: Colors.black),
                            ),
                            onPressed: () {
                              setState(() {
                                categorytype = "COMPANY";
                                category = "회사";
                              });
                            },
                            child: Text(
                              '회사',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 37, top: 20),
                        child: SizedBox(
                          width: 93,
                          height: 26,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(width: 0.5, color: Colors.black),
                            ),
                            onPressed: () {
                              setState(() {
                                category = "해외취업";
                                categorytype = "OVERSEAS_EMPLOYMENT";
                              });
                            },
                            child: Text(
                              '해외취업',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 37, top: 20),
                        child: SizedBox(
                          width: 93,
                          height: 26,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(width: 0.5, color: Colors.black),
                            ),
                            onPressed: () {
                              setState(() {
                                categorytype = "ETC";
                                category = "";
                              });
                            },
                            child: Text(
                              '기타',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 37.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 360,
                      child: Column(
                        children: [
                          TextField(
                            controller: categorynameController,
                            decoration: InputDecoration(
                              contentPadding:
                              EdgeInsets.symmetric(horizontal: 12.0),
                              hintText: '$category 이름을 입력해주세요',
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff6A6A6A), width: 0.7),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff6A6A6A), width: 0.7),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                              filled: true,
                              fillColor: Colors.white,
                              suffixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      addcategoryname(categorynameController.text);
                                      // 플러스 아이콘을 눌렀을 때 수행할 동작을 추가합니다.
                                    },
                                    child: Icon(
                                      Icons.add, color: Color(0xff9F9F9F),),
                                  ),
                                  SizedBox(width: 8.0),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        // 플러스 아이콘을 눌렀을 때 수행할 동작을 추가합니다.
                                        search(categorynameController.text);
                                      },
                                      child: Icon(Icons.search,
                                          color: Color(0xff9F9F9F)),
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
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                children: [
                  if(showContainer)
                    for(int i=0; i<length; i++)
                      nameslist(_backendData[i]['name'], _backendData[i]['id']), // 여기서 받은 값이 int형
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 54.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Signup();
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

  Padding nameslist(name, String idnumber) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: TextButton(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all<TextStyle>(
              TextStyle(color: Colors.black,
          ),),
        ),
        onPressed: () {
          print(idnumber);
          setState(() {
            id = idnumber;
          });
        },
        child: Text('$name'), // 학교 이름 출력하깅!! 진주
      ),
    );
  }
}