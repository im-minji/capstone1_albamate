import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart'; // ✅ 날짜 형식 초기화 패키지 추가
import 'package:albamate_sample/screen/group_BottomNavigationBar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // ✅ Flutter 엔진 초기화
  await initializeDateFormatting('ko_KR', null); // ✅ 한국어 날짜 포맷 초기화
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GroupNav(),
    );
  }
}

class GroupMainPage extends StatefulWidget {
  @override
  _GroupMainPage createState() => _GroupMainPage();
}

class _GroupMainPage extends State<GroupMainPage> {
  String formattedDate = DateFormat('yyyy년 MM월 dd일 EEEE', 'ko_KR').format(DateTime(2025, 3, 24));
  List<String> tasks = [];
  TextEditingController taskController = TextEditingController();
  @override
  void initState() {
    super.initState();
    formattedDate = DateFormat('yyyy년 MM월 dd일 EEEE', 'ko_KR').format(DateTime.now());
  }


  void addTask() {
    if (taskController.text.isNotEmpty) {
      setState(() {
        tasks.add(taskController.text);
        taskController.clear();
      });
    }
  }

  void removeTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('그룹페이지', style: TextStyle(fontSize: 16)),
        centerTitle: true,
        actions: [IconButton(icon: Icon(Icons.close), onPressed: () => Navigator.pop(context))],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              formattedDate,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text("오늘 근무자", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Column(
              children: List.generate(3, (index) => EmployeeCard()),
            ),
            SizedBox(height: 24),
            Text("오늘 할 일", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: taskController,
                    decoration: InputDecoration(
                      hintText: "할 일을 입력하세요",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: addTask,
                  child: Text("추가"),
                )
              ],
            ),
            SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(tasks[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => removeTask(index),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EmployeeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text("000 직원"),
        subtitle: Text("8:00 ~ 15:00"),
        trailing: Icon(Icons.phone),
      ),
    );
  }
}

