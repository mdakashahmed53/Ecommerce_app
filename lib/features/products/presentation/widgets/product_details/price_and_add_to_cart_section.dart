import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../app/app_colors.dart';
import '../../../../../app/app_constant.dart';
import '../../provider/product_details_provider.dart';

class PriceAndAddToCartSection extends StatelessWidget {
  const PriceAndAddToCartSection({super.key});

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
                  child: FilledButton(onPressed: (){}, child: Text('Add to Cart')))
            ],
          ),
        );
      }
    );
  }
}
