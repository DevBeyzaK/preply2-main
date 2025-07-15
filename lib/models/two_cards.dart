import 'package:flutter/material.dart';

class TwoCards extends StatelessWidget {
  const TwoCards({super.key});

  final List<Map<String, dynamic>> cardData = const [
    {
      'title': 'Take a trial lesson',
      'percent': 30,
    },
    {
      'title': 'Subscribe after trial lesson',
      'percent': 50,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: cardData.map((item) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Card(
            color: Colors.white,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.grey.shade300,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['title'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${item['percent']}%',
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
