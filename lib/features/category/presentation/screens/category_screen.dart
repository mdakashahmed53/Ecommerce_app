import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/presentation/providers/main_nav_holder_provider.dart';
import '../../../shared/presentation/widgets/category_item.dart';
import '../../../shared/presentation/widgets/centered_progress_indicator.dart';
import '../providers/category_list_provider.dart';


class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  static const String name = "/category-screen";

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late final CategoryListProvider _categoryListProvider;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _categoryListProvider = context.read<CategoryListProvider>();
    _categoryListProvider.getCategoryList();
    _scrollController.addListener(_loadMore);
  }

  void _loadMore() {
    // লোড মোর লজিক
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      if (!_categoryListProvider.isLoading) {
        _categoryListProvider.getCategoryList();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        _backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Category'),
          leading: IconButton(
            onPressed: _backToHome,
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Consumer<CategoryListProvider>(
          builder: (context, categoryListProvider, _) {
            if (categoryListProvider.initialLoading) {
              return const CenteredProgressIndicator();
            }

            if (categoryListProvider.category.isEmpty) {
              return const Center(child: Text("No categories found."));
            }

            return Column(
              children: [
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      categoryListProvider.refreshCategoryList();
                    },
                    child: GridView.builder(
                      controller: _scrollController,
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(12),
                      itemCount: categoryListProvider.category.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.7, // উচ্চতা বাড়িয়ে ওভারফ্লো কমানো হয়েছে
                      ),
                      itemBuilder: (context, index) {
                        return CategoryItem(
                          category: categoryListProvider.category[index],
                        );
                      },
                    ),
                  ),
                ),

                if (categoryListProvider.loadingMore)
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: LinearProgressIndicator(),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _backToHome() {
    context.read<MainNavHolderProvider>().backToHome();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
