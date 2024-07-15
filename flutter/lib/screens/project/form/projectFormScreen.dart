import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import '../../../theme/app_theme.dart';
import '../../../models/projectModel.dart';
import '../../../controllers/projectController.dart';
import '../../../widgets/application_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectFormScreen extends StatefulWidget {
  const ProjectFormScreen({super.key});

  @override
  State<ProjectFormScreen> createState() => _ProjectFormScreenState();
}

class _ProjectFormScreenState extends State<ProjectFormScreen> {
  final projectController = Get.find<ProjectController>();
  bool loading = true;
  ProjectModel? initailModel;

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
    ProjectModel model = await projectController.fetchById(id: id ?? "");
    setState(() {
      initailModel = model;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationAppBar(context: context, appBarTitle: '${id != null ? 'Update' : 'Create'} Project',),
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
                      name: 'project',
                      decoration: InputDecoration(
                        labelText: 'Project',
                      ),
                      initialValue: "${initailModel!=null?initailModel!.project:"" }",
                      onChanged: (val) {},
                      // valueTransformer: (text) => num.tryParse(text),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required()
                      ]),
                      // initialValue: '12',
                      keyboardType: TextInputType.text,
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
                              await projectController.updateData(id ?? "", model);
                            } else {
                              await projectController.create(model);
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
