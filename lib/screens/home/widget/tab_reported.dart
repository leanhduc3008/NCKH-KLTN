import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/state_manager.dart';

import '../../../common/constants/dimens.dart';
import '../../../common/extension/extenstion.dart';
import '../../../data/model/ticket.dart';
import '../../../widgets/widget.dart';
import '../../add_ticket/add_ticket_page.dart';
import '../controller/tab_reported_controller.dart';

class TabReported extends GetView<TabReportedController> {
  const TabReported({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.builder((state, status) {
        return ListView.separated(
          controller: controller.scroll,
          padding: const EdgeInsets.all(Dimens.s2),
          itemBuilder: (_, index) {
            if (index + 1 == state.length && status.isLoadingMore) {
              return const CircularProgressIndicator.adaptive();
            }
            return ItemTicket(state[index]);
          },
          separatorBuilder: (_, __) => const SizedBox(height: Dimens.s2),
          itemCount: state!.length,
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: context.colorScheme.tertiaryContainer,
        onPressed: AddTicketPage.goToPage,
        child: Icon(
          FontAwesomeIcons.plus,
          color: context.colorScheme.onTertiaryContainer,
        ),
      ),
    );
  }
}

class ItemTicket extends StatelessWidget {
  const ItemTicket(this.item, {super.key});

  final Ticket item;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      leading: const Icon(FontAwesomeIcons.ticket),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(item.title, style: context.textStyle.titleSmall, maxLines: 1),
          Text(item.content, style: context.textStyle.labelMedium, maxLines: 3),
        ],
      ),
    );
  }
}
