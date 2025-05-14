import 'package:buzzwords/constants/sample_words.dart';
import 'package:buzzwords/pages/word_details/word_details.dart';
import 'package:flutter/material.dart';

class WordListBottomSheet extends StatefulWidget {
  const WordListBottomSheet({
    super.key,
    required this.alphabet,
    required this.isCategory,
  });

  final String alphabet;
  final bool isCategory;

  @override
  State<WordListBottomSheet> createState() => _WordListBottomSheetState();
}

class _WordListBottomSheetState extends State<WordListBottomSheet> {
  List currentWords = [];

  void filterBasedOnAlphabetChoice() {
    if (widget.isCategory) {
      currentWords = sampleWords
          .where(
              (item) => item['category'].toString().contains(widget.alphabet))
          .toList();
    } else {
      currentWords = sampleWords
          .where((item) => item['word'].toString().startsWith(widget.alphabet))
          .toList();
    }
  }

  @override
  void initState() {
    super.initState();
    filterBasedOnAlphabetChoice();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 10.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Words...",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    currentWords.length.toString(),
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
            currentWords.isEmpty
                ? Container(
                    padding: EdgeInsets.only(top: 60.0),
                    child: Center(
                      child: Text(
                        "No Buzzword!",
                      ),
                    ),
                  )
                : Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: ListView.builder(
                        padding: EdgeInsets.only(top: 10.0),
                        itemCount: currentWords.length,
                        itemBuilder: (contex, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5.0,
                              horizontal: 10.0,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => WordDetails(
                                      currentWord: currentWords[index],
                                    ),
                                  ),
                                );
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      currentWords[index]['word'],
                                      style: TextStyle(
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    Text(
                                      'by: ${currentWords[index]['submittedBy']}',
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    Text(
                                      '${DateTime.parse(currentWords[index]['dateTime'].toString()).day} • ${DateTime.parse(currentWords[index]['dateTime'].toString()).month} • ${DateTime.parse(currentWords[index]['dateTime'].toString()).year}',
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
          ],
        ),
      ),
    );
  }
}
