import 'package:flutter/material.dart';

class DynamicHorizontalCards extends StatelessWidget {
  final List<Map<String, String>> cardsData;

  const DynamicHorizontalCards({Key? key, required this.cardsData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180, // kart yüksekliği
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        itemCount: cardsData.length,
        itemBuilder: (context, index) {
          final card = cardsData[index];
          return Card(
            color: Color.fromRGBO(244, 243, 248, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            elevation: 2,
            margin: const EdgeInsets.only(right: 16),
            child: SizedBox(
              width: 180, // kart genişliği
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Resim üstte
                    Image.asset(
                      card['image'] ?? '',
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                
                    // Başlık ve alt başlık
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            card['title'] ?? '',
                            style: const TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 25,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            card['subtitle'] ?? '',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
