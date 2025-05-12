import 'package:buzzwords/pages/homepage/homepage.dart';
import 'package:buzzwords/pages/onboarding/onboarding_options.dart';
import 'package:buzzwords/pages/parent_page/parent_page.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  var currentOptionPage = 0;
  List pages = [
    {
      "title": "Which option represents you?",
      "subtitle": "Select your gender",
      "options": [
        "Female",
        "Male",
      ],
    },
    {
      "title": "How Old Are You?",
      "subtitle": "Select your age",
      "options": [
        "10 to 20",
        "20 to 30",
        "30 to 40",
        "40 to 50",
        "50 to 60",
        "60+",
      ],
    },
    {
      "title": "Do you have a specific goal in mind?",
      "subtitle": "Select your goal",
      "options": [
        "Enhance my lexicon",
        "Contribute more buzz words",
        "Use for reference",
      ],
    },
  ];

  void changePageBack() {
    setState(() {
      if (currentOptionPage > 0) {
        currentOptionPage--;
      }
    });
  }

  void changePageForward() {
    setState(() {
      if (currentOptionPage < pages.length - 1) {
        currentOptionPage++;
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          OnboardingOptions(
            title: pages[currentOptionPage]["title"],
            subtitle: pages[currentOptionPage]["subtitle"],
            options: pages[currentOptionPage]["options"],
          ),
          SizedBox(height: 10.0),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  changePageBack();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 30.0,
                  ),
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    // color: Colors.greenAccent,
                    border: Border.all(
                      color: Colors.grey[500]!,
                    ),
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  child: Text(
                    "Back",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (currentOptionPage == pages.length - 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ParentPage(),
                        ),
                      );
                    }
                    changePageForward();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 30.0,
                    ),
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      border: Border.all(
                        color: Colors.grey[500]!,
                      ),
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: Text(
                      "Next",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
