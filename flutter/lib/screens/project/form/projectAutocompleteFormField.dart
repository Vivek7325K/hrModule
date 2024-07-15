import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import '../../../controllers/projectController.dart';

class ProjectAutocompleteFormField extends StatelessWidget {
  String name;
  String label;
  dynamic? initialValue;
  ProjectAutocompleteFormField({super.key, required this.name, required this.label, this.initialValue});

  final projectController = Get.find<ProjectController>();

  TextEditingController? _typeAheadController; // = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return FormBuilderField(
        name: name,
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
        ]),
        initialValue: initialValue,
        valueTransformer: (dynamic value) {
          if (value != null && value.runtimeType != String) {
            return value.id;
          }
          return value;
        },
        builder: (FormFieldState<dynamic> field) {
          if (this._typeAheadController == null) {
            String initText = field.value != null ? field.value.id : "";
            this._typeAheadController =
                TextEditingController(text: initText);
          }
          return TypeAheadFormField(
            textFieldConfiguration: TextFieldConfiguration(
                controller: this._typeAheadController,
                decoration: InputDecoration(labelText: label)),
            suggestionsCallback: (String pattern) async {
              return await projectController.autocomplete(pattern);
            },
            itemBuilder: (context, suggestion) {
              return ListTile(
                title: Text(suggestion.label ?? ""),
              );
            },
            transitionBuilder: (context, suggestionsBox, controller) {
              return suggestionsBox;
            },
            onSuggestionSelected: (suggestion) {
              field.didChange(suggestion.id);
              this._typeAheadController!.text = suggestion!.label??"";
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please select a $name';
              }
            },
            onSaved: (value) {
              debugPrint(value);
            },
          );
        });
  }
}

