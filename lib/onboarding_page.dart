import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wtf_new_project/custom_indicator.dart';
import 'package:wtf_new_project/model/onboarding_item.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int activeIndex = 0;

  List<OnboardingItems> items = [
    OnboardingItems(
      title: "Welcome to MediCall",
      subtitle:
          "Quickly find and request ambulances from nearby hospitals during emergencies.",
      asset: "assets/Onboarding_Image.jpg",
    ),

    OnboardingItems(
      title: "Get emergency medical help fast",
      subtitle:
          "Wherever you are, Need urgent help? We'll connect you to the nearerst available hsopital",
      asset: "assets/Onboarding_Image.jpg",
    ),

    OnboardingItems(
      title: "We are just one step away to your safety",
      subtitle:
          "Instant access to nearby hospitals and ambulances — when every second counts. We got you covered!",
      asset: "assets/Onboarding_Image.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var OnboardingItemToShow = items[activeIndex];

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 8,
        children: [
          CustomIndicator(
            indicatorCount: items.length,
            activeIndex: activeIndex,
          ),
          Image.asset(OnboardingItemToShow.asset, width: 400, height: 400),
          Text(
            OnboardingItemToShow.title,
            style: GoogleFonts.aDLaMDisplay(
              fontWeight: FontWeight.w600,
              fontSize: 32,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            OnboardingItemToShow.subtitle,
            style: GoogleFonts.k2d(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed("/login");
              },
              child: Text("Skip"),
            ),

            Row(
              children: [
                activeIndex <= 0
                    ? SizedBox(height: 0, width: 0)
                    : ElevatedButton(
                        onPressed: () {
                          setState(() {
                            activeIndex = activeIndex - 1;
                          });
                        },
                        child: Text("Back"),
                      ),
                ElevatedButton(
                  onPressed: () {
                    if (activeIndex < items.length - 1) {
                      setState(() {
                        activeIndex = activeIndex + 1;
                      });
                    } else {
                      Navigator.of(context).pushReplacementNamed("/login");
                    }
                  },
                  child: Text("Next"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

