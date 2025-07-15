import 'dart:ui';

import 'package:flutter/material.dart';

class Takvimkisi {
  final String day;
  final String imgUrl;
  final String name;
  final String time;
  final String weekDay;
  final Color barColor;
  

  Takvimkisi({
    required this.day,
    required this.imgUrl,
    required this.name,
    required this.time,
    required this.weekDay,
    required this.barColor,
  });
  static List<String> photoUrls = [
  'images/irem.png',
  'images/buket.jpg',
  'images/mehmet.jpg',
  'images/defne.jpg',
  'images/nujin.jpg',
  'images/ogulcan.jpg',
  'images/melih.jpg',
  'images/engin.jpg',
  'images/fatih.png',
  'images/haluk.jpeg',
  'images/kisi.png',
];

  static List<String> names = [
  'İrem B.',
  'Buket B.',
  'Mehmet K.',
  'Defne A.',
  'Nujin Ö.',
  'Oğulcan T.',
  'Melih K.',
  'Engin Y.',
  'Fatih K.',
  'Haluk Ç.',
  'İlay B.',

];

static List<String> weekDays = [
    'MON',
    'TUE',
    'WED',
    'THU',
    'FRI',
    'SAT',
    'SUN',
    'MON',
    'TUE',
    'WED',
    'THU',
  ];

  static List<String> days = [
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31',
  ];

static List<String> times = [
    "10:00-11:50",
    "11:30-12:30",
    "14:00-15:00",
    "15:15-16:15",
    "16:45-17:45",
    "09:00-10:00",
    "17:30-18:30",
    "12:15-13:15",
    "13:00-14:00",
    "08:30-09:30",
    "19:00-20:00",
  ];
  static final List<Color> barColors = [
  Colors.green.shade900,
  Colors.blue.shade900,
  Colors.pink.shade900,
  Colors.brown,
  Colors.grey.shade900,
  Colors.green.shade900,
  Colors.blue.shade900,
  Colors.pink.shade900,
  Colors.brown,
  Colors.grey.shade900,
  Colors.grey.shade900,
];


// Model listesi oluşturuyoruz:
static List<Takvimkisi> createPersonList() {
  int length = photoUrls.length; // veya diğer listelerin uzunluğu

  List<Takvimkisi> kisiler = [];

  for (int i = 0; i < length; i++) {
    kisiler.add(Takvimkisi(
      imgUrl: photoUrls[i],
      name: names[i],
      time: times[i],
      day: days[i],
      weekDay: weekDays[i],
      barColor: barColors[i],
    ));
  }

  return kisiler;
}
}
