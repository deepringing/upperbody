import 'dart:convert';
import 'package:flutter/material.dart';

class chatlistpage extends StatefulWidget {
  const chatlistpage({Key? key}) : super(key: key);

  @override
  State<chatlistpage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<chatlistpage>{
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