import 'package:ecommerce_app/features/shared/presentation/widgets/centered_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../app/app_colors.dart';
import '../../../../../app/app_constant.dart';
import '../../../../cart/providers/add_to_cart_provider.dart';
import '../../provider/product_details_provider.dart';

class PriceAndAddToCartSection extends StatelessWidget {
  const PriceAndAddToCartSection({super.key, required this.addToCat});

  final VoidCallback addToCat;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductDetailsProvider>(
      builder: (context, productDetails,_) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.themeColor.withAlpha(30),
            borderRadius: .only(topLeft: .circular(16,), topRight: .circular(16)),

          ),
          padding: .all(16),
          child: Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Column(
                crossAxisAlignment: .start,
                mainAxisSize: .min,
                children: [
                  Text('Price ', style: TextStyle(fontWeight: .w600),),
                  Text('${Constants.takaSign}${productDetails.productDetails!.currentPrice}', style: TextStyle(
                      fontSize: 20,
                      fontWeight: .w600,
                      color: AppColors.themeColor
                  ),),

                ],
              ),
              SizedBox(
                  width: 120,
                  child: Consumer<AddToCartProvider>(
                    builder: (context, addToCartProvider, _) {

                      if(addToCartProvider.isLoading){
                        return CenteredProgressIndicator();
                      }

                      return FilledButton(onPressed: addToCat, child: Text('Add to Cart'));
                    }
                  ))
            ],
          ),
        );
      }
    );
  }
}
