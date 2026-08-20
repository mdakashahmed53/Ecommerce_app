import 'package:flutter/material.dart';

class AddReviewScreen extends StatefulWidget {
  const AddReviewScreen({super.key});

  static const String name = 'add_review_screen';

  @override
  State<AddReviewScreen> createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Review'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          spacing: 20,
          children: [
            // const SizedBox(height: 20,),
            TextFormField(
              controller: firstNameController,
              keyboardType: .name,
              decoration: InputDecoration(
                hintText: 'First Name',
                labelText: 'First Name'
              ),
            ),
            TextFormField(
              controller: firstNameController,
              keyboardType: .name,
              decoration: InputDecoration(
                hintText: 'Last Name',
                labelText: 'Last Name'
              ),
            ),
            TextFormField(
              controller: descriptionController,
              keyboardType: .multiline,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Write Review',
                contentPadding: EdgeInsets.all(5)
              ),
            ),

            FilledButton(onPressed: (){}, child: Text('Submit'))
          ],
        ),
      ),
    );
  }
}
