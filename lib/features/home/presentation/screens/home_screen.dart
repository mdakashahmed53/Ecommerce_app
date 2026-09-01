import 'package:ecommerce_app/features/home/presentation/widgets/home_app_bar.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/home_carouel_slider.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/home_category_section.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/home_product_section.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/home_search_bar.dart';
import 'package:ecommerce_app/features/products/presentation/screens/product_by_category_screen.dart';
import 'package:ecommerce_app/features/shared/presentation/providers/main_nav_holder_provider.dart';
import 'package:ecommerce_app/features/shared/presentation/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../products/presentation/provider/product_list_provider.dart';
import '../widgets/home_section_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String name = '/home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const .symmetric(horizontal: 16),
          child: Column(
            children: [
              HomeSearchBar(),
              const SizedBox(height: 16,),
              HomeCarouselSlider(),
              const SizedBox(height: 12,),
              HomeSectionHeader(sectionTitle: 'All Categories', onTapSeeAll: () {
                context.read<MainNavHolderProvider>().moveToCategory();
              },),

              HomeCategorySection(),

              HomeSectionHeader(sectionTitle: 'Popular', onTapSeeAll: _navigateToProductByCategory),

              Consumer<ProductListProvider>(
                builder: (context, productListProvider,_) {
                  final product = productListProvider.products;
                  return HomeProductSection(products: product,);
                }
              ),
              const SizedBox(height: 10,),
              HomeSectionHeader(sectionTitle: 'Special', onTapSeeAll: (){}),

              HomeProductSection(products: [],),
              const SizedBox(height: 10,),
              HomeSectionHeader(sectionTitle: 'New', onTapSeeAll: (){}),

              HomeProductSection(products: [],),


            ],
          ),
        ),
      ),
    );
  }

  void _navigateToProductByCategory(){
    Navigator.pushNamed(context, ProductByCategoryScreen.name);
  }



}



