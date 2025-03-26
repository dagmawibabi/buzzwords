import 'package:buzzwords/pages/ai_page/ai_page.dart';
import 'package:buzzwords/pages/homepage/homepage.dart';
import 'package:buzzwords/pages/submit_page/submit_page.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class ParentPage extends StatefulWidget {
  const ParentPage({super.key});

  @override
  State<ParentPage> createState() => _ParentPageState();
}

class _ParentPageState extends State<ParentPage> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Buzzwords",
        ),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.yellow[100],
            child: Text("H"),
          ),
          SizedBox(
            width: 10.0,
          )
        ],
      ),
      body: ListView(
        primary: true,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        children: [
          currentPage == 0
              ? Homepage()
              : currentPage == 1
                  ? SubmitPage()
                  : AIPage(),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Icon(
      //     Icons.add,
      //   ),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle_outline,
            ),
            label: "Submit",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Ionicons.sparkles_outline,
            ),
            label: "AI",
          ),
        ],
      ),
    );
  }
}
