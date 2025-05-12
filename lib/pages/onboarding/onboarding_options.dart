import 'package:flutter/material.dart';

class OnboardingOptions extends StatefulWidget {
  const OnboardingOptions({
    super.key,
    required this.title,
    required this.subtitle,
    required this.options,
  });

  final String title;
  final String subtitle;
  final List options;

  @override
  State<OnboardingOptions> createState() => _OnboardingOptionsState();
}

class _OnboardingOptionsState extends State<OnboardingOptions> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Text(
              widget.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            widget.subtitle,
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(height: 25.0),
          ListView.builder(
            shrinkWrap: true,
            itemCount: widget.options.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 30.0,
                ),
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: selectedIndex == index
                      ? Colors.greenAccent
                      : Colors.white,
                  border: Border.all(
                    color: Colors.grey[500]!,
                  ),
                  borderRadius: BorderRadius.circular(100.0),
                ),
                child: Text(
                  widget.options[index],
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
