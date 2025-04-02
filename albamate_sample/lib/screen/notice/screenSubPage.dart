import 'package:albamate_sample/screen/group_BottomNavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:albamate_sample/screen/notice/nav_notice.dart';
import 'package:albamate_sample/screen/notice/createSubPage.dart';


class ScreenSubPage extends StatefulWidget {
  @override
  _ScreenSubPage createState() => _ScreenSubPage();
}

class _ScreenSubPage extends State<ScreenSubPage> {
  void _navigateToCreatePage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateSubPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: NoticePageNav()),
          // NoticePageNav 추가
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _navigateToCreatePage,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 32.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Create',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),

    );
  }
}
