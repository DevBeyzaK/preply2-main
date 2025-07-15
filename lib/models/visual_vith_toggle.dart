import 'package:flutter/material.dart';

class VisualWithToggle extends StatefulWidget {
  final int selectedDays;
  const VisualWithToggle({Key? key, required this.selectedDays}) : super(key: key);

  @override
  State<VisualWithToggle> createState() => _VisualWithToggleState();
}

class _VisualWithToggleState extends State<VisualWithToggle> {
  int selectedTab = 0; // 0 = Current, 1 = Estimated

  // Gün ve tab'a göre resim seçimi
  String getImagePath() {
    if (selectedTab == 0) {
      if (widget.selectedDays == 7) return 'images/7_1.jpeg';
      if (widget.selectedDays == 30) return 'images/30_1.jpeg';
      if (widget.selectedDays == 90) return 'images/90_1.jpeg';
    } else {
      if (widget.selectedDays == 7) return 'images/7_2.jpeg';
      if (widget.selectedDays == 30) return 'images/30_2.jpeg';
      if (widget.selectedDays == 90) return 'images/90_2.jpeg';
    }
    return 'images/90_1.jpeg'; // Varsayılan resim
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Toggle bar
        Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey.shade300,
          ),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTab = 0;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: selectedTab == 0 ? Colors.white : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: selectedTab == 0 ? Colors.grey : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      "Current",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTab = 1;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: selectedTab == 1 ? Colors.white : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: selectedTab == 1 ? Colors.grey : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      "Estimated",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        // Görsel
        Image.asset(
          getImagePath(),
          width: MediaQuery.of(context).size.width,
          height: 220,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
