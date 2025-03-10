import 'package:flutter/material.dart';

void main() {
  runApp(LibraryApp());
}

class LibraryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LibraryHomeScreen(),
    );
  }
}

class LibraryHomeScreen extends StatefulWidget {
  @override
  _LibraryHomeScreenState createState() => _LibraryHomeScreenState();
}

class _LibraryHomeScreenState extends State<LibraryHomeScreen> {
  final List<String> books = ["Sách 01", "Sách 02"];
  final TextEditingController userController = TextEditingController();
  String employeeName = "Nguyen Van A";

  void changeEmployee() {
    setState(() {
      if (userController.text.isNotEmpty) {
        employeeName = userController.text;
        userController.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hệ thống Quản lý Thư viện"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nhân viên", style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: userController,
                    decoration: InputDecoration(
                      hintText: employeeName,
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(onPressed: changeEmployee, child: Text("Đổi")),
              ],
            ),
            SizedBox(height: 20),
            Text("Danh sách sách", style: TextStyle(fontWeight: FontWeight.bold)),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(color: Colors.grey, blurRadius: 5),
                ],
              ),
              child: Column(
                children: books
                    .map((book) => CheckboxListTile(
                  title: Text(book),
                  value: true,
                  onChanged: (val) {},
                ))
                    .toList(),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Thêm"),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Quản lý"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "DS Sách"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Nhân viên"),
        ],
      ),
    );
  }
}
