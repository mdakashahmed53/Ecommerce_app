import 'package:ecommerce_app/app/app_colors.dart';
import 'package:ecommerce_app/app/exentension/utility.dart';
import 'package:flutter/material.dart';

import '../widgets/review_add_card_bottom_section.dart';
import '../widgets/review_card.dart';
import 'add_review_screen.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  static const String name = 'review_screen';

  @override
  Widget build(BuildContext context) {

    void onTapAddReviewButton(){
      Navigator.pushNamed(context, AddReviewScreen.name);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Reviews'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ListView.builder(
            itemCount: 15,
            itemBuilder: (context, index){
          return ReviewCard();
        }),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ReviewAddCardSection(onTap: onTapAddReviewButton,),
      ),
    );


  }



}

