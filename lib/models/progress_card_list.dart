import 'package:flutter/material.dart';

class ProgressCardList extends StatelessWidget {
  final List<Map<String, dynamic>> cardData;

  const ProgressCardList({super.key, required this.cardData});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: cardData.length,
      itemBuilder: (context, index) {
        final item = cardData[index];
        return SizedBox(
          height: 400, // Kart yüksekliği artırıldı
          width: 160,  // Kart genişliği azaltıldı
          child: Card(
            color: Colors.white,
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          item['title'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 56),
                      LinearProgressIndicator(
                        value: item['percent'],
                        minHeight: 5,
                        backgroundColor: Colors.grey[300],
                        color: Colors.black,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "%${(item['percent'] * 100).round()}",
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          item['subtitle'],
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  child: Image.asset(
                    item['image'],
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 212,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
