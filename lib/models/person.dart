class Person {
  final String imgUrl;
  final String name;
  final String messageContent;
  final String day;

  Person({
    required this.imgUrl,
    required this.name,
    required this.messageContent,
    required this.day,
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

  static List<String> messages = [
  "Merhaba, hocam! Ders ne zaman başlıyor?",
  "Thank you for the lesson, it was very helpful!",
  "Canım babam❤️",
  "Can we reschedule the next class?",
  "Merhaba hocam, bugün müsait misiniz?",
  "I found the grammar exercises difficult.",
  "Teşekkürler, çok faydalı oldu!",
  "Will we cover speaking practice next week?",
  "Bugünkü ders çok güzeldi, teşekkürler!",
  "Could you send me the homework file?",
  "Ders saatini değiştirebilir miyiz?"
];

  static List<String> days = [
  'Yesterday',
  'Fri',
  'Fri',
  'Wed',
  'Tue',
  'Tue',
  'Fri',
  "15/01/2025",
  "28/02/2025",
  "05/06/2025",
  "12/09/2025",
];

// Model listesi oluşturuyoruz:
static List<Person> createPersonList() {
  int length = photoUrls.length; // veya diğer listelerin uzunluğu

  List<Person> persons = [];

  for (int i = 0; i < length; i++) {
    persons.add(Person(
      imgUrl: photoUrls[i],
      name: names[i],
      messageContent: messages[i],
      day: days[i],
    ));
  }

  return persons;
}
}
