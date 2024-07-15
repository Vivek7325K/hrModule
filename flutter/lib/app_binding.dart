
import 'package:get/get.dart';
import 'controllers/auth_controller.dart';

import 'controllers/employeeController.dart';import 'controllers/departmentController.dart';import 'controllers/projectController.dart';
class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthenticationController(), permanent: true);

    Get.put(EmployeeController(), permanent: true);    Get.put(DepartmentController(), permanent: true);    Get.put(ProjectController(), permanent: true);  }
}