import 'package:flutter/material.dart';

class Periodyataycards extends StatelessWidget {
  final int selectedDays;
  const Periodyataycards({Key? key, required this.selectedDays}) : super(key: key);

  final Map<int, List<Map<String, dynamic>>> dataByDays = const {
    90: [
      {'title': 'Earnings', 'value': '\$638', 'percent': 235},
      {'title': 'Lessons', 'value': '118', 'percent': 174},
      {'title': 'Active students', 'value': '22', 'percent': 57},
      {'title': 'New Students', 'value': '7', 'percent': -30},
    ],
    30: [
      {'title': 'Earnings', 'value': '\$239', 'percent': 17},
      {'title': 'Lessons', 'value': '32', 'percent': -17},
      {'title': 'Active students', 'value': '7', 'percent': -53},
      {'title': 'New Students', 'value': '0', 'percent': -100},
    ],
    7: [
      {'title': 'Earnings', 'value': '\$50', 'percent': -14},
      {'title': 'Lessons', 'value': '6', 'percent': -25},
      {'title': 'Active students', 'value': '4', 'percent': 0},
      {'title': 'New students', 'value': '0', 'percent': 0},
    ],
  };

  @override
  Widget build(BuildContext context) {
    final currentData = dataByDays[selectedDays]!;

    return SizedBox(
      height: 170,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: currentData.length,
        itemBuilder: (context, index) {
          final item = currentData[index];

          return SizedBox(
            width: 170,
            height: 150,
            child: SizedBox(
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                elevation: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item['title'].toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14)),
                      const SizedBox(height: 50),
                      Text(item['value'].toString(),
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w900)),
                      const SizedBox(height: 8),
                      Text('%${item['percent'].toString()}',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: (item['percent'] as int) >= 0
                                ? Colors.green
                                : Colors.red,
                          )),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
