import 'package:buzzwords/components/word_list_bottom_sheet.dart';
import 'package:buzzwords/constants/alphabet.dart';
import 'package:flutter/material.dart';

import '../../constants/sample_words.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool cardMode = false;
  TextEditingController searchTextController = TextEditingController();
  List categoriesWithCount = [];

  void getCategoryWordCount() {
    Map<String, int> categoryCounts = {};

    // Count occurrences of each category
    for (var word in sampleWords) {
      String category = word["category"];
      categoryCounts[category] = (categoryCounts[category] ?? 0) + 1;
    }

    // Convert the map into a list of objects
    List finalArray = categoryCounts.entries
        .map((entry) => {"category": entry.key, "wordCount": entry.value})
        .toList();
    categoriesWithCount = finalArray;
    filteredList = finalArray;
  }

  List filteredList = [];
  Widget _buildStatCard(String title, String value, Color color) {
    return Container(
      width: 140,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: color.withOpacity(0.3),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  void _filterList() {
    String query = searchTextController.text.toLowerCase();
    setState(() {
      filteredList = categoriesWithCount
          .where((item) => item["category"].toLowerCase().contains(query))
          .toList();
    });
  }

  void openWordsBottomSheet(alphabet) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return WordListBottomSheet(
          alphabet: alphabet,
          isCategory: cardMode,
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getCategoryWordCount();
    searchTextController.addListener(_filterList);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Search
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(100.0),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchTextController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search...",
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search_outlined,
                  ),
                ),
              ],
            ),
          ),
        ),

        // Stats Cards Row
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
          child: Row(
            children: [
              _buildStatCard('Total Words', '1,234', Colors.amber[700]!),
              const SizedBox(width: 12),
              _buildStatCard('New Today', '24', Colors.green[600]!),
              const SizedBox(width: 12),
              _buildStatCard('Favorites', '56', Colors.orange[700]!),
            ],
          ),
        ),

        // Header
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Text(
                  "Words",
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    cardMode = !cardMode;
                  });
                },
                icon: Icon(
                  cardMode
                      ? Icons.abc_outlined
                      : Icons.calendar_view_day_outlined,
                ),
              ),
            ],
          ),
        ),

        // Words
        cardMode
            ? Container(
                height: MediaQuery.of(context).size.height * 0.7,
                child: ListView.builder(
                  shrinkWrap: true,
                  primary: true,
                  padding: const EdgeInsets.only(bottom: 100.0),
                  itemCount: filteredList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: GestureDetector(
                        onTap: () {
                          openWordsBottomSheet(filteredList[index]["category"]);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15.0,
                            vertical: 10.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.yellow[100]!,
                            border: Border.all(
                              color: Colors.yellow[600]!,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            spacing: 5.0,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    filteredList[index]["category"].toString(),
                                    style: TextStyle(
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                    ),
                                    child: Text(
                                      filteredList[index]["wordCount"]
                                          .toString(),
                                      style: TextStyle(
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            : Container(
                height: MediaQuery.of(context).size.height * 0.7,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 6,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  shrinkWrap: true,
                  primary: true,
                  padding: const EdgeInsets.only(bottom: 100.0),
                  itemCount: alphabet.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        openWordsBottomSheet(alphabet[index]);
                      },
                      child: Container(
                        // padding: const EdgeInsets.symmetric(
                        //   horizontal: 10.0,
                        //   vertical: 5.0,
                        // ),
                        decoration: BoxDecoration(
                          color: Colors.yellow[100]!,
                          border: Border.all(
                            color: Colors.yellow[700]!,
                          ),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          alphabet[index],
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
      ],
    );
  }
}
