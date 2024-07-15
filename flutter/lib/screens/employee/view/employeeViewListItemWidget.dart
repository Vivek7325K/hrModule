import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import '../../../theme/app_theme.dart';
import '../../../models/employeeModel.dart';
import '../../../controllers/employeeController.dart';
import '../../../widgets/application_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class EmployeeViewListItemWidget extends StatelessWidget {
  EmployeeModel? model;
  EmployeeViewListItemWidget(this.model);

  @override
  Widget build(BuildContext context) {
        return Text("${model != null ? model!.email : ''}");
  }
  
}
