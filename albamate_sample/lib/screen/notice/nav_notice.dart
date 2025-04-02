import 'package:albamate_sample/screen/notice/screenNewPage.dart';
import 'package:albamate_sample/screen/notice/screenNoticePage.dart';
import 'package:flutter/material.dart';
import 'package:albamate_sample/screen/group_main.dart'; //
import 'package:albamate_sample/screen/notice/createNoticePage.dart';
import 'package:albamate_sample/screen/notice/createSubPage.dart';
import 'package:albamate_sample/screen/notice/screenSubPage.dart';

class NoticePageNav extends StatefulWidget {
  @override
  _NoticePageNav createState() => _NoticePageNav();
}

class _NoticePageNav extends State<NoticePageNav> {
  int _selectedIndex = 0; // 기본 선택된 버튼

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (index == 0) { // "안내사항" 버튼 클릭 시
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ScreenNoticePage()),
        );
      }

      if (index == 1) { // "대타 구하기" 버튼 클릭 시
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ScreenSubPage()),
        );
      }

      if (index == 2) { // "대타 구하기" 버튼 클릭 시
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ScreenNewPage()),
        );
      }
    });
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56), // 상단 바 높이 56
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 1, // 그림자 효과
          title: Text(
            '공지사항',
            style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          centerTitle: true, // 타이틀 중앙 정렬
        ),
      ),

      body: Column(
        children: [
          // 두 번째 네비게이션 바
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                width: 343,
                height: 39,
                decoration: BoxDecoration(
                  color: Color(0xffF8F9FE),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 첫 번째 버튼
                    GestureDetector(
                      onTap: () => _onItemTapped(0),
                      child: Container(
                        width: 110,
                        height: 31,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            "안내사항",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 12,
                              fontWeight: _selectedIndex == 0 ? FontWeight.bold : FontWeight.normal,
                              color: _selectedIndex == 0 ? Color(0xff1F2024) : Color(0xff71727A),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10), // 버튼 사이 간격
                    // 두 번째 버튼
                    GestureDetector(
                      onTap: () => _onItemTapped(1),
                      child: Container(
                        width: 100,
                        height: 31,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            '대타 구하기',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: _selectedIndex == 1 ? FontWeight.bold : FontWeight.normal,
                              color: _selectedIndex == 1 ? Color(0xff1F2024) : Color(0xff71727A),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10), // 버튼 사이 간격
                    // 세 번째 버튼
                    GestureDetector(
                      onTap: () => _onItemTapped(2),
                      child: Container(
                        width: 100,
                        height: 31,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            '신메뉴 공지',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: _selectedIndex == 2 ? FontWeight.bold : FontWeight.normal,
                              color: _selectedIndex == 2 ? Color(0xff1F2024) : Color(0xff71727A),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // 본문 내용 추가


        ],
      ),
    );
  }
}
