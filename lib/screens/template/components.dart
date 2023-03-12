import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/route_manager.dart';

import '../../common/constants/dimens.dart';
import '../../common/constants/theme.dart';
import '../../common/extension/extenstion.dart';
import '../../router/route_menu.dart';
import '../../widgets/widget.dart';
import '../settings/settings_page.dart';
import 'template_page.dart';

class Components extends StatefulWidget {
  const Components({super.key});

  static const String routePath = '/Components';
  static Future<void>? goToPage() {
    return Get.offAllNamed(TemplatePage.routePath + Components.routePath);
  }

  @override
  State<Components> createState() => _ComponentsState();
}

class _ComponentsState extends State<Components> {
  final List<String> titles = [
    'Typography',
    'Buttons',
    'Inputs',
    'Switches',
    'Navigation',
    'Table Cell',
    'Card',
    'Selection',
    'Carousel',
    'Dialog',
    'Drawer',
  ];
  Widget drawer = RouteMenu.drawer;
  bool switchValueOne = true;
  bool switchValueTwo = false;
  String imageUrl =
      'https://images.unsplash.com/photo-1506744038136-46273834b3fb';
  String content =
      'Some example text some example text. John Doe is an architect and engineer';
  late String dropdownValue = titles.first;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: titles.length,
      child: Scaffold(
          drawer: drawer,
          appBar: AppNavbar(
            title: 'Components',
            bottom: TabBar(
              labelColor: context.colorScheme.onPrimary,
              unselectedLabelColor:
                  context.colorScheme.onPrimary.withOpacity(.5),
              isScrollable: true,
              tabs: titles.map((e) => Tab(text: e)).toList(),
              onTap: (value) {
                Scrollable.ensureVisible(
                  GlobalObjectKey(value).currentContext!,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.fastOutSlowIn,
                );
              },
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(Dimens.s3),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitle(context, 0),
                  Text(
                    'displayLarge',
                    style: context.textStyle.displayLarge,
                    maxLines: 1,
                  ),
                  Text(
                    'displayMedium',
                    style: context.textStyle.displayMedium,
                    maxLines: 1,
                  ),
                  Text('displaySmall', style: context.textStyle.displaySmall),
                  Text('headlineLarge', style: context.textStyle.headlineLarge),
                  Text('headlineMedium',
                      style: context.textStyle.headlineMedium),
                  Text('headlineSmall', style: context.textStyle.headlineSmall),
                  Text('titleLarge', style: context.textStyle.titleLarge),
                  Text('titleMedium', style: context.textStyle.titleMedium),
                  Text('titleSmall', style: context.textStyle.titleSmall),
                  Text('labelLarge', style: context.textStyle.labelLarge),
                  Text('labelMedium', style: context.textStyle.labelMedium),
                  Text('labelSmall', style: context.textStyle.labelSmall),
                  Text('bodyLarge', style: context.textStyle.bodyLarge),
                  Text('bodyMedium', style: context.textStyle.bodyMedium),
                  Text('bodySmall', style: context.textStyle.bodySmall),
                  _buildTitle(context, 1),
                  AppElevatedButton(
                    onPressed: () {},
                    child: const Text('DEFAULT'),
                  ),
                  AppOutlinedButton(
                    onPressed: () {},
                    child: const Text('DEFAULT OUTLINE'),
                  ),
                  AppElevatedButton.error(
                    onPressed: () {},
                    child: const Text('ERROR'),
                  ),
                  AppOutlinedButton.error(
                    onPressed: () {},
                    child: const Text('ERROR OUTLINE'),
                  ),
                  AppElevatedButton.warning(
                    onPressed: () {},
                    child: const Text('WARNING'),
                  ),
                  AppOutlinedButton.warning(
                    onPressed: () {},
                    child: const Text('WARNING OUTLINE'),
                  ),
                  AppElevatedButton.success(
                    onPressed: () {},
                    child: const Text('SUCCESS'),
                  ),
                  AppOutlinedButton.success(
                    onPressed: () {},
                    child: const Text('SUCCESS OUTLINE'),
                  ),
                  _buildTitle(context, 2),
                  const AppTextFormField(hintText: 'Regular'),
                  const AppTextFormField(hintText: 'Disable', enabled: false),
                  const AppTextFormField(
                    hintText: 'Regular Icon',
                    prefixIcon: Icon(Icons.ac_unit),
                    suffixIcon: Icon(Icons.ac_unit),
                  ),
                  AppTextFormField(
                    decoration: BorderInputDeconration(
                      hintText: 'Custom success',
                      hintStyle: const TextStyle(color: AppColors.success),
                      borderColor: AppColors.success,
                      suffixIcon: const Icon(
                        Icons.check_circle,
                        color: AppColors.success,
                      ),
                    ),
                  ),
                  AppTextFormField(
                    decoration: BorderInputDeconration(
                      hintText: 'Custom error',
                      hintStyle: const TextStyle(color: AppColors.error),
                      borderColor: AppColors.error,
                      suffixIcon:
                          const Icon(Icons.error, color: AppColors.error),
                    ),
                  ),
                  _buildTitle(context, 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Switch is ON',
                          style: TextStyle(color: AppColors.text)),
                      Switch.adaptive(
                        value: switchValueOne,
                        onChanged: (bool newValue) =>
                            setState(() => switchValueOne = newValue),
                        activeColor: AppColors.primary,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Switch is OFF',
                          style: TextStyle(color: AppColors.text)),
                      Switch.adaptive(
                        value: switchValueTwo,
                        onChanged: (bool newValue) =>
                            setState(() => switchValueTwo = newValue),
                        activeColor: AppColors.primary,
                      ),
                    ],
                  ),
                  _buildTitle(context, 4),
                  const AppNavbar(actions: [Icon(Icons.notifications)]),
                  const SizedBox(height: Dimens.s3),
                  SizedBox(
                    width: double.infinity,
                    height: 130,
                    child: Scaffold(
                      appBar: AppNavbar.search(
                        actions: const [Icon(Icons.notifications)],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 180,
                    child: DefaultTabController(
                      length: 3,
                      child: Scaffold(
                        appBar: AppNavbar.search(
                          actions: const [Icon(Icons.notifications)],
                          bottom: const TabBar(
                            indicatorWeight: 5,
                            tabs: [
                              Tab(text: 'Tab 1'),
                              Tab(text: 'Tab 1'),
                              Tab(text: 'Tab 1'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Navbar(title: 'Regular'),
                  const Navbar(
                      title: 'Custom',
                      backButton: true,
                      bgColor: AppColors.primary),
                  const Navbar(
                      title: 'Categories',
                      searchBar: true,
                      categoryOne: 'Incredible',
                      categoryTwo: 'Customization',
                      backButton: true),
                  const Navbar(
                      title: 'Search', searchBar: true, backButton: true),
                  _buildTitle(context, 5),
                  const TableCellSettings(
                      title: 'Manage Options in Settings',
                      onTap: SettingsPage.goToPage),
                  _buildTitle(context, 6),
                  CardHorizontal(
                      cta: content,
                      title: 'View CardHorizontal',
                      img: imageUrl,
                      tap: () {}),
                  Row(
                    children: [
                      CardSmall(
                          cta: content.substring(0, 50),
                          title: 'View CardSmall',
                          img: imageUrl,
                          tap: () {}),
                      CardSmall(
                          cta: content.substring(0, 50),
                          title: 'View CardSmall',
                          img: imageUrl,
                          tap: () {}),
                    ],
                  ),
                  CardSquare(
                      cta: content.substring(0, 50),
                      title: 'View CardSquare',
                      img: imageUrl,
                      tap: () {}),
                  const BaseCard(
                    content: Text('BaseCard'),
                    leading: Icon(FontAwesomeIcons.facebook),
                    trailing: Icon(FontAwesomeIcons.facebook),
                  ),
                  BaseCard.image(
                    imageUrl: imageUrl,
                    leading: Text(
                      'BaseCard.image',
                      style: context.textStyle.titleSmall,
                    ),
                    content: Text(
                      content,
                      style: context.textStyle.bodySmall,
                    ),
                  ),
                  const BaseCardVertical(
                    content: Text('BaseCardVertical'),
                    leading: Icon(FontAwesomeIcons.facebook),
                    trailing: Icon(FontAwesomeIcons.facebook),
                  ),
                  BaseCardVertical.image(
                    imageUrl: imageUrl,
                    leading: Text(
                      'BaseCardVertical.image',
                      style: context.textStyle.titleMedium,
                    ),
                    content: Text(
                      content,
                      style: context.textStyle.bodyMedium,
                    ),
                  ),
                  _buildTitle(context, 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DropdownButton<String>(
                        value: dropdownValue,
                        onChanged: (String? value) {
                          setState(() {
                            dropdownValue = value!;
                          });
                        },
                        items: titles
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      AppDropdownButton(
                        itemBuilder: (context, int index, closePopup) {
                          return Text(titles.elementAt(index));
                        },
                        itemCount: titles.length,
                        child: const Text('AppDropdownButton'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 200),
                  _buildTitle(context, 8),
                  AppCarousel(
                    images: [imageUrl, imageUrl, imageUrl, imageUrl],
                  ),
                  const ProductCarousel(
                    imgArray: [
                      {
                        'img':
                            'https://images.unsplash.com/photo-1501084817091-a4f3d1d19e07?fit=crop&w=2700&q=80',
                        'title': 'Painting Studio',
                        'description':
                            'You need a creative space ready for your art? We got that covered.',
                        'price': r'$125',
                      },
                      {
                        'img':
                            'https://images.unsplash.com/photo-1500628550463-c8881a54d4d4?fit=crop&w=2698&q=80',
                        'title': 'Art Gallery',
                        'description':
                            "Don't forget to visit one of the coolest art galleries in town.",
                        'price': r'$200',
                      },
                      {
                        'img':
                            'https://images.unsplash.com/photo-1496680392913-a0417ec1a0ad?fit=crop&w=2700&q=80',
                        'title': 'Video Services',
                        'description':
                            'Some of the best music video services someone could have for the lowest prices.',
                        'price': r'$300',
                      },
                    ],
                  ),
                  _buildTitle(context, 9),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Get.showDefaultDialog(
                              title: const Text('Default Dialog auto'),
                              content: Text(content),
                            );
                          },
                          child: const Text('DefaultDialog auto')),
                      OutlinedButton(
                          onPressed: () {
                            Get.showDefaultDialog(
                              title: const Text('Default Dialog'),
                              content: Text(content),
                              timeClose: null,
                            );
                          },
                          child: const Text('DefaultDialog')),
                    ],
                  ),
                  _buildTitle(context, 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              drawer = const NowDrawer(
                                currentPage: Components.routePath,
                              );
                            });
                          },
                          child: const Text('NowDrawer')),
                      OutlinedButton(
                          onPressed: () {
                            setState(() => drawer = RouteMenu.drawer);
                          },
                          child: const Text('AppDrawer')),
                    ],
                  ),
                ].applySeparator(const SizedBox(height: Dimens.s3)),
              ),
            ),
          )),
    );
  }

  Text _buildTitle(BuildContext context, int index) => Text(
        key: GlobalObjectKey(index),
        titles[index],
        style: context.textStyle.headlineSmall?.weight700.italic,
      );
}
