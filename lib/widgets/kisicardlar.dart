import 'package:flutter/material.dart';

class Kisicardlar extends StatelessWidget {
  const Kisicardlar({
    super.key,
    required this.name,
    required this.date,
    required this.imgUrl,
  });

  final String name;
  final String date;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: BorderSide(color: Colors.grey.shade300, width: 1.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 270),
                    child: Text(
                      name,
                      style: const TextStyle(
                        fontFamily: "Inter",
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Text(date),
                ],
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imgUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
