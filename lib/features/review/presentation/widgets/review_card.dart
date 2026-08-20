import 'package:flutter/material.dart';

import '../../../../app/exentension/utility.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
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
                child: Icon(Icons.person, color: Colors.grey, size: 28),
              ),
              title: Text(
                'Md. Akash Ahmed',
                style: context.textTheme.titleLarge,
              ),
            ),
            ListTile(
              title: Text(
                '''Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator''',
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
