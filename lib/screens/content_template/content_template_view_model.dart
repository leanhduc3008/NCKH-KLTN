import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../common/base/query_view_model.dart';
import '../../common/constants/collections.dart';
import '../../data/model/template.dart';

class ContentTemplateViewModel extends QueryViewModel<Template> {
  ContentTemplateViewModel() : super(pageSize: 25);

  final col = FirebaseFirestore.instance.collection(Collections.template);
  final inputKey = GlobalKey<FormFieldState<String>>();

  @override
  Query<Template> queryData() => col.withConverter(
        fromFirestore: (snapshot, _) => Template.fromJson(snapshot.data()!),
        toFirestore: (Template template, _) => template.toJson(),
      );

  void filter() {}

  void selectedTemplate(Template template) {
    Get.back(result: template.content);
  }

  String? inputValid(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Vui long nhap noi dung';
    }
    return null;
  }

  Future<void> addContent() async {
    if (inputKey.currentState!.validate()) {
      inputKey.currentState!.save();
      await col.add(Template(
        content: inputKey.currentState!.value!.trim(),
      ).toJson());
      inputKey.currentState!.reset();
    }
  }
}
