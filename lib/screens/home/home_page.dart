import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_eat/providers/home_provider.dart';
import 'package:flutter/material.dart';

import 'package:easy_eat/models/ads_model.dart';
import 'package:easy_eat/models/foodStall_model.dart';

import 'package:easy_eat/static/navigation_route.dart';

import 'package:easy_eat/widgets/home/ads_card_widget.dart';
import 'package:easy_eat/widgets/home/stall_card_widget.dart';
import 'package:easy_eat/widgets/home/welcome_text_widget.dart';
import 'package:easy_eat/widgets/home/search_bar_widget.dart';
import 'package:easy_eat/widgets/home/category_widget.dart';
import 'package:provider/provider.dart';

Widget homePage(context, controller) {
  return CustomScrollView(
    slivers: [
      SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WelcomeTextWidget(
                onTap: () => Navigator.pushNamed(
                    context, NavigationRoute.cartRoute.name)),
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
                    fontFamily: 'SF-Pro'),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 210,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CategoryWidget(),
            ),
          ],
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
