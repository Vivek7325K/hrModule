import 'package:flutter/material.dart';

class EmployeeViewScreen extends StatefulWidget {
  const EmployeeViewScreen({super.key});

  @override
  State<EmployeeViewScreen> createState() => _EmployeeViewScreenState();
}

class _EmployeeViewScreenState extends State<EmployeeViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/background.png'),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(60),
              child: Center(
                child: Text("Hello")
              ),
            ),
          )
        ],
      ),
    );
  }
}