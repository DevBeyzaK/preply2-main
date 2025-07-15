import 'package:flutter/material.dart';

class Period extends StatefulWidget {
  final int initialSelectedDays;
  final ValueChanged<int> onSelectedDaysChanged;

  const Period({
    Key? key,
    required this.initialSelectedDays,
    required this.onSelectedDaysChanged,
  }) : super(key: key);

  @override
  _PeriodState createState() => _PeriodState();
}

class _PeriodState extends State<Period> {
  late int selectedDays;

  @override
  void initState() {
    super.initState();
    selectedDays = widget.initialSelectedDays;
  }

  void selectDays(int days) {
    setState(() {
      selectedDays = days;
    });
    widget.onSelectedDaysChanged(days); // Anlık bilgi ver
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.close),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: const Text(
              "Select period",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today),
            title: const Text("Last 90 days"),
            trailing:
                selectedDays == 90 ? const Icon(Icons.check, color: Colors.black) : null,
            onTap: () => selectDays(90),
          ),
          Divider(
            color: Colors.grey.shade300,
            thickness: 1,
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today),
            title: const Text("Last 30 days"),
            trailing:
                selectedDays == 30 ? const Icon(Icons.check, color: Colors.black) : null,
            onTap: () => selectDays(30),
          ),
          Divider(
            color: Colors.grey.shade300,
            thickness: 1,
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today),
            title: const Text("Last 7 days"),
            trailing:
                selectedDays == 7 ? const Icon(Icons.check, color: Colors.black) : null,
            onTap: () => selectDays(7),
          ),
        ],
      ),
    );
  }
}
