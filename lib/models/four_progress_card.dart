import 'package:flutter/material.dart';

class FourCardProgress extends StatelessWidget {
  const FourCardProgress({Key? key}) : super(key: key);

  // Sabit 4 kartlık veri
  final List<Map<String, dynamic>> cardsData = const [
    {
      'title': 'Popular time slots',
      'subtitle': 'Aim for more than 33 slots',
      'percent': 26,
    },
    {
      'title': 'Average review rating',
      'subtitle': 'Aim for more than 4.8',
      'percent': 5.0,
    },
    {
      'title': 'Profile score',
      'subtitle': 'Aim for more than 90',
      'percent': 58,
    },
    {
      'title': 'Price per lesson',
      'subtitle': null,
      'percent': null,
      'value': '\$25',
    },
  ];

  bool isComplete(Map<String, dynamic> item) {
    final title = item['title'];
    final percent = item['percent'];

    if (percent == null) return false;

    switch (title) {
      case 'Popular time slots':
        return percent >= 33;
      case 'Average review rating':
        return percent > 4.8;
      case 'Profile score':
        return percent >= 90;
      default:
        return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: cardsData.map((item) {
        final completed = isComplete(item);

        return SizedBox(
          height: 150,
          width: MediaQuery.of(context).size.width - 20,
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
            child: Stack(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['title'] ?? '',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      if (item['subtitle'] != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          item['subtitle'],
                          style: const TextStyle(
                              fontSize: 14, color: Colors.grey),
                        ),
                      ],
                      const SizedBox(height: 20),
                      Text(
                        item.containsKey('value') && item['value'] != null
                            ? item['value'].toString()
                            : (item['percent'] != null
                                ? '${item['percent']}%'
                                : ''),
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                ),
                if (completed)
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: Icon(
                      Icons.verified_rounded,
                      color: Color.fromRGBO(216, 248, 242, 1),
                      size: 28,
                    ),
                  ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
