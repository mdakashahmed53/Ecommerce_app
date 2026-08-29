import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/features/shared/presentation/widgets/centered_progress_indicator.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/app_constant.dart';
import '../../../products/data/product_model.dart';
import '../../../products/presentation/screens/product_details_screen.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductDetailsScreen.name, arguments: product.id);
      },
      child: SizedBox(
        width: 140,
        child: Card(
          color: Colors.white,
          shadowColor: AppColors.themeColor.withAlpha(30),
          elevation: 3,
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.themeColor.withAlpha(20),
                  borderRadius: .only(
                    topLeft: .circular(8),
                    topRight: .circular(8),
                  ),
                ),
                child: Padding(
                  padding: const .all(8),
                  child: Center(
                    child: CachedNetworkImage(
                      imageUrl: product.photos[0],
                      errorWidget: (_, _, _) => Icon(Icons.error),
                      progressIndicatorBuilder: (_, _, _) =>
                          CenteredProgressIndicator(),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(6),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      product.title,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: .w500,
                        color: Colors.black54,
                        overflow: .ellipsis,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text(
                          '${Constants.takaSign}${product.currentPrice}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: .w500,
                            color: AppColors.themeColor,
                          ),
                        ),
                        Wrap(
                          children: [
                            Icon(Icons.star, size: 20, color: Colors.amber),
                            Text(product.rating.toString()),
                          ],
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: .circular(4),
                          ),
                          color: AppColors.themeColor,
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Icon(
                              Icons.favorite_border,
                              size: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
