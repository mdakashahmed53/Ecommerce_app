import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/features/review/data/models/review_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/exentension/utility.dart';
import '../../../shared/presentation/widgets/centered_progress_indicator.dart';
import '../providers/review_screen_provider.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key, required this.reviewModel});

  final ReviewModel reviewModel;

  @override
  Widget build(BuildContext context) {
    return Consumer<ReviewListProvider>(
      builder: (context, reviewListProvider, _) {
        return Card(
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.grey.withAlpha(40),
                    child: CachedNetworkImage(
                      imageUrl: reviewModel.avatarUrl,
                      width: 48,
                      height: 48,

                      errorWidget: (_,_,_)=> Icon(Icons.person, size: 28),
                      progressIndicatorBuilder: (_,_,_)=> CenteredProgressIndicator(),
                    ),
                  ),
                  title: Text(
                    '${reviewModel.firstName} ${reviewModel.lastName}',
                    style: context.textTheme.titleLarge,
                  ),
                ),
                ListTile(
                  title: Text(
                    reviewModel.comment,
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
