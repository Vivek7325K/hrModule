import 'package:data_table_2/data_table_2.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../models/DepartmentModel.dart';
import '../../../controllers/departmentController.dart';
    import '../../employee/view/employeeViewListItemWidget.dart';    

class DepartmentDataSourceAsync extends AsyncDataTableSource {
  final departmentController = Get.find<DepartmentController>();

  DepartmentDataSourceAsync() {
    print('DepartmentDataSourceAsync created');
  }

  DepartmentDataSourceAsync.empty() {
    _empty = true;
    print('DepartmentDataSourceAsync.empty created');
  }

  DepartmentDataSourceAsync.error() {
    _errorCounter = 0;
    print('DepartmentDataSourceAsync.error created');
  }

  bool _empty = false;
  int? _errorCounter;

  // RangeValues? _caloriesFilter;

  // RangeValues? get caloriesFilter => _caloriesFilter;
  // set caloriesFilter(RangeValues? calories) {
  //   _caloriesFilter = calories;
  //   refreshDatasource();
  // }

  // Future<int> getTotalRecords() {
  //   return Future<int>.delayed(const Duration(milliseconds: 0), () => 20);
  // }

  @override
  Future<AsyncRowsResponse> getRows(int start, int end) async {
    var listModel = await departmentController.fetchList(limit: end, offset: start);

    var r = AsyncRowsResponse(
        listModel.count,
        listModel.rows.map((model) {
          return DataRow2(
            key: ValueKey<String>(model.id ?? ""),
            // selected: dessert.selected,
            onSelectChanged: (value) {
              if (value != null) {
                setRowSelection(ValueKey<String>(model.id ?? ""), value);
              }
            },
            onTap: () async {
              await Get.toNamed('/departmentForm', arguments: {"id": model.id ?? ""});
              refreshDatasource();
            },
            cells: [
              DataCell(Text("Edit")),
            DataCell(Text("${model.department }")),
              DataCell( EmployeeViewListItemWidget(model.employee)),
            ],
          );
        }).toList());

    return r;
  }
}