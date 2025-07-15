import 'package:flutter/material.dart';

class ProgressCard extends StatelessWidget {
  final int selectedDays;
  const ProgressCard({Key? key, required this.selectedDays}) : super(key: key);

  // Her gün aralığı için farklı veri
  static final Map<int, List<Map<String, dynamic>>> progressDataByDays = {
    90: [
      {'title': 'Lessons you rescheduled', 'subtitle': 'Aim for less than 10%', 'percent': 5},
      {'title': 'Lessons you cancelled', 'subtitle': 'Aim for less than 5%', 'percent': 2},
      {'title': 'Total lessons missed', 'subtitle': 'Aim for 0', 'percent': 0},
      {'title': 'Weekly lessons', 'subtitle': 'Aim for more than 75%', 'percent': 80},
      {'title': 'Lessons in the preply classroom', 'subtitle': 'Aim for more than 75%', 'percent': 85},
      {'title': 'Replies within 24 hours', 'subtitle': 'Aim for more than 90%', 'percent': 95},
      {'title': 'Trial follow-ups', 'subtitle': 'Aim for more than 90%', 'percent': 70},
    ],
    30: [
      {'title': 'Lessons you rescheduled', 'subtitle': 'Aim for less than 10%', 'percent': 8},
      {'title': 'Lessons you cancelled', 'subtitle': 'Aim for less than 5%', 'percent': 3},
      {'title': 'Total lessons missed', 'subtitle': 'Aim for 0', 'percent': 0},
      {'title': 'Weekly lessons', 'subtitle': 'Aim for more than 75%', 'percent': 65},
      {'title': 'Lessons in the preply classroom', 'subtitle': 'Aim for more than 75%', 'percent': 72},
      {'title': 'Replies within 24 hours', 'subtitle': 'Aim for more than 90%', 'percent': 88},
      {'title': 'Trial follow-ups', 'subtitle': 'Aim for more than 90%', 'percent': 60},
    ],
    7: [
      {'title': 'Lessons you rescheduled', 'subtitle': 'Aim for less than 10%', 'percent': 12},
      {'title': 'Lessons you cancelled', 'subtitle': 'Aim for less than 5%', 'percent': 4},
      {'title': 'Total lessons missed', 'subtitle': 'Aim for 0', 'percent': 0},
      {'title': 'Weekly lessons', 'subtitle': 'Aim for more than 75%', 'percent': 30},
      {'title': 'Lessons in the preply classroom', 'subtitle': 'Aim for more than 75%', 'percent': 50},
      {'title': 'Replies within 24 hours', 'subtitle': 'Aim for more than 90%', 'percent': 100},
      {'title': 'Trial follow-ups', 'subtitle': 'Aim for more than 90%', 'percent': 55},
    ],
  };

  // Açıklama metinleri
  static final Map<int, String> descriptionByDays = {
    90: "Data from Apr 15 - Jul 15",
    30: "Data from May 15 - Jun 15",
    7: "Data from Jul 8 - Jul 15",
  };

  bool isComplete(String subtitle, int percent) {
    if (subtitle == 'Aim for less than 10%') {
      return percent < 10;
    } else if (subtitle == 'Aim for less than 5%') {
      return percent < 5;
    } else if (subtitle == 'Aim for 0') {
      return percent == 0;
    } else if (subtitle == 'Aim for more than 75%') {
      return percent > 75;
    } else if (subtitle == 'Aim for more than 90%') {
      return percent > 90;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final progressData = progressDataByDays[selectedDays] ?? [];
    final description = descriptionByDays[selectedDays] ?? "";

    return Column(
      children: [
        ...progressData.map((item) {
          final bool goalMet = isComplete(item['subtitle'], item['percent']);

          return SizedBox(
            width: MediaQuery.of(context).size.width - 20,
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              color: Colors.white,
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(
                  width: 1.0,
                  color: Colors.grey.shade300,
                ),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['title'],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item['subtitle'],
                          style: const TextStyle(
                              fontSize: 14, color: Colors.grey),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${item['percent']}%',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (goalMet)
                    Positioned(
                      bottom: 8,
                      right: 8,
                      child: const Icon(
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

        // Açıklama metni burada
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              description,
              style: const TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ),
        ),
      ],
    );
  }
}
