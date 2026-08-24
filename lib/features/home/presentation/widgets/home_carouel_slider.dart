import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/app/app_colors.dart';
import 'package:ecommerce_app/features/home/presentation/providers/home_slider_provider.dart';
import 'package:ecommerce_app/features/shared/presentation/widgets/centered_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeCarouselSlider extends StatefulWidget {
  const HomeCarouselSlider({super.key});

  @override
  State<HomeCarouselSlider> createState() => _HomeCarouselSliderState();
}

class _HomeCarouselSliderState extends State<HomeCarouselSlider> {

  final ValueNotifier<int> _currentIndex = ValueNotifier<int>(0);



  @override
  Widget build(BuildContext context) {
    return Consumer<HomeSliderProvider>(
      builder: (context, homeSliderProvider,_) {
        if(homeSliderProvider.getHomeSliderProgress){
          return SizedBox(
              height: 190,
              child: CenteredProgressIndicator());
        }


        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 180,
                initialPage: 0,
                autoPlay: false,
                autoPlayInterval: Duration(seconds: 1),
                viewportFraction: 1,
                onPageChanged: (index, reason){
                  _currentIndex.value = index;
                }
              ),

              // =======>>>>>

              items: homeSliderProvider.slide.map((slide) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 1),
                      decoration: BoxDecoration(color: AppColors.themeColor,
                      borderRadius: .circular(10),

                      ),
                      child: ClipRRect(
                        borderRadius: .circular(8),
                        child: CachedNetworkImage(imageUrl: slide.photoUrl, fit: .cover, errorWidget: (_,_,_)=>CenteredProgressIndicator(), progressIndicatorBuilder: (_,_,_)=> CenteredProgressIndicator(),),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 8,),
            ValueListenableBuilder(
              valueListenable: _currentIndex,
              builder: (context, value, _) {
                return Row(
                  mainAxisAlignment: .center,
                  children: [
                    for (int i = 0; i < homeSliderProvider.slide.length; i++)
                      Container(
                        width: 10,
                        height: 10,
                        margin: .only(right: 4),
                        decoration: BoxDecoration(
                          color: value == i ? AppColors.themeColor : null,
                          shape: .circle,
                          border: .all(color: Colors.grey)
                        ),
                      )
                  ],
                );
              }
            )
          ],
        );
      }
    );
  }
}
