import 'package:get/get.dart';
import '../models/autocomplete_model.dart';

import '../models/departmentModel.dart';
import '../services/departmentService.dart';

class DepartmentController extends GetxController {

  Future<DepartmentListModel> fetchList({
    required int limit,
    required int offset,
    String? orderBy,
  }) async {
    
    DepartmentService service = DepartmentService();
    DepartmentListModel listModel = await service.list(limit:limit,offset:offset, orderBy:orderBy);
    
    return listModel;
  }

  Future<DepartmentModel> fetchById({
    required String id
  }) async {
   DepartmentService service = DepartmentService();
    DepartmentModel model = await service.find(id:id);
    return model;
  }

  Future<DepartmentModel> create(Map<String,dynamic> model) async {
    DepartmentService service = DepartmentService();
    DepartmentModel savedModel = await service.create(model);
    return savedModel;
  }

  Future<DepartmentModel> updateData(String id, Map<String,dynamic> model) async {
    DepartmentService service = DepartmentService();
    DepartmentModel savedModel = await service.update(id, model);
    return savedModel;
  }

  Future<List<AutocompleteModel>> autocomplete(String pattern) async {
    DepartmentService service = DepartmentService();
    List<AutocompleteModel> suggestions = await service.autocomplete(pattern);
    return suggestions;
  }
}