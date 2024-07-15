    import "employeeModel.dart";


class DepartmentListModel {
  int? offset;
  int? limit;
  int count = 0;
  List<DepartmentModel> rows = [];

  DepartmentListModel(
      {this.offset, this.limit, required this.count, required this.rows});

  DepartmentListModel.fromJson(Map<String, dynamic> json) {
    offset = json['offset'];
    limit = json['limit'];
    count = json['count'];
    if (json['rows'] != null) {
      rows = <DepartmentModel>[];
      json['rows'].forEach((v) {
        rows!.add(DepartmentModel.fromJson(v));
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

class DepartmentModel {
  String? id;
            List<String>? department;
            EmployeeModel? employee;


  DepartmentModel({
    this.id,
        this.department,        this.employee,    });

  DepartmentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
         department= json['department'];
          employee = json['employee'] != null  && json['employee'].runtimeType != String ? new EmployeeModel.fromJson(json['employee']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
      data['id'] = id;  
          data['department'] = department;
        
        
        if (this.employee != null) {
          data['employee'] = this.employee!.toJson();
        }
    return data;
  }
}