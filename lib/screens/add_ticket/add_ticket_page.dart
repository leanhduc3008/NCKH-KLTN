import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

import '../../common/constants/dimens.dart';
import '../../common/extension/extenstion.dart';
import '../../data/model/device.dart';
import '../../data/model/floor.dart';
import '../../data/model/room.dart';
import '../../widgets/widget.dart';
import '../home/home_page.dart';
import 'add_ticket_view_model.dart';

class AddTicketPage extends GetView<AddTicketViewModel> {
  const AddTicketPage({super.key});

  static const String routePath = '/AddTicketPage';
  static Future<void>? goToPage() {
    return Get.toNamed(HomePage.routePath + AddTicketPage.routePath);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Form(
        key: controller.formKey,
        child: Scaffold(
          appBar: AppNavbar(title: context.l10n.new_ticket),
          body: SafeArea(
            top: false,
            bottom: false,
            child: Padding(
              padding: Dimens.s2.insetAll,
              child: Column(
                children: [
                  Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    columnWidths: const <int, TableColumnWidth>{
                      0: IntrinsicColumnWidth(),
                      1: FlexColumnWidth(),
                    },
                    children: <TableRow>[
                      TableRow(children: [
                        Text(
                          '${context.l10n.floors_page}:',
                          style: context.textStyle.titleMedium,
                        ),
                        Padding(
                          padding: Dimens.s2.insetAll,
                          child: AppDropdownButtonFormField<Floor>(
                            fieldKey: controller.floorKey,
                            items: controller.appProvider.floors
                                .map((item) => DropdownMenuItem<Floor>(
                                      value: item,
                                      child: Text(item.name),
                                    ))
                                .toList(),
                            validator: controller.validatorFloor,
                            onChanged: controller.onChangedFloor,
                            onSaved: (value) => controller.floorSelect = value,
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        Text(
                          '${context.l10n.room}:',
                          style: context.textStyle.titleMedium,
                        ),
                        Padding(
                          padding: Dimens.s2.insetAll,
                          child: AppDropdownButtonFormField<Room>(
                            fieldKey: controller.roomKey,
                            items: controller.floorSelect?.rooms
                                    .map((item) => DropdownMenuItem<Room>(
                                          value: item,
                                          child: Text(item.name),
                                        ))
                                    .toList() ??
                                [],
                            validator: controller.validatorRoom,
                            onChanged: controller.onChangedRoom,
                            onSaved: (value) => controller.roomSelect = value,
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        Text(
                          '${context.l10n.device}:',
                          style: context.textStyle.titleMedium,
                        ),
                        Padding(
                          padding: Dimens.s2.insetAll,
                          child: AppDropdownButtonFormField<Device>(
                            fieldKey: controller.deviceKey,
                            items: controller.roomSelect?.devices
                                .map((item) => DropdownMenuItem<Device>(
                                      value: item,
                                      child: Text(item.name),
                                    ))
                                .toList(),
                            validator: controller.validatorDevice,
                            onChanged: controller.onChangedDevice,
                            onSaved: (v) => controller.deviceSelect = v,
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.top,
                          child: Padding(
                            padding: Dimens.s2.insetTop,
                            child: Text(
                              '${context.l10n.content}:',
                              style: context.textStyle.titleMedium,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: controller.selectContentTemplate,
                          child: Text(context.l10n.content_template),
                        ),
                      ]),
                    ],
                  ),
                  Expanded(
                    child: AppTextFormField(
                      controller: controller.contentEditController,
                      expands: true,
                      maxLines: null,
                      textAlign: TextAlign.justify,
                      textAlignVertical: TextAlignVertical.top,
                      keyboardType: TextInputType.multiline,
                      scrollPhysics: const ClampingScrollPhysics(),
                      decoration: BorderInputDeconration(
                        contentPadding: Dimens.s2.insetAll,
                      ),
                      validator: controller.validatorContent,
                      onChanged: (v) => controller.content = v,
                      onSaved: (v) => controller.content = v,
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: Dimens.s1.insetAll.add(Dimens.s1.insetHorizontal),
              child: AppElevatedButton(
                isLoading: controller.status.isLoading,
                onPressed: controller.onSubmit,
                child: Text(context.l10n.save),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
