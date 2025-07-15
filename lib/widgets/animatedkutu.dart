import 'package:flutter/material.dart';

class Animatedkutu extends StatefulWidget {
  const Animatedkutu({
    super.key,
    required this.olayAdi,
    required this.subText,
  });

  final String olayAdi;
  final String subText;

  @override
  State<Animatedkutu> createState() => _AnimatedkutuState();
}

class _AnimatedkutuState extends State<Animatedkutu> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(color: Colors.grey.shade300)),
      child: InkWell(
        onTap: () {
          setState(() {
            isExpanded = !isExpanded;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                children: [
                  // Yazı sola yapışık ve kalan alanı kaplar
                  Expanded(
                    child: Text(
                      widget.olayAdi,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Sayı yuvarlak
                  const CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.black,
                    child: Text(
                      "0",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    isExpanded ? Icons.expand_less : Icons.expand_more,
                    size: 20,
                  ),
                ],
              ),

              // Genişleyen içerik
              if (isExpanded)
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(244, 243, 247, 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          "images/kahve.png",
                          width: 40,
                          height: 40,
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "You're up to date.",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          widget.subText,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
