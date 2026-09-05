import 'package:ecommerce_app/features/products/data/product_model.dart';
import 'package:ecommerce_app/features/shared/presentation/widgets/centered_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/review_screen_provider.dart';
import '../widgets/review_add_card_bottom_section.dart';
import '../widgets/review_card.dart';
import 'add_review_screen.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key, required this.productId, });

  final String productId;

  static const String name = 'review_screen';

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {

  final ReviewListProvider _reviewListProvider = ReviewListProvider();


  void onTapAddReviewButton(){
    Navigator.pushNamed(context, AddReviewScreen.name);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _reviewListProvider.getReviewListByProduct(widget.productId);
  }


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _reviewListProvider,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Reviews'),
        ),
        body: Consumer<ReviewListProvider>(
          builder: (context,_,_) {
            
            if(_reviewListProvider.initialLoading){
              return CenteredProgressIndicator();
            }
            
            if(_reviewListProvider.review.isEmpty){
              return Center(child: Text('No Reviews'),);
            }
            
            
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ListView.builder(
                  itemCount: _reviewListProvider.review.length,
                  itemBuilder: (context, index){
                return ReviewCard(reviewModel: _reviewListProvider.review[index],);
              }),
            );
          }
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ReviewAddCardSection(onTap: onTapAddReviewButton,),
        ),
      ),
    );


  }
}

