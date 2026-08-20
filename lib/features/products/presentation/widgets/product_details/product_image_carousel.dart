import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/app/app_colors.dart';
import 'package:flutter/material.dart';

class ProductImageCarousel extends StatefulWidget {
  const ProductImageCarousel({super.key});

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
                onPageChanged: (index, reason){
                  _currentIndex.value = index;
                }
            ),



            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 1),
                    decoration: BoxDecoration(color: Colors.grey.withAlpha(60),
                        borderRadius: .circular(10)
                    ),
                    child: Center(
                      child: Text('text $i', style: TextStyle(fontSize: 16.0)),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          SizedBox(height: 8,),
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
                      for (int i = 0; i < 5; i++)
                        Container(
                          width: 10,
                          height: 10,
                          margin: .only(right: 4),
                          decoration: BoxDecoration(
                              color: value == i ? AppColors.themeColor : Colors.white,
                              shape: .circle,

                          ),
                        )
                    ],
                  );
                }
            ),
          )
        ],
      ),
    );
  }
}
