import 'package:get/get.dart';
import '../models/autocomplete_model.dart';

import '../models/projectModel.dart';
import '../services/projectService.dart';

class ProjectController extends GetxController {

  Future<ProjectListModel> fetchList({
    required int limit,
    required int offset,
    String? orderBy,
  }) async {
    
    ProjectService service = ProjectService();
    ProjectListModel listModel = await service.list(limit:limit,offset:offset, orderBy:orderBy);
    
    return listModel;
  }

  Future<ProjectModel> fetchById({
    required String id
  }) async {
   ProjectService service = ProjectService();
    ProjectModel model = await service.find(id:id);
    return model;
  }

  Future<ProjectModel> create(Map<String,dynamic> model) async {
    ProjectService service = ProjectService();
    ProjectModel savedModel = await service.create(model);
    return savedModel;
  }

  Future<ProjectModel> updateData(String id, Map<String,dynamic> model) async {
    ProjectService service = ProjectService();
    ProjectModel savedModel = await service.update(id, model);
    return savedModel;
  }

  Future<List<AutocompleteModel>> autocomplete(String pattern) async {
    ProjectService service = ProjectService();
    List<AutocompleteModel> suggestions = await service.autocomplete(pattern);
    return suggestions;
  }
}