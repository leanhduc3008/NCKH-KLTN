import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../common/extension/extenstion.dart';
import '../../common/constants/dimens.dart';

class AppCarousel extends StatefulWidget {
  const AppCarousel({super.key, required this.images, this.isLocal = false});

  final List<String> images;
  final bool isLocal;

  @override
  State<AppCarousel> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<AppCarousel> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final width = 32 + MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.width / 3;

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
          carouselController: _controller,
          options: CarouselOptions(
            initialPage: _current,
            autoPlay: true,
            viewportFraction: 1,
            aspectRatio: width / height,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
          items: widget.images
              .map<Widget>((banner) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Dimens.s3),
                    child: ClipRRect(
                      borderRadius: Dimens.s3.borderRadius,
                      child: Builder(builder: (context) {
                        if (widget.isLocal) {
                          return Image.asset(
                            banner,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          );
                        }

                        return Image.network(
                          banner,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        );
                      }),
                    ),
                  ))
              .toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.images.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.fastOutSlowIn,
                width: _current == entry.key ? Dimens.s5 : Dimens.s2,
                height: Dimens.s2,
                margin: const EdgeInsets.symmetric(
                  vertical: Dimens.s2,
                  horizontal: Dimens.s1,
                ),
                decoration: BoxDecoration(
                    borderRadius: Dimens.s2.borderRadius,
                    color: context.colorScheme.background
                        .withOpacity(_current == entry.key ? 1 : .5)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
