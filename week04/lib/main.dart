import 'package:flutter/material.dart';

void main() {
  runApp(const MyLayoutApp());
}

class MyLayoutApp extends StatelessWidget {
  const MyLayoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Layout Example'),
          backgroundColor: Colors.green,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 100,
                color: Colors.amber,
                child: const Center(child: Text('Container 1')),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(width: 100, height: 100, color: Colors.red),
                  Container(width: 100, height: 100, color: Colors.blue),
                  Container(width: 100, height: 100, color: Colors.green),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Container(
                  color: Colors.grey.shade300,
                  child: const Center(
                    child: Text(
                      'Expanded Container\n(Takes remaining space)',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
