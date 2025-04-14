import 'package:flutter/material.dart';
import 'package:easy_eat/static/navigation_route.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  final List<Map<String, String>> profiles = [
    {
      "name": "Muhammad",
      "nim": "2307411036",
      "class": "TI-4B",
      "title": "Programmer",
      "about": "he a dawg",
      "image": "assets/images/ads-1.jpg"
    },
    {
      "name": "Nace",
      "nim": "2307411037",
      "class": "TI-4B",
      "title": "UI/UX Designer",
      "about": "I'm going to Japan bozos, mark my words. マジで日本へいこうつもりだよ",
      "image": "assets/images/ads-1.jpg"
    },
    {
      "name": "Parel",
      "nim": "2307411037",
      "class": "TI-4B",
      "title": "UI/UX Designer",
      "about": "uhh idk.",
      "image": "assets/images/ads-1.jpg"
    },
  ];

  void goToPage(int index) {
    if (index >= 0 && index < profiles.length) {
      setState(() {
        currentIndex = index;
      });
      _pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF444350),
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(), // disable swipe gesture
              itemCount: profiles.length,
              itemBuilder: (context, index) {
                final profile = profiles[index];
                return SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 400,
                            child: Opacity(
                              opacity: 0.5,
                              child: Image.asset(
                                profile["image"]!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 40,
                            left: 16,
                            child: Icon(Icons.arrow_back, color: Colors.white),
                          ),
                          Positioned(
                            top: 40,
                            right: 16,
                            child: Icon(Icons.shopping_cart_outlined, color: Colors.white),
                          ),
                          
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Name and NIM
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  profile["name"]!,
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(profile["nim"]!, style: TextStyle(fontSize: 12)),
                                    Text(profile["class"]!, style: TextStyle(fontSize: 12)),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Text(
                              profile["title"]!,
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            SizedBox(height: 16),
                            Text(
                              "About",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Text(
                              profile["about"]!,
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                            SizedBox(height: 50),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                );
              },
            ),

            // Left arrow
            if (currentIndex > 0)
              Positioned(
                left: 16,
                top: MediaQuery.of(context).size.height / 2 - 24,
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: () => goToPage(currentIndex - 1),
                ),
              ),

            // Right arrow
            if (currentIndex < profiles.length - 1)
              Positioned(
                right: 16,
                top: MediaQuery.of(context).size.height / 2 - 24,
                child: IconButton(
                  icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
                  onPressed: () => goToPage(currentIndex + 1),
                ),
              ),
          ],
        ),
      ),
    );
  }
}