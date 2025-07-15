import 'package:flutter/material.dart';
import 'package:preply_clone/bottomsheets/period.dart';
import 'package:preply_clone/models/dynamic_horizontal_cards.dart';
import 'package:preply_clone/models/four_progress_card.dart';
import 'package:preply_clone/models/periodyataycards.dart';
import 'package:preply_clone/models/progresscard.dart';
import 'package:preply_clone/models/two_cards.dart';
import 'package:preply_clone/models/visual_vith_toggle.dart';
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

final List<Map<String, String>> exampleCards = [
  {
    "image": "images/1.jpeg",
    "title": "138",
    "subtitle": "Hours taught",
  },
  {
    "image": "images/2.jpeg",
    "title": "161",
    "subtitle": "Lessons taught",
  },
  {
    "image": "images/3.jpeg",
    "title": "28",
    "subtitle": "Total students",
  },
  {
    "image": "images/4.jpeg",
    "title": "121",
    "subtitle": "Days on preply",
  },
  {
    "image": "images/5.jpeg",
    "title": "\$1528",
    "subtitle": "Total earnings",
  },
];
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

  double getTotalAmount(int selectedDays) {
    final data = {
      7: 123.0,
      30: 432.0,
      90: 1090.0,
    };
    return data[selectedDays] ?? 0.0;
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
                      style: const TextStyle(fontSize: 12, color: Colors.black54),
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
                    child: Text(
                      "Live",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color.fromRGBO(204, 225, 255, 1),
                  ),
                ),
                const SizedBox(height: 20),
                FourCardProgress(),
                const SizedBox(height: 10),
                Text(
                  "Live metrics updated July 15, 18:15",
                  style: TextStyle(color: Colors.grey.shade600),
                ),
                const SizedBox(height: 30),
                Text("New subscriptions",
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                        fontFamily: "Inter")),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                      "See how many learners take the next steps after viewing your profile or taking a trial lesson."),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: _openPeriodSelectionOverview,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
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
                      const SizedBox(height: 8),
                      if (_selectedDaysOverview == 7)
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 230,
                          child: Image.asset('images/7.jpeg', fit: BoxFit.cover),
                        )
                      else if (_selectedDaysOverview == 30)
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 230,
                          child: Image.asset('images/30.jpeg', fit: BoxFit.cover),
                        )
                      else if (_selectedDaysOverview == 90)
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 230,
                          child: Image.asset('images/90.jpeg', fit: BoxFit.cover),
                        )
                      else
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 230,
                          child: Image.asset('images/7.jpeg', fit: BoxFit.cover),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.shade200,
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Average profile position",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                fontFamily: "Inter")),
                        const SizedBox(height: 5),
                        Container(
                          width: 40,
                          height: 25,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(204, 225, 255, 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Text(
                            "Live",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          "234",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w800,
                            fontFamily: "Inter",
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                TwoCards(),
                const SizedBox(height: 10),
                Text(
                  "Data from Jul 8 - Jul 15, compared to Jun 30 - Jul 7. Live metrics updated Jul 15, 19:49.",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Text(
                      "Earnings",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                        fontFamily: "Inter",
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: _openPeriodSelectionProgress,
                      child: Row(
                        children: [
                          const Icon(Icons.calendar_month_rounded,
                              color: Colors.black, size: 30),
                          const SizedBox(width: 10),
                          Text(
                            "$_selectedDaysProgress days",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(width: 10),
                          const Icon(Icons.arrow_drop_down,
                              color: Colors.black, size: 30),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Icon(Icons.wallet_sharp, color: Colors.black, size: 40),
                    const SizedBox(width: 20),
                    Text(
                      "\$${getTotalAmount(_selectedDaysProgress).toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        fontFamily: "Inter",
                      ),
                    ),
                  ],
                ),
                VisualWithToggle(selectedDays: _selectedDaysOverview),
                const SizedBox(height: 20),
                Text("Your Preply journey",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Inter")),
                        SizedBox(height: 5,),
                        Text("See what you've accomplished since you started in March 2025.",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                                )),
                                SizedBox(height: 20,),
                                DynamicHorizontalCards(cardsData: exampleCards),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
