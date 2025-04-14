import 'package:easy_eat/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:easy_eat/models/ads_model.dart';
import 'package:easy_eat/models/foodStall_model.dart';

import 'package:easy_eat/static/navigation_route.dart';

import 'package:easy_eat/widgets/home/ads_card_widget.dart';
import 'package:easy_eat/widgets/home/stall_card_widget.dart';
import 'package:easy_eat/widgets/home/welcome_text_widget.dart';
import 'package:easy_eat/widgets/home/search_bar_widget.dart';
import 'package:easy_eat/widgets/home/category_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _selectedCategory;
  List<Foodstall> _filteredFoodStalls = [];

  @override
  void initState() {
    super.initState();
    _filteredFoodStalls = foodstallList; // Initiarlize with all stalls
  }

  void _filterFoodStalls(String? category) {
    setState(() {
      _selectedCategory = category;
      if (category == null) {
        _filteredFoodStalls = foodstallList;
      } else {
        _filteredFoodStalls = foodstallList.where((stall) => stall.category == category).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WelcomeTextWidget(
                onTap: () => Navigator.pushNamed(
                  context,
                  NavigationRoute.cartRoute.name,
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: SearchBarWidget(),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "Pesan Sekarang",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'SF-Pro',
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 200,
                    viewportFraction: 1.0,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                  ),
                  items: adsList.map((ads) {
                    return Builder(
                      builder: (BuildContext context) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: AdsCardWidget(ads: ads, onTap: () {}),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),

              // Category Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CategoryWidget(
                  onCategorySelected: _filterFoodStalls,
                ),
              ),
            ],
          ),
        ),
      ),
      Consumer<HomeProvider>(
        builder: (context, homeProvider, child) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final stall =
                    homeProvider.stallList[index]; // Akses via provider
                return StallCardWidget(
                  stall: stall,
                  onTap: () {
                    Navigator.pushNamed(
                        context, NavigationRoute.detailRoute.name,
                        arguments: stall);
                  },
                );
              },
              childCount: homeProvider.stallList.length, // Akses via provider
            ),
          );
        },
      ),
      SliverToBoxAdapter(child: SizedBox(height: 50))
    ],
  );

}

// Replace the function with the StatefulWidget in your main widget tree
Widget homePage(context, controller) {
  return HomePage();
}