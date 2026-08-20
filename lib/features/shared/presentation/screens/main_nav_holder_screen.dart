import 'package:ecommerce_app/app/app_colors.dart';
import 'package:ecommerce_app/features/cart/presentation/cart_screen.dart';
import 'package:ecommerce_app/features/category/presentation/screens/category_screen.dart';
import 'package:ecommerce_app/features/home/presentation/screens/home_screen.dart';
import 'package:ecommerce_app/features/shared/presentation/providers/main_nav_holder_provider.dart';
import 'package:ecommerce_app/features/wishlist/presentation/screens/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainNavHolderScreen extends StatefulWidget {
  const MainNavHolderScreen({super.key});

  static const String name = "/main-nav-holder";

  @override
  State<MainNavHolderScreen> createState() => _MainNavHolderScreenState();
}



class _MainNavHolderScreenState extends State<MainNavHolderScreen> {

  List<Widget> _screens = [
   HomeScreen(),
   CategoryScreen(),
    CartScreen(),
    WishlistScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MainNavHolderProvider>(
      builder: (context, mainNavProvider, _) {
        return Scaffold(
          body: _screens[mainNavProvider.selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: mainNavProvider.selectedIndex,
              onTap: mainNavProvider.changeIndex,
              selectedItemColor: AppColors.themeColor,
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: true,
              items: [
            BottomNavigationBarItem(icon: Icon(Icons.home,), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.dashboard,), label: 'Categories'),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined,), label: 'Carts'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite,), label: 'Wishlist'),
          ]),
        );
      }
    );
  }
}
