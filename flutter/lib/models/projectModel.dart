    import "employeeModel.dart";


class ProjectListModel {
  int? offset;
  int? limit;
  int count = 0;
  List<ProjectModel> rows = [];

  ProjectListModel(
      {this.offset, this.limit, required this.count, required this.rows});

  ProjectListModel.fromJson(Map<String, dynamic> json) {
    offset = json['offset'];
    limit = json['limit'];
    count = json['count'];
    if (json['rows'] != null) {
      rows = <ProjectModel>[];
      json['rows'].forEach((v) {
        rows!.add(ProjectModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['offset'] = offset;
    data['limit'] = limit;
    data['count'] = count;
    if (rows != null) {
      data['rows'] = rows!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProjectModel {
  String? id;
            List<EmployeeModel>? employee;
            String? project;


  ProjectModel({
    this.id,
        this.employee,        this.project,    });

  ProjectModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
         project= json['project'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
      data['id'] = id;  
        
          data['project'] = project;
        
    return data;
  }
}