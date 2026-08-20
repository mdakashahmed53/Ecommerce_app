import 'package:ecommerce_app/app/asset_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget{
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: SvgPicture.asset(AssetPaths.logoNavSvg),
      actions: [
        _buildIconButton(icon: Icons.person, onTap: () {  }),
        const SizedBox(width: 8,),
        _buildIconButton(icon: Icons.call, onTap: () {  }),
        const SizedBox(width: 8,),
        _buildIconButton(icon: Icons.notifications_active_rounded, onTap: () {  }),
        const SizedBox(width: 8,),
      ],
    );
  }

  Widget _buildIconButton({required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 18,
            backgroundColor: Colors.grey.withAlpha(40),
            child: Icon(icon, color: Colors.grey, size: 20,),
    ));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
