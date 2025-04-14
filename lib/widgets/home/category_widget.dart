import 'package:easy_eat/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryWidget extends StatefulWidget {
  CategoryWidget({Key? key}) : super(key: key);

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  final List<String> categories = [
    'Clear filter',
    'Per-nasi-an',
    'Aneka mie',
    'Makanan kuah',
    'Minuman',
    'Snack'
  ];
  int selectedIndex = 0;

  String? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    return Container(
      height: 31,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              homeProvider.setFilter(categories[index]);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: index == selectedIndex
                      ? Color(0xFFD9D9D9)
                      : Color.fromRGBO(255, 255, 246, 1),
                  border: Border.all(
                    // <-- Ini yang menambahkan border
                    color: index == selectedIndex
                        ? Color(0xFFD9D9D9)
                        : Colors.black45, // Warna hitam
                    width: 0.5, // Ketebalan border
                  ),
                  borderRadius: BorderRadius.circular(
                      40), // BorderRadius juga perlu di sini
                ),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                // color: Color.fromRGBO(255, 255, 246, 1),
                child: Center(
                  child: Text(
                    categories[index],
                    style: TextStyle(
                        fontFamily: 'SF-Pro',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: index == selectedIndex
                            ? Colors.grey
                            : Colors.black),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
