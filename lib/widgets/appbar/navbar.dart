import 'package:flutter/material.dart';

import '../../common/constants/theme.dart';
import '../input/app_text_form_field.dart';

class Navbar extends StatefulWidget implements PreferredSizeWidget {
  const Navbar({
    super.key,
    this.getCurrentPage,
    this.searchController,
    this.searchOnChanged,
    this.title = 'Home',
    this.categoryOne = '',
    this.categoryTwo = '',
    this.tags = const [],
    this.transparent = false,
    this.rightOptions = true,
    this.reverseTextcolor = false,
    this.isOnSearch = false,
    this.searchAutofocus = false,
    this.backButton = false,
    this.noShadow = false,
    this.bgColor = AppColors.white,
    this.searchBar = false,
  });

  final String title;
  final String categoryOne;
  final String categoryTwo;
  final bool searchBar;
  final bool backButton;
  final bool transparent;
  final bool reverseTextcolor;
  final bool rightOptions;
  final List<String> tags;
  final ValueChanged<String>? getCurrentPage;
  final bool isOnSearch;
  final TextEditingController? searchController;
  final ValueChanged<String>? searchOnChanged;
  final bool searchAutofocus;
  final bool noShadow;
  final Color bgColor;

  @override
  State<Navbar> createState() => _NavbarState();

  @override
  Size get preferredSize => const Size.fromHeight(180.0);
}

class _NavbarState extends State<Navbar> {
  late String activeTag;

  @override
  void initState() {
    if (widget.tags.isNotEmpty) {
      activeTag = widget.tags[0];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool categories =
        widget.categoryOne.isNotEmpty && widget.categoryTwo.isNotEmpty;
    final bool tagsExist = widget.tags.isNotEmpty;

    return Container(
        height: widget.searchBar
            ? (!categories
                ? (tagsExist ? 211.0 : 178.0)
                : (tagsExist ? 262.0 : 210.0))
            : (!categories
                ? (tagsExist ? 162.0 : 108.0)
                : (tagsExist ? 200.0 : 150.0)),
        decoration: BoxDecoration(
            color: !widget.transparent ? widget.bgColor : Colors.transparent,
            boxShadow: [
              BoxShadow(
                  color: !widget.transparent && !widget.noShadow
                      ? AppColors.muted
                      : Colors.transparent,
                  spreadRadius: -10,
                  blurRadius: 12,
                  offset: const Offset(0, 5))
            ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            icon: Icon(
                                !widget.backButton
                                    ? Icons.menu
                                    : Icons.arrow_back_ios,
                                color: !widget.transparent
                                    ? (widget.bgColor == AppColors.white
                                        ? AppColors.text
                                        : AppColors.white)
                                    : (widget.reverseTextcolor
                                        ? AppColors.text
                                        : AppColors.white),
                                size: 24.0),
                            onPressed: () {
                              if (!widget.backButton) {
                                Scaffold.of(context).openDrawer();
                              } else {
                                Navigator.pop(context);
                              }
                            }),
                        Text(widget.title,
                            style: TextStyle(
                                color: !widget.transparent
                                    ? (widget.bgColor == AppColors.white
                                        ? AppColors.text
                                        : AppColors.white)
                                    : (widget.reverseTextcolor
                                        ? AppColors.text
                                        : AppColors.white),
                                fontWeight: FontWeight.w400,
                                fontSize: 18.0)),
                      ],
                    ),
                    if (widget.rightOptions)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => Notifications()));
                            },
                            child: IconButton(
                                icon: Icon(Icons.notifications_active,
                                    color: !widget.transparent
                                        ? (widget.bgColor == AppColors.white
                                            ? AppColors.text
                                            : AppColors.white)
                                        : (widget.reverseTextcolor
                                            ? AppColors.text
                                            : AppColors.white),
                                    size: 22.0),
                                onPressed: null),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => Cart()));
                            },
                            child: IconButton(
                                icon: Icon(Icons.shopping_basket,
                                    color: !widget.transparent
                                        ? (widget.bgColor == AppColors.white
                                            ? AppColors.text
                                            : AppColors.white)
                                        : (widget.reverseTextcolor
                                            ? AppColors.text
                                            : AppColors.white),
                                    size: 22.0),
                                onPressed: null),
                          ),
                        ],
                      )
                  ],
                ),
                if (widget.searchBar)
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: AppTextFormField(
                        hintText: 'What are you looking for?',
                        controller: widget.searchController,
                        onChanged: widget.searchOnChanged,
                        autofocus: widget.searchAutofocus,
                        suffixIcon: const Icon(Icons.search),
                        onTap: () {}),
                  ),
                const SizedBox(
                  height: 10.0,
                ),
                if (categories)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => Trending()));
                        },
                        child: Row(
                          children: [
                            const Icon(Icons.camera,
                                color: AppColors.text, size: 18.0),
                            const SizedBox(width: 8),
                            Text(widget.categoryOne,
                                style: const TextStyle(
                                    color: AppColors.text, fontSize: 14.0)),
                          ],
                        ),
                      ),
                      const SizedBox(width: 30),
                      Container(
                        color: AppColors.text,
                        height: 25,
                        width: 1,
                      ),
                      const SizedBox(width: 30),
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => Fashion()));
                        },
                        child: Row(
                          children: [
                            const Icon(Icons.shopping_cart,
                                color: AppColors.text, size: 18.0),
                            const SizedBox(width: 8),
                            Text(widget.categoryTwo,
                                style: const TextStyle(
                                    color: AppColors.text, fontSize: 14.0)),
                          ],
                        ),
                      )
                    ],
                  ),
                if (tagsExist) SizedBox(height: 40, child: Container())
              ],
            ),
          ),
        ));
  }
}
