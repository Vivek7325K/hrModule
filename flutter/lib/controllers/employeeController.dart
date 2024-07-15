import 'package:get/get.dart';
import '../models/autocomplete_model.dart';

import '../models/employeeModel.dart';
import '../services/employeeService.dart';

class EmployeeController extends GetxController {

  Future<EmployeeListModel> fetchList({
    required int limit,
    required int offset,
    String? orderBy,
  }) async {
    
    EmployeeService service = EmployeeService();
    EmployeeListModel listModel = await service.list(limit:limit,offset:offset, orderBy:orderBy);
    
    return listModel;
  }

  Future<EmployeeModel> fetchById({
    required String id
  }) async {
   EmployeeService service = EmployeeService();
    EmployeeModel model = await service.find(id:id);
    return model;
  }

  Future<EmployeeModel> create(Map<String,dynamic> model) async {
    EmployeeService service = EmployeeService();
    EmployeeModel savedModel = await service.create(model);
    return savedModel;
  }

  Future<EmployeeModel> updateData(String id, Map<String,dynamic> model) async {
    EmployeeService service = EmployeeService();
    EmployeeModel savedModel = await service.update(id, model);
    return savedModel;
  }

  Future<List<AutocompleteModel>> autocomplete(String pattern) async {
    EmployeeService service = EmployeeService();
    List<AutocompleteModel> suggestions = await service.autocomplete(pattern);
    return suggestions;
  }
}