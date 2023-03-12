import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../common/constants/dimens.dart';
import '../../common/extension/extenstion.dart';
import '../../data/model/device.dart';
import '../../data/model/floor.dart';
import '../../data/model/room.dart';
import '../../widgets/widget.dart';

class FloorPage extends StatefulWidget {
  const FloorPage({super.key});

  static const String routePath = '/FloorPage';
  static Future<void>? goToPage(Floor floor) {
    return Get.toNamed(
      FloorPage.routePath,
      arguments: floor,
      preventDuplicates: false,
    );
  }

  @override
  State<FloorPage> createState() => _FloorPageState();
}

class _FloorPageState extends State<FloorPage>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  late Floor floor;
  late List<Device> devices;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    floor = Get.arguments;
    _initDevices();
    super.initState();
    controller.addListener(() => setState(() {}));
  }

  List<Device> _initDevices() {
    return devices = floor.rooms.fold(<Device>[], (pre, e) => pre + e.devices);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppNavbar(
        title: '${context.l10n.floors_page} ${floor.position}',
      ),
      body: Row(
        children: [
          if (context.isLandscape) ...[
            NavigationRail(
              labelType: context.responsiveValue<NavigationRailLabelType>(
                desktop: NavigationRailLabelType.all,
                tablet: NavigationRailLabelType.all,
                mobile: NavigationRailLabelType.selected,
                watch: NavigationRailLabelType.none,
              ),
              onDestinationSelected: controller.animateTo,
              selectedIndex: controller.index,
              destinations: <NavigationRailDestination>[
                NavigationRailDestination(
                  icon: const Icon(Icons.room),
                  label: Text(context.l10n.room),
                ),
                NavigationRailDestination(
                  icon: const Icon(Icons.light),
                  label: Text(context.l10n.device),
                ),
              ],
            ),
            const VerticalDivider(thickness: 1, width: 1),
          ],
          Expanded(
            child: TabBarView(
              controller: controller,
              children: [
                TabRoom(
                  floor.rooms,
                  onChanged: (Room? value) {
                    if (value != null) {
                      devices = value.devices;
                    } else {
                      _initDevices();
                    }
                    controller.animateTo(1);
                  },
                ),
                TabDevice(devices),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: context.isPortrait
          ? BottomNavigationBar(
              currentIndex: controller.index,
              onTap: controller.animateTo,
              items: [
                BottomNavigationBarItem(
                  icon: const Icon(Icons.room),
                  label: context.l10n.room,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.light),
                  label: context.l10n.device,
                ),
              ],
            )
          : null,
    );
  }
}

class TabRoom extends StatelessWidget {
  const TabRoom(this.rooms, {super.key, required this.onChanged});

  final List<Room> rooms;
  final ValueChanged<Room?> onChanged;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(Dimens.s3),
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return GestureDetector(
            onTap: () => onChanged(null),
            child: BaseCard(
              leading: const Icon(Icons.apps),
              content: Text(context.l10n.all),
            ),
          );
        }

        final room = rooms.elementAt(index - 1);
        return GestureDetector(
          onTap: () => onChanged(room),
          child: BaseCard(
            leading: const Icon(Icons.light),
            content: Text(room.name, style: context.textStyle.bodySmall),
          ),
        );
      },
      itemCount: rooms.length + 1,
      separatorBuilder: (_, __) => const SizedBox(height: Dimens.s3),
    );
  }
}

class TabDevice extends StatelessWidget {
  const TabDevice(this.devices, {super.key});

  final List<Device> devices;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(Dimens.s3),
      itemBuilder: (BuildContext context, int index) {
        return BaseCard.image(
          imageUrl: devices[index].imageUrl,
          leading: Text(
            devices[index].name,
            style: context.textStyle.titleSmall,
          ),
          content: Text(
            devices[index].information,
            style: context.textStyle.bodySmall,
          ),
        );
      },
      itemCount: devices.length,
      separatorBuilder: (_, __) => const SizedBox(height: Dimens.s3),
    );
  }
}
