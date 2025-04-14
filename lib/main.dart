import 'package:easy_eat/models/foodStall_model.dart';
import 'package:easy_eat/providers/activity_provider.dart';
import 'package:easy_eat/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';
import 'package:easy_eat/screens/login/login_screen.dart';

import 'package:easy_eat/screens/main/main_screen.dart';
import 'package:easy_eat/screens/stall/stall_page.dart';
import 'package:easy_eat/screens/cart/cart_page.dart';
import 'package:easy_eat/screens/profile/profile_screen.dart';

import 'package:easy_eat/static/navigation_route.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => ActivityProvider()),
        ChangeNotifierProvider(create: (context) => HomeProvider()),
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
      home: LoginScreen(),
      initialRoute: NavigationRoute.loginRoute.name,
      routes: {
        NavigationRoute.mainRoute.name: (context) => MainScreen(),
        NavigationRoute.loginRoute.name: (context) => LoginScreen(),
        NavigationRoute.detailRoute.name: (context) => StallPage(
              foodStall:
                  ModalRoute.of(context)?.settings.arguments as Foodstall,
            ),
        NavigationRoute.cartRoute.name: (context) => CartPage(),
        NavigationRoute.profileRoute.name: (context) => ProfilePage(),
        NavigationRoute.profileRoute.name: (context) => ProfilePage(),
      },
    );
  }
}
