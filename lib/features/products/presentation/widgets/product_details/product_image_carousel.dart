import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/app/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../shared/presentation/widgets/centered_progress_indicator.dart';

class ProductImageCarousel extends StatefulWidget {
  const ProductImageCarousel({super.key, required this.image});

  final List<String> image;

  @override
  State<ProductImageCarousel> createState() => _ProductImageCarouselState();
}

class _ProductImageCarouselState extends State<ProductImageCarousel> {
  final ValueNotifier<int> _currentIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 200,
              initialPage: 0,
              autoPlay: false,
              autoPlayInterval: Duration(seconds: 1),
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                _currentIndex.value = index;
              },
            ),

            items: widget.image.map((image) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 1),
                    decoration: BoxDecoration(
                      color: Colors.grey.withAlpha(60),
                      borderRadius: .circular(10),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: image,
                      errorWidget: (_, _, _) => Icon(Icons.error),
                      progressIndicatorBuilder: (_, _, _) => CenteredProgressIndicator(),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          SizedBox(height: 8),
          Positioned(
            bottom: 8,
            right: 0,
            left: 0,
            child: ValueListenableBuilder(
              valueListenable: _currentIndex,
              builder: (context, value, _) {
                return Row(
                  mainAxisAlignment: .center,
                  children: [
                    for (int i = 0; i < widget.image.length; i++)
                      Container(
                        width: 10,
                        height: 10,
                        margin: .only(right: 4),
                        decoration: BoxDecoration(
                          color: value == i
                              ? AppColors.themeColor
                              : Colors.white,
                          shape: .circle,
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
