import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/constants/dimens.dart';
import '../../common/extension/extenstion.dart';
import '../../widgets/widget.dart';
import '../home/home_page.dart';
import 'content_template_view_model.dart';

class ContentTemplatePage extends GetView<ContentTemplateViewModel> {
  const ContentTemplatePage({super.key});

  static const String routePath = '/ContentTemplatePage';
  static Future<dynamic>? goToPage() {
    return Get.toNamed(HomePage.routePath + ContentTemplatePage.routePath);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: AppNavbar.search(
          title: context.l10n.content_template,
          hintText: context.l10n.search_content,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: controller.builder((state, status) {
                  return ListView.separated(
                    padding: Dimens.s3.insetAll,
                    controller: controller.scroll,
                    itemCount: state?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      if (index + 1 == state!.length && status.isLoadingMore) {
                        return const CircularProgressIndicator.adaptive();
                      }
                      final template = state.elementAt(index);

                      return GestureDetector(
                        onTap: () => controller.selectedTemplate(template),
                        child: Container(
                          padding: const EdgeInsets.all(Dimens.s3),
                          decoration: BoxDecoration(
                            color: context.colorScheme.secondaryContainer,
                            borderRadius: Dimens.s3.borderRadius,
                          ),
                          child: Text(
                            template.content,
                            style: context.textStyle.bodySmall,
                            maxLines: 3,
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => Dimens.s2.gapHeight,
                  );
                }),
              ),
              Padding(
                padding: Dimens.s3.insetAll,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: AppTextFormField(
                        minLines: 1,
                        maxLines: 5,
                        scrollPhysics: const ClampingScrollPhysics(),
                        keyboardType: TextInputType.multiline,
                        fieldKey: controller.inputKey,
                        validator: controller.inputValid,
                      ),
                    ),
                    const SizedBox(width: Dimens.s3),
                    AppElevatedButton(
                      expandedWith: false,
                      onPressed: controller.addContent,
                      child: Text(context.l10n.add),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
