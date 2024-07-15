import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import '../../../theme/app_theme.dart';
import '../../../models/departmentModel.dart';
import '../../../controllers/departmentController.dart';
import '../../../widgets/application_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
    import '../../employee/form/employeeAutocompleteFormField.dart';

class DepartmentFormScreen extends StatefulWidget {
  const DepartmentFormScreen({super.key});

  @override
  State<DepartmentFormScreen> createState() => _DepartmentFormScreenState();
}

class _DepartmentFormScreenState extends State<DepartmentFormScreen> {
  final departmentController = Get.find<DepartmentController>();
  bool loading = true;
  DepartmentModel? initailModel;

  String? id = Get.arguments?["id"];

  final _formKey = GlobalKey<FormBuilderState>();

 @override
  void initState() {
    super.initState();

    if (id != null) {
      fetchInitValues();
    } else {
      setState(() {
        loading = false;
      });
    }
  }

  Future<void> fetchInitValues() async {
    DepartmentModel model = await departmentController.fetchById(id: id ?? "");
    setState(() {
      initailModel = model;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationAppBar(context: context, appBarTitle: '${id != null ? 'Update' : 'Create'} Department',),
      body: Stack(children: [
        Obx(
          () => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AppTheme.isLightTheme.value
                    ? AssetImage('assets/background_light.png')
                    : AssetImage('assets/background.png'),
              ),
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child:  loading
                  ? Text("Loading...")
                  : Column(children: <Widget>[
                FormBuilder(
                  key: _formKey,
                  // enabled: false,
                  onChanged: () {
                    _formKey.currentState!.save();
                    debugPrint(_formKey.currentState!.value.toString());
                  },
                  autovalidateMode: AutovalidateMode.disabled,
                  skipDisabled: true,
                  child: Column(children: <Widget>[
          
          
                  EmployeeAutocompleteFormField(
                      name: 'employee',
                      label: 'Employee',
                      initialValue: initailModel!=null?initailModel!.employee:null,
                    ),
                  ]),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState?.saveAndValidate() ??
                              false) {
                            var model = _formKey.currentState?.value ?? {};
                            EasyLoading.show(status: "Saving...");
                            if (id != null) {
                              await departmentController.updateData(id ?? "", model);
                            } else {
                              await departmentController.create(model);
                            }
                            EasyLoading.dismiss();
                            Get.back();

                          } else {
                            debugPrint(_formKey.currentState?.value.toString());
                            debugPrint('validation failed');
                          }
                        },
                        child: const Text(
                          'Submit',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          _formKey.currentState?.reset();
                        },
                        // color: Theme.of(context).colorScheme.secondary,
                        child: Text(
                          'Reset',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                      ),
                    ),
                  ],
                )
              ]),
            ),
          ),
        )
      ]),
    );
  }
}
