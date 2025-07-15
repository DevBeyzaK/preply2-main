import 'package:flutter/material.dart';
import 'package:preply_clone/models/progress_card_list.dart';

class AcademyPage extends StatefulWidget {
  const AcademyPage({super.key});

  @override
  State<AcademyPage> createState() => _AcademyPageState();
}

class _AcademyPageState extends State<AcademyPage> {
  String? selectedOption;
  final List<String> options = ['Tümü', 'Devam Edenler', 'Tamamlananlar', 'Süresi Dolanlar'];

  final List<Map<String, dynamic>> courseList = [
    {
      'title': 'Welcome to Preply',
      'progress': 1.0,
      'percent': 1.0,
      'subtitle': 'Değerlendirme yap',
      'image': 'images/1_1.jpeg',
    },
    {
      'title': 'Zero-preparation speaking activities',
      'progress': 0.12,
      'percent': 0.12,
      'subtitle': 'Kursu başlat',
      'image': 'images/2_2.jpeg',
    },
    {
      'title': 'Homework with teenagers',
      'progress': 0.11,
      'percent': 0.11,
      'subtitle': 'Kursu başlat',
      'image': 'images/3_3.jpeg',
    },
    {
      'title': 'How to teach kids using songs',
      'progress': 1.0,
      'percent': 1.0,
      'subtitle': 'Değerlendirme yap',
      'image': 'images/4_4.jpeg',
    },
    {
      'title': 'Storytelling for kids classes',
      'progress': 1.0,
      'percent': 1.0,
      'subtitle': 'Değerlendirme yap',
      'image': 'images/5_5.jpeg',
    },
    {
      'title': 'Teaching young learners',
      'progress': 0.12,
      'percent': 0.12,
      'subtitle': 'Kursu başlat',
      'image': 'images/6_6.jpeg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(244, 243, 247, 1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Academy', style: TextStyle(color: Colors.black)),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(249, 248, 252, 1),
                image: DecorationImage(
                  image: AssetImage('images/academy.jpeg'),
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.topLeft,
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Kurslarım",
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {
                      // diğer kurslara göz at fonksiyonu
                    },
                    child: const Text(
                      "Diğer kurslara göz at",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  const Spacer(),
                  PopupMenuButton<String>(
                    color: Colors.white,
                    tooltip: 'Filtrele',
                    onSelected: (value) {
                      setState(() {
                        selectedOption = value;
                      });
                    },
                    itemBuilder: (BuildContext context) {
                      List<PopupMenuEntry<String>> items = [];

                      for (int i = 0; i < options.length; i++) {
                        items.add(
                          PopupMenuItem<String>(
                            value: options[i],
                            child: SizedBox(
                              width: 180,
                              child: Text(options[i]),
                            ),
                          ),
                        );

                        if (i < options.length - 1) {
                          items.add(const PopupMenuDivider(height: 1));
                        }
                      }

                      return items;
                    },
                    child: TextButton.icon(
                      label: Text(
                        selectedOption ?? "Tümü",
                        style: const TextStyle(fontSize: 16),
                      ),
                      icon: const Icon(Icons.arrow_drop_down),
                      onPressed: null,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Kartlar
            ProgressCardList(cardData: courseList),
          ],
        ),
      ),
    );
  }
}
