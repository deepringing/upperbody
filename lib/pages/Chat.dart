import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upper/pages/DetailPage.dart';

import 'SampleData.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
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
                "안녕하세요. 가나다은님, \n졸업선배님께 조언을 받아보아요.", // 인삿말
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
                SampleData.samples.length.bitLength,
                (index) => InkWell(
                  onTap: () {
                    print(
                        'click -> $index : ${SampleData.samples[index].name}');
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DetailPage(SampleData.samples[index]);
                    }));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Image.asset(SampleData.samples[index].imageAddress,
                                height: 50),
                            const SizedBox(
                              width: 40,
                            ),
                            Text(SampleData.samples[index].name),
                            Text(SampleData.samples[index].schoolName),
                          ],
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
