import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import '../../../theme/app_theme.dart';
import '../../../models/employeeModel.dart';
import '../../../controllers/employeeController.dart';
import '../../../widgets/application_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmployeeFormScreen extends StatefulWidget {
  const EmployeeFormScreen({super.key});

  @override
  State<EmployeeFormScreen> createState() => _EmployeeFormScreenState();
}

class _EmployeeFormScreenState extends State<EmployeeFormScreen> {
  final employeeController = Get.find<EmployeeController>();
  bool loading = true;
  EmployeeModel? initailModel;

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
    EmployeeModel model = await employeeController.fetchById(id: id ?? "");
    setState(() {
      initailModel = model;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationAppBar(context: context, appBarTitle: '${id != null ? 'Update' : 'Create'} Employee',),
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
            FormBuilderTextField(
                      autovalidateMode: AutovalidateMode.always,
                      name: 'firstName',
                      decoration: InputDecoration(
                        labelText: 'Name',
                      ),
                      initialValue: "${initailModel!=null?initailModel!.firstName:"" }",
                      onChanged: (val) {},
                      // valueTransformer: (text) => num.tryParse(text),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required()
                      ]),
                      // initialValue: '12',
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                    ),
          
            FormBuilderTextField(
                      autovalidateMode: AutovalidateMode.always,
                      name: 'lastName',
                      decoration: InputDecoration(
                        labelText: 'Last Name',
                      ),
                      initialValue: "${initailModel!=null?initailModel!.lastName:"" }",
                      onChanged: (val) {},
                      // valueTransformer: (text) => num.tryParse(text),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required()
                      ]),
                      // initialValue: '12',
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                    ),
          
            FormBuilderTextField(
                      autovalidateMode: AutovalidateMode.always,
                      name: 'title',
                      decoration: InputDecoration(
                        labelText: 'Title',
                      ),
                      initialValue: "${initailModel!=null?initailModel!.title:"" }",
                      onChanged: (val) {},
                      // valueTransformer: (text) => num.tryParse(text),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required()
                      ]),
                      // initialValue: '12',
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                    ),
          
            FormBuilderTextField(
                      autovalidateMode: AutovalidateMode.always,
                      name: 'email',
                      decoration: InputDecoration(
                        labelText: 'Email',
                      ),
                      initialValue: "${initailModel!=null?initailModel!.email:"" }",
                      onChanged: (val) {},
                      // valueTransformer: (text) => num.tryParse(text),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required()
                      ]),
                      // initialValue: '12',
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                    ),
          
          
            FormBuilderTextField(
                      autovalidateMode: AutovalidateMode.always,
                      name: 'phoneNumber',
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                      ),
                      initialValue: "${initailModel!=null?initailModel!.phoneNumber : '' }",
                      
                      onChanged: (val) {},
                      // valueTransformer: (text) => num.tryParse(text),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required()
                      ]),
                      // initialValue: '12',
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
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
                              await employeeController.updateData(id ?? "", model);
                            } else {
                              await employeeController.create(model);
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
