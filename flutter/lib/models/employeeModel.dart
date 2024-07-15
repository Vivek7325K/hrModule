

class EmployeeListModel {
  int? offset;
  int? limit;
  int count = 0;
  List<EmployeeModel> rows = [];

  EmployeeListModel(
      {this.offset, this.limit, required this.count, required this.rows});

  EmployeeListModel.fromJson(Map<String, dynamic> json) {
    offset = json['offset'];
    limit = json['limit'];
    count = json['count'];
    if (json['rows'] != null) {
      rows = <EmployeeModel>[];
      json['rows'].forEach((v) {
        rows!.add(EmployeeModel.fromJson(v));
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

class EmployeeModel {
  String? id;
            String? firstName;
            String? lastName;
            String? title;
            String? email;
            int? phoneNumber;


  EmployeeModel({
    this.id,
        this.firstName,        this.lastName,        this.title,        this.email,        this.phoneNumber,    });

  EmployeeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
         firstName= json['firstName'];
         lastName= json['lastName'];
         title= json['title'];
         email= json['email'];
         phoneNumber= json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
      data['id'] = id;  
          data['firstName'] = firstName;
        
          data['lastName'] = lastName;
        
          data['title'] = title;
        
          data['email'] = email;
        
          data['phoneNumber'] = phoneNumber;
        
    return data;
  }
}