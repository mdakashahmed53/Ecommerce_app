import 'package:ecommerce_app/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:ecommerce_app/features/category/data/category_model.dart';
import 'package:ecommerce_app/features/splash/screens/splash_screen.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/verify_otp_screen.dart';
import 'package:ecommerce_app/features/category/presentation/screens/category_screen.dart';
import 'package:ecommerce_app/features/products/presentation/screens/product_by_category_screen.dart';
import 'package:ecommerce_app/features/products/presentation/screens/product_details_screen.dart';
import 'package:ecommerce_app/features/review/presentation/screens/add_review_screen.dart';
import 'package:ecommerce_app/features/shared/presentation/screens/main_nav_holder_screen.dart';
import 'package:ecommerce_app/features/wishlist/presentation/screens/wishlist_screen.dart';
import 'package:flutter/material.dart';

import '../features/review/presentation/screens/review_screen.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings setting) {
    late Widget widget;
    switch (setting.name) {
      case SplashScreen.name:
        widget = SplashScreen();
      case SignUpScreen.name:
        widget = SignUpScreen();
      case VerifyOTPScreen.name:
        final email = setting.arguments as String;
        widget = VerifyOTPScreen(email: email);
      case SignInScreen.name:
        widget = SignInScreen();
      case MainNavHolderScreen.name:
        widget = MainNavHolderScreen();
      case CategoryScreen.name:
        widget = CategoryScreen();
      case ProductDetailsScreen.name:
        widget = ProductDetailsScreen();
      case WishlistScreen.name:
        widget = WishlistScreen();
      case ReviewScreen.name:
        widget = ReviewScreen();
      case AddReviewScreen.name:
        widget = AddReviewScreen();
      case ProductByCategoryScreen.name:
        final category = setting.arguments as CategoryModel;
        widget = ProductByCategoryScreen( category: category,);
    }
    return MaterialPageRoute(builder: (_) => widget);
  }
}
