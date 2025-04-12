import 'package:easy_eat/models/foodStall_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';

import 'package:easy_eat/screens/main/main_screen.dart';
import 'package:easy_eat/screens/stall/stall_page.dart';

import 'package:easy_eat/static/navigation_route.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
      initialRoute: NavigationRoute.mainRoute.name,
      routes: {
        NavigationRoute.mainRoute.name: (context) => MainScreen(),
        NavigationRoute.detailRoute.name: (context) => StallPage(
              foodStall:
                  ModalRoute.of(context)?.settings.arguments as Foodstall,
            ),
      },
    );
  }
}
