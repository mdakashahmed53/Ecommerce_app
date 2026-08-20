import 'package:flutter/material.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: .search,
      onChanged: (String? value){},
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        hintText: 'Search',
        fillColor: Colors.grey.withAlpha(50),
        filled: true,
        border: _buildOutlineInputBorder(),
        focusedBorder: _buildOutlineInputBorder(),
        enabledBorder: _buildOutlineInputBorder()
      ),
    );
  }

  OutlineInputBorder _buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderRadius: .circular(8),
        borderSide: BorderSide.none
      );
  }
}
