import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upper/pages/SampleData.dart';

class DetailPage extends StatefulWidget {
  const DetailPage(this.sampleData, {Key? key}) : super(key: key);

  final SampleData sampleData;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                Image.asset('assets/images/profile1.png'),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "${widget.sampleData.name} 선배님",
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text("${widget.sampleData.schoolName} 재학중"),
                const SizedBox(
                  height: 20,
                ),
                Text("해윙~~ 진주여중 다 내 밑으로 집합~!"),
                const SizedBox(
                  height: 15,
                ),
                buildButton(),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                      "후기를 남겨보아요!",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                buildColumn(),
                buildCenter(context),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 0,
                        primary: const Color(0xff7591F7)),
                    onPressed: () {},
                    child: const Text("채팅하기"),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Column buildColumn() {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 40,
            ),
            const Text("만족해요"),
            const SizedBox(
              width: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              width: 230,
              height: 8,
              child: const ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: LinearProgressIndicator(
                  value: 0.7,
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xff7591F7)),
                  backgroundColor: Color(0xffF5F5F5),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            const SizedBox(
              width: 40,
            ),
            const Text("불편해요"),
            const SizedBox(
              width: 30,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              width: 230,
              height: 8,
              child: const ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: LinearProgressIndicator(
                  value: 0.7,
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xff7591F7)),
                  backgroundColor: Color(0xffF5F5F5),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Row buildButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 150,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 0,
                primary: const Color(0xff7591F7)),
            onPressed: () {},
            child: const Text("채팅하기"),
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        SizedBox(
          width: 150,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 0,
                primary: const Color(0xffF5F5F5)),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/choa.png',
                ),
                const Text(
                  "384",
                  style: TextStyle(color: Color(0xff7591F7)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
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
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 15, left: 15, top: 10, bottom: 10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                      SampleData.samples[index].imageAddress,
                                      height: 25),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    SampleData.samples[index].name,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "입학전형도 상세하게 알려주시고 말투도 둥글고 친절하셨어요!",
                                style: TextStyle(fontSize: 12),
                              )
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
}
