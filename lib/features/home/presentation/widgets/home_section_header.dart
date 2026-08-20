import 'package:flutter/material.dart';

import '../../../../app/exentension/utility.dart';

class HomeSectionHeader extends StatelessWidget {
  const HomeSectionHeader({
    super.key, required this.sectionTitle, required this.onTapSeeAll,
  });

  final String sectionTitle;
  final VoidCallback onTapSeeAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Text(sectionTitle, style: context.textTheme.titleLarge,),
        TextButton(onPressed: onTapSeeAll, child: Text('See All'))

      ],
    );
  }
}