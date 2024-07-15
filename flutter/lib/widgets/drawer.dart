import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerLayout extends StatefulWidget {
  const DrawerLayout({super.key});

  @override
  State<DrawerLayout> createState() => _DrawerLayoutState();
}

class _DrawerLayoutState extends State<DrawerLayout> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),

          
          ListTile(
            title: const Text("Employee"),
            onTap: () {
              Get.toNamed('/employeeTable');
            },
          ),          
          ListTile(
            title: const Text("Department"),
            onTap: () {
              Get.toNamed('/departmentTable');
            },
          ),          
          ListTile(
            title: const Text("Project"),
            onTap: () {
              Get.toNamed('/projectTable');
            },
          ),          
        ],
      ),
    );
  }
}
