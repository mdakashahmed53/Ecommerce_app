import 'package:ecommerce_app/features/products/presentation/widgets/product_details/color_picker.dart';
import 'package:ecommerce_app/features/products/presentation/widgets/product_details/price_and_add_to_cart_section.dart';
import 'package:ecommerce_app/features/products/presentation/widgets/product_details/product_image_carousel.dart';
import 'package:ecommerce_app/features/products/presentation/widgets/product_details/size_picker.dart';
import 'package:ecommerce_app/features/review/presentation/screens/review_screen.dart';
import 'package:ecommerce_app/features/shared/presentation/widgets/inc_dec_button.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  static const String name = 'product_details';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Details')),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const ProductImageCarousel(),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Expanded(
                              child: Text(
                                'Happy New Year Special Deal Save 30%',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 80,
                              child: IncDecButton(
                                initialValue: 1,
                                onChange: (int value) {},
                                maxValue: 5,
                                minValue: 1,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.star, size: 24, color: Colors.amber),
                            const SizedBox(width: 4),
                            const Text('4.5', style: TextStyle(fontSize: 18)),
                            const SizedBox(width: 8),
                            TextButton(
                              onPressed: _onTapReviewButton,
                              child: const Text(
                                'Reviews',
                                style: TextStyle(
                                  color: AppColors.themeColor,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              color: AppColors.themeColor,
                              child: const Padding(
                                padding: EdgeInsets.all(2.0),
                                child: Icon(
                                  Icons.favorite_border,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Color',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ColorPicker(
                          colors: const ['Red', 'Black', 'Blue', 'Grey'],
                          onChange: (String selectedColor) {},
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Size',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizePicker(
                          sizes: const ['S', 'M', 'L', 'XL'],
                          onChange: (String selectedSize) {},
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since 1966, when designers at Letraset and James Mosley, the librarian at St Bride Printing Library in London''',
                          style: TextStyle(color: Colors.black54, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const PriceAndAddToCartSection(),
        ],
      ),
    );
  }

  void _onTapReviewButton() {
    Navigator.pushNamed(context, ReviewScreen.name);
  }
}