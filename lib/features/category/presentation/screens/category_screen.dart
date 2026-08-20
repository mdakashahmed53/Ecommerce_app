import 'package:ecommerce_app/features/shared/presentation/providers/main_nav_holder_provider.dart';
import 'package:ecommerce_app/features/shared/presentation/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  static const String name = "/category-screen";


  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_,_){
        _backToHome();
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Category'),leading: IconButton(onPressed: (){
          _backToHome();
        }, icon: Icon(Icons.arrow_back_ios)),),
        body: GridView.builder(
          itemCount: 10,

            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, mainAxisSpacing: 10), itemBuilder: (context, index){
          return FittedBox(child: CategoryItem(title: 'Electronics', icon: Icons.computer));
        }),
      ),
    );
  }

  void _backToHome(){
    context.read<MainNavHolderProvider>().backToHome();
  }
}
