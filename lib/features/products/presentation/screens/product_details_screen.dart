import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/app_colors.dart';
import '../../../review/presentation/screens/review_screen.dart';
import '../../../shared/presentation/widgets/centered_progress_indicator.dart';
import '../../../shared/presentation/widgets/inc_dec_button.dart';
import '../provider/product_details_provider.dart';
import '../widgets/product_details/color_picker.dart';
import '../widgets/product_details/price_and_add_to_cart_section.dart';
import '../widgets/product_details/product_image_carousel.dart';
import '../widgets/product_details/size_picker.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  static const String name = 'product_details';

  final String productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {

  final ProductDetailsProvider _productDetailsProvider = ProductDetailsProvider();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _productDetailsProvider.getProductDetails(widget.productId);

  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _productDetailsProvider,
      child: Scaffold(
        appBar: AppBar(title: const Text('Product Details')),
        body: Consumer<ProductDetailsProvider>(
          builder: (context, productDetailsProvider,_) {

            if(productDetailsProvider.isLoading){
              return const CenteredProgressIndicator();
            }





          final productDetails = productDetailsProvider.productDetails;


            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                         ProductImageCarousel(image: productDetailsProvider.productDetails.photos,),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      productDetails.title,
                                      style: const TextStyle(
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
                                colors: productDetails.colors,
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
                                sizes: productDetails.sizes,
                                onChange: (String selectedSize) {},
                              ),
                              const SizedBox(height: 16),
                               Text(productDetails.description,
                                style: TextStyle(color: Colors.black54, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                 PriceAndAddToCartSection(),
              ],
            );
          }
        ),
      ),
    );
  }

  void _onTapReviewButton() {
    Navigator.pushNamed(context, ReviewScreen.name);
  }
}