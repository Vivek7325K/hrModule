import 'package:get/get.dart';
import '/screens/splash.dart';
import '/screens/auth/authScreen.dart';
import '/screens/dashboard/basicDashboardScreen.dart';

import '/screens/employee/employeeListScreen.dart';

import '/screens/employee/table/employeeTableScreen.dart';
import '/screens/employee/form/employeeFormScreen.dart';import '/screens/department/departmentListScreen.dart';

import '/screens/department/table/departmentTableScreen.dart';
import '/screens/department/form/departmentFormScreen.dart';import '/screens/project/projectListScreen.dart';

import '/screens/project/table/projectTableScreen.dart';
import '/screens/project/form/projectFormScreen.dart';
AppRoutes() => [
    GetPage(
        name: '/splash',
        page: () => SplashScreen(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
        name: '/auth',
        page: () => AuthScreen(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
        name: '/dashboard',
        page: () => BasicDashboardScreen(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
    ), 
    GetPage(
            name: '/employeeList',
            page: () => EmployeeListScreen(),
            transition: Transition.leftToRightWithFade,
            transitionDuration: const Duration(milliseconds: 500),
        ),
    GetPage(
            name: '/employeeTable',
            page: () => EmployeeTableScreen(),
            transition: Transition.leftToRightWithFade,
            transitionDuration: const Duration(milliseconds: 500),
        ),

    GetPage(
        name: '/employeeForm',
        page: () => EmployeeFormScreen(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
    ),    GetPage(
            name: '/departmentList',
            page: () => DepartmentListScreen(),
            transition: Transition.leftToRightWithFade,
            transitionDuration: const Duration(milliseconds: 500),
        ),
    GetPage(
            name: '/departmentTable',
            page: () => DepartmentTableScreen(),
            transition: Transition.leftToRightWithFade,
            transitionDuration: const Duration(milliseconds: 500),
        ),

    GetPage(
        name: '/departmentForm',
        page: () => DepartmentFormScreen(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
    ),    GetPage(
            name: '/projectList',
            page: () => ProjectListScreen(),
            transition: Transition.leftToRightWithFade,
            transitionDuration: const Duration(milliseconds: 500),
        ),
    GetPage(
            name: '/projectTable',
            page: () => ProjectTableScreen(),
            transition: Transition.leftToRightWithFade,
            transitionDuration: const Duration(milliseconds: 500),
        ),

    GetPage(
        name: '/projectForm',
        page: () => ProjectFormScreen(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
    ),
];