import 'package:albamate_sample/screen/notice/screenNoticePage.dart';
import 'package:flutter/material.dart';
import 'package:albamate_sample/screen/notice/nav_notice.dart'; //
import 'package:albamate_sample/screen/group_main.dart';



class GroupNav extends StatefulWidget {
  @override
  _GroupNav createState() => _GroupNav();
}

class _GroupNav extends State<GroupNav> {
  int _selectedIndex = 2; // ✅ '홈화면'이 기본으로 보이도록 설정

  // 각 탭에 해당하는 페이지 리스트
  final List<Widget> _pages = [
    Center(child: Text('스케줄 화면', style: TextStyle(fontSize: 24))),
    ScreenNoticePage(), // ✅ '공지사항' 버튼을 누르면 NewDrinkPage가 보이게 설정
    GroupMainPage(), // ✅ 기본 화면
    Center(child: Text('캘린더 화면', style: TextStyle(fontSize: 24))),
    Center(child: Text('마이페이지 화면', style: TextStyle(fontSize: 24))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _pages[_selectedIndex], // ✅ 선택한 페이지 표시
        bottomNavigationBar: BottomNavBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }
}

// ✅ BottomNavigationBar 정의
class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  BottomNavBar({required this.selectedIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xff006FFD),
        unselectedItemColor: Color(0xff71727A),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: TextStyle(fontSize: 10),
        unselectedLabelStyle: TextStyle(fontSize: 10),
        currentIndex: selectedIndex, // ✅ 현재 선택된 인덱스
        onTap: onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.schedule_send, size: 20), label: '스케줄'),
          BottomNavigationBarItem(icon: Icon(Icons.campaign, size: 20), label: '공지사항'),
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 20), label: '홈화면'), // ✅ 기본으로 선택될 버튼
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month, size: 20), label: '캘린더'),
          BottomNavigationBarItem(icon: Icon(Icons.person, size: 20), label: '마이페이지'),
        ],
      ),
    );
  }
}