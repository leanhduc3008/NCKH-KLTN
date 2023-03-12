import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../common/constants/dimens.dart';
import '../../common/constants/theme.dart';
import '../../common/extension/extenstion.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
    required this.items,
    this.footer,
  });

  final List<AppDrawerItem> items;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: Dimens.s6 * 10,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimens.s2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const SizedBox(width: Dimens.s1),
                  Icon(
                    FontAwesomeIcons.ticket,
                    size: Dimens.s8,
                    color: context.colorScheme.primary,
                  ),
                  const SizedBox(width: Dimens.s3),
                  Text(
                    'Ticket App',
                    style: context.textStyle.headlineMedium?.copyWith(
                      color: context.colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: Dimens.s3),
              Expanded(
                child: ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return items[index];
                  },
                ),
              ),
              if (footer != null) ...[
                Divider(
                  height: Dimens.s3,
                  color: context.colorScheme.primary,
                ),
                footer!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class AppDrawerItem extends StatefulWidget {
  const AppDrawerItem({
    super.key,
    required this.icon,
    required this.label,
    this.routePath,
    this.items = const [],
    this.onTap,
  });

  final IconData icon;
  final String label;
  final String? routePath;
  final GestureTapCallback? onTap;
  final List<AppDrawerItem> items;

  @override
  State<AppDrawerItem> createState() => _AppDrawerItemState();
}

class _AppDrawerItemState extends State<AppDrawerItem> {
  bool expand = false;

  @override
  void initState() {
    if (widget.items.isNotEmpty) {
      expand = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final routeName = ModalRoute.of(context)?.settings.name;
    bool select = false;

    if (widget.routePath != null) {
      select = routeName?.endsWith(widget.routePath!) ?? false;
    }
    final foregroundColor = select
        ? context.colorScheme.onPrimaryContainer
        : context.colorScheme.primary;
    final backgroundColor = select
        ? context.colorScheme.primaryContainer
        : AppColors.transparentColor;

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: Dimens.s3.borderRadius,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: Dimens.s2),
          GestureDetector(
            onTap: select ? Scaffold.of(context).closeDrawer : widget.onTap,
            child: Row(
              children: [
                const SizedBox(width: Dimens.s2),
                Icon(
                  widget.icon,
                  size: Dimens.s5,
                  color: foregroundColor,
                ),
                const SizedBox(width: Dimens.s2),
                Expanded(
                  child: Text(
                    widget.label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textStyle.titleMedium?.copyWith(
                      fontWeight: select ? FontWeight.w600 : FontWeight.w400,
                      color: context.colorScheme.onBackground,
                    ),
                  ),
                ),
                if (widget.items.isNotEmpty)
                  IconButton(
                    padding: EdgeInsets.zero,
                    visualDensity: const VisualDensity(horizontal: -4),
                    icon: Icon(
                      FontAwesomeIcons.caretDown,
                      color: foregroundColor,
                    ),
                    onPressed: () => setState(() => expand = !expand),
                  )
              ],
            ),
          ),
          const SizedBox(height: Dimens.s2),
          if (expand && widget.items.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: Dimens.s4),
              child: Column(children: widget.items.map((e) => e).toList()),
            ),
        ],
      ),
    );
  }
}
