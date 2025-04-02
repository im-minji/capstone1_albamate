import 'package:flutter/material.dart';
import 'package:albamate_sample/screen/notice/nav_notice.dart'; // NoticePage import
import 'package:intl/intl.dart'; // 날짜 포맷을 위한 패키지


class CreateSubPage extends StatefulWidget {
  @override
  _CreateSubPage createState() => _CreateSubPage();
}

class _CreateSubPage extends State<CreateSubPage> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('yyyy/MM/dd').format(DateTime.now()); //현재날짜

    return Scaffold(
      appBar: AppBar(
        title: Text('공지사항', style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: "Inter",
            color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 제목 입력
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: "제목을 입력하시오",
                hintStyle: TextStyle(
                  color:  Colors.grey,
                ),
                border: InputBorder.none,
              ),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              formattedDate, // 날짜 표시
              style: TextStyle(color: Colors.grey),
            ),
            Divider(thickness: 1),
            SizedBox(height: 8),

            // 내용 입력
            Expanded(
              child: TextField(
                controller: _contentController,
                decoration: InputDecoration(
                  hintText: "내용을 입력하시오",
                  border: InputBorder.none,
                ),
                maxLines: null,
                expands: true,
              ),
            ),
            // BottomNavigationBar 아래에 표시될 NoticePage
            IndexedStack(
              index: _selectedIndex,
              children: [
                // 첫 번째 화면(메모 작성 페이지)
                Container(),
                // 두 번째 화면(공지사항 페이지)

              ],
            ),
          ],
        ),
      ),
      // 네비게이션 바 추가
      bottomNavigationBar: Container(
        height: 88,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.delete, size: 20,),
              label: "삭제하기",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.upload, size: 20,),
              label: "등록하기",
            ),

          ],
          currentIndex: _selectedIndex,
          selectedLabelStyle: TextStyle(fontSize: 10),
          unselectedLabelStyle: TextStyle(fontSize: 10),
          selectedItemColor: Colors.grey,
          unselectedItemColor: Colors.grey,

        ),
      ),
    );
  }
}
