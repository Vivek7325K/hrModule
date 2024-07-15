import 'package:flutter/material.dart';

class DepartmentViewScreen extends StatefulWidget {
  const DepartmentViewScreen({super.key});

  @override
  State<DepartmentViewScreen> createState() => _DepartmentViewScreenState();
}

class _DepartmentViewScreenState extends State<DepartmentViewScreen> {
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