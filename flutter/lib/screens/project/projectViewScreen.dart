import 'package:flutter/material.dart';

class ProjectViewScreen extends StatefulWidget {
  const ProjectViewScreen({super.key});

  @override
  State<ProjectViewScreen> createState() => _ProjectViewScreenState();
}

class _ProjectViewScreenState extends State<ProjectViewScreen> {
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