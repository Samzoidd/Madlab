import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hello Flutter!", style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text("Click Me"),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter Name",
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Icon(Icons.favorite, color: Colors.red),
                SizedBox(width: 10),
                Text("Like this UI")
              ],
            ),
            SizedBox(height: 20),
            Container(
              color: Colors.blueAccent,
              height: 100,
              width: double.infinity,
              child: Center(
                  child: Text(
                "Container Widget",
                style: TextStyle(color: Colors.white, fontSize: 18),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
