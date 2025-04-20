  import 'package:flutter/material.dart';

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
        "nim": "2307411030",
        "class": "TI-4B",
        "title": "Programmer",
        "about": "he a dawg",
        "image": "assets/images/muhammad.jpeg"
      },
      {
        "name": "Naesya Qonitha",
        "nim": "2307411037",
        "class": "TI-4B",
        "title": "UI/UX Designer",
        "about": "I'm going to Japan bozos, mark my words. マジで日本へいこうつもりだよ",
        "image": "assets/images/nace.jpg"
      },
      {
        "name": "Farrel Jazirah Ramadhan",
        "nim": "2307411060",
        "class": "TI-4B",
        "title": "UI/UX Designer",
        "about": "uhh idk.",
        "image": "assets/images/farrel.jpg"
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
        appBar: AppBar(
          title: Text("Pofile"),
          centerTitle: true,
          actions: [],
        ),
        body: Container(
          color: Color(0xFF444350),
          child: Stack(
            children: [
              PageView.builder(
                controller: _pageController,
                physics: NeverScrollableScrollPhysics(),
                itemCount: profiles.length,
                itemBuilder: (context, index) {
                  final profile = profiles[index];
                  return Stack(
                    children: [
                      // Background Image
                      SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height,
                        child: Opacity(
                          opacity: 0.5,
                          child: Image.asset(
                            profile["image"]!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      // Draggable Content
                      DraggableScrollableSheet(
                        initialChildSize: 0.3, // Initial height (50% of screen)
                        minChildSize: 0.3, // Minimum height (30% of screen)
                        maxChildSize: 0.8, // Maximum height (80% of screen)
                        builder: (context, scrollController) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(32),
                              ),
                            ),
                            child: SingleChildScrollView(
                              controller: scrollController,
                              child: Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Profile Info
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          profile["name"]!,
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(profile["nim"]!,
                                                style: TextStyle(fontSize: 12)),
                                            Text(profile["class"]!,
                                                style: TextStyle(fontSize: 12)),
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
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    SizedBox(height: 8),
                                    Text(
                                      profile["about"]!,
                                      style: TextStyle(color: Colors.grey[700]),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
              // Navigation Arrows
              if (currentIndex > 0)
                Positioned(
                  left: 16,
                  top: MediaQuery.of(context).size.height / 2 - 24,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () => goToPage(currentIndex - 1),
                  ),
                ),

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
