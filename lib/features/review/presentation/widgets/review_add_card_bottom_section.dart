import 'package:flutter/material.dart';

import '../../../../../app/app_colors.dart';

class ReviewAddCardSection extends StatelessWidget {
  const ReviewAddCardSection({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
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
              Text('Review (1000) ', style: TextStyle(fontWeight: .w600, color: Colors.black54),),


            ],
          ),
          FloatingActionButton(onPressed: onTap, child: Icon(Icons.add),)
        ],
      ),
    );



  }




}
