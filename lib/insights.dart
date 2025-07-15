import 'package:flutter/material.dart';
import 'package:preply_clone/bottomsheets/period.dart';
import 'package:preply_clone/models/four_progress_card.dart';
import 'package:preply_clone/models/periodyataycards.dart';
import 'package:preply_clone/models/progresscard.dart';
import 'package:preply_clone/widgets/profile_avatar_button.dart';

class Insights extends StatefulWidget {
  final VoidCallback openDrawer;
  const Insights({Key? key, required this.openDrawer}) : super(key: key);

  @override
  State<Insights> createState() => _InsightsState();
}

class _InsightsState extends State<Insights> {
  final Map<int, String> comparisonTexts = {
    90: "Data from Apr 16 - July 15, compared to Jan 15 - Apr 15",
    30: "Data from June 16 - July 15, compared to May 15 - June 15",
    7: "Data from July 8 - July 15, compared to July 1 - July 7",
  };

  int _selectedDaysOverview = 7; // Üstteki overview için
  int _selectedDaysProgress = 7; // Alttaki progress cardlar için

  void _openPeriodSelectionOverview() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Period(
          initialSelectedDays: _selectedDaysOverview,
          onSelectedDaysChanged: (newSelectedDays) {
            setState(() {
              _selectedDaysOverview = newSelectedDays;
            });
          },
        );
      },
    );
  }

  void _openPeriodSelectionProgress() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Period(
          initialSelectedDays: _selectedDaysProgress,
          onSelectedDaysChanged: (newSelectedDays) {
            setState(() {
              _selectedDaysProgress = newSelectedDays;
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Üst Bölüm (Overview)
          Container(
            width: MediaQuery.of(context).size.width,
            height: 430,
            color: const Color.fromRGBO(204, 225, 255, 1),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 70),
                    child: Row(
                      children: [
                        const Text("Overview",
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Inter")),
                        const Spacer(),
                        ProfileAvatarButton(
                          onTap: widget.openDrawer,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Your business at a glance",
                        style: TextStyle(fontSize: 16)),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: _openPeriodSelectionOverview,
                    child: Row(
                      children: [
                        const Icon(Icons.calendar_month_rounded,
                            color: Colors.black, size: 30),
                        const SizedBox(width: 10),
                        Text("$_selectedDaysOverview days",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600)),
                        const SizedBox(width: 10),
                        const Icon(Icons.arrow_drop_down,
                            color: Colors.black, size: 30),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Periodyataycards(selectedDays: _selectedDaysOverview),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Text(
                      comparisonTexts[_selectedDaysOverview] ?? "",
                      style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black54),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Alt Bölüm (Keys to success)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Keys to success",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Inter")),
                const SizedBox(height: 5),
                const Text(
                    "These insights are designed to help you and support you grow your business, attract new students, and keep them engaged.",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                        fontFamily: "Inter")),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: _openPeriodSelectionProgress,
                  child: Row(
                    children: [
                      const Icon(Icons.calendar_month_rounded,
                          color: Colors.black, size: 30),
                      const SizedBox(width: 10),
                      Text("$_selectedDaysProgress days",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600)),
                      const SizedBox(width: 10),
                      const Icon(Icons.arrow_drop_down,
                          color: Colors.black, size: 30),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ProgressCard(selectedDays: _selectedDaysProgress),
                const SizedBox(height: 20),
                Container(
                  width: 50,
                  height: 35,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Live",style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color.fromRGBO(204, 225, 255, 1),
                  ),
                ),
                const SizedBox(height: 20),
                FourCardProgress(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
