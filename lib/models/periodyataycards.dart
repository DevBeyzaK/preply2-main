import 'package:flutter/material.dart';

class Periodyataycards extends StatelessWidget {
  final int selectedDays;
  const Periodyataycards({Key? key, required this.selectedDays}) : super(key: key);

  final Map<int, List<Map<String, dynamic>>> dataByDays = const {
    90: [
      {'title': 'Earnings', 'value': '\$638', 'percent': 235, 'info': 'Total earnings in the last 90 days.'},
      {'title': 'Lessons', 'value': '118', 'percent': 174, 'info': 'Total lessons in the last 90 days.'},
      {'title': 'Active students', 'value': '22', 'percent': 57, 'info': 'Number of active students.'},
      {'title': 'New Students', 'value': '7', 'percent': -30, 'info': 'Number of new students enrolled.'},
    ],
    30: [
      {'title': 'Earnings', 'value': '\$239', 'percent': 17, 'info': 'Total earnings in the last 30 days.'},
      {'title': 'Lessons', 'value': '32', 'percent': -17, 'info': 'Total lessons in the last 30 days.'},
      {'title': 'Active students', 'value': '7', 'percent': -53, 'info': 'Number of active students.'},
      {'title': 'New Students', 'value': '0', 'percent': -100, 'info': 'Number of new students enrolled.'},
    ],
    7: [
      {'title': 'Earnings', 'value': '\$50', 'percent': -14, 'info': 'Total earnings in the last 7 days.'},
      {'title': 'Lessons', 'value': '6', 'percent': -25, 'info': 'Total lessons in the last 7 days.'},
      {'title': 'Active students', 'value': '4', 'percent': 0, 'info': 'Number of active students.'},
      {'title': 'New students', 'value': '0', 'percent': 0, 'info': 'Number of new students enrolled.'},
    ],
  };

  @override
  Widget build(BuildContext context) {
    final currentData = dataByDays[selectedDays]!;

    return SizedBox(
      height: 170,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: currentData.length,
        itemBuilder: (context, index) {
          final item = currentData[index];

          return SizedBox(
            width: 170,
            height: 150,
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Başlık + (son iki karta info ikonu)
                    Row(
                      children: [
                        Expanded(
                          child: Text(item['title'].toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17)),
                        ),

                        if (index >= currentData.length - 2) // son iki karta ekle
                          InfoTooltip(message: item['info'] ?? ''),
                      ],
                    ),
                    Spacer(),
                    Text(item['value'].toString(),
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w900)),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Icon(
                          (item['percent'] as int) >= 0
                              ? Icons.arrow_upward
                              : Icons.arrow_downward,
                          color: (item['percent'] as int) >= 0
                              ? const Color.fromARGB(255, 6, 78, 9)
                              : const Color.fromARGB(255, 148, 24, 24),
                          size: 20,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '%${item['percent'].toString()}',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: (item['percent'] as int) >= 0
                                ? const Color.fromARGB(255, 6, 66, 8)
                                : const Color.fromARGB(255, 157, 27, 27),
                          ),
                        ),
                      ],
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

class InfoTooltip extends StatefulWidget {
  final String message;
  const InfoTooltip({Key? key, required this.message}) : super(key: key);

  @override
  _InfoTooltipState createState() => _InfoTooltipState();
}

class _InfoTooltipState extends State<InfoTooltip> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  bool _isTooltipVisible = false;

  void _toggleTooltip() {
    if (_isTooltipVisible) {
      _hideTooltip();
    } else {
      _showTooltip();
    }
  }

  void _showTooltip() {
    final overlay = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);
    final screenWidth = MediaQuery.of(context).size.width;
    final rightPosition = screenWidth - offset.dx + 10; // 10px biraz kaydırdım

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        right: rightPosition,
        top: offset.dy + size.height + 6,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, size.height),
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(6),
            color: Colors.black87,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Text(
                widget.message,
                style: const TextStyle(color: Colors.white, fontSize: 13),
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(_overlayEntry!);
    setState(() {
      _isTooltipVisible = true;
    });
  }

  void _hideTooltip() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    setState(() {
      _isTooltipVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: _toggleTooltip,
        child: const Icon(Icons.info_outline, size: 18, color: Colors.black),
      ),
    );
  }

  @override
  void dispose() {
    _hideTooltip();
    super.dispose();
  }
}
