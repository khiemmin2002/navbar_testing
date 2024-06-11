import 'package:flutter/material.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';

class MenuEntry {
  final String name;
  final String description;
  final String mealPeriod;
  final String meal;
  final String classroom;
  final String image;
  final DateTime date;
  final Color backgroundColor;

  MenuEntry({
    required this.name,
    required this.description,
    required this.mealPeriod,
    required this.meal,
    required this.classroom,
    required this.image,
    required this.date,
    required this.backgroundColor,
  });
}

class MenuTab extends StatefulWidget {
  const MenuTab({super.key});

  @override
  MenuTabState createState() => MenuTabState();
}

class MenuTabState extends State<MenuTab> {
  late OverlayEntry _overlayEntry;
  bool _isOverlayVisible = false;
  OverlayEntry _createOverlayEntry(entry) {
    return OverlayEntry(
      builder: (context) => Positioned(
        top: 20.0,
        left: 20.0,
        right: 20.0,
        bottom: 20.0,
        child: Container(
          padding: const EdgeInsets.only(left: 20),
          decoration: BoxDecoration(color: entry.backgroundColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () => _toggleOverlay(), child: const Text('X')),
              const SizedBox(
                height: 30,
              ),
              // Text(
              //   "Date: ${entry.date}",
              //   style: const TextStyle(
              //     color: Colors.black,
              //     fontWeight: FontWeight.bold,
              //     fontSize: 16,
              //   ),
              // ),
              Text(
                entry.mealPeriod,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                entry.description,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 32,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Classroom: ${entry.classroom}",
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 32,
                ),
              ),
              Text(
                entry.meal,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 32,
                ),
              ),
              Text(
                entry.image,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 32,
                ),
              ),
            ],
          ),
        ),
      ),
    );
    // builder: (context) => Positioned(
    //   top: 100.0,
    //   left: 50.0,
    //   right: 50.0,
    //   child: Material(
    //     color: Colors.transparent,
    //     child: Container(
    //       padding: EdgeInsets.all(20.0),
    //       decoration: BoxDecoration(
    //         color: Colors.black54,
    //         borderRadius: BorderRadius.circular(10.0),
    //       ),
    //       child: Column(
    //         mainAxisSize: MainAxisSize.min,
    //         children: [
    //           Text(
    //             'This is an overlay',
    //             style: TextStyle(color: Colors.white, fontSize: 18.0),
    //           ),
    //           SizedBox(height: 20.0),
    //           ElevatedButton(
    //             onPressed: () {
    //               _hideOverlay();
    //             },
    //             child: Text('Close'),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // ),
  }

  final List<MenuEntry> entries = [
    MenuEntry(
      name: "Surprise",
      description: "Best in the west",
      mealPeriod: "Breakfast",
      meal: "Ham and Cheese",
      classroom: "Dolphin",
      image: "A",
      date: DateTime.parse("2024-06-10"),
      backgroundColor: Colors.yellow.shade200,
    ),
    MenuEntry(
      name: "Happy",
      description: "Best in town",
      mealPeriod: "Lunch",
      meal: "Cheese cake",
      classroom: "Dolphin",
      image: "B",
      date: DateTime.parse("2024-06-10"),
      backgroundColor: Colors.yellow.shade200,
    ),
    MenuEntry(
      name: "Sad",
      description: "Not so well",
      mealPeriod: "Supper",
      meal: "Rice and Pork",
      classroom: "Dolphin",
      image: "C",
      date: DateTime.parse("2024-06-10"),
      backgroundColor: Colors.yellow.shade200,
    ),
    MenuEntry(
      name: "Surprise",
      description: "Best in the west",
      mealPeriod: "Breakfast",
      meal: "Ham and Cheese",
      classroom: "Dolphin",
      image: "A",
      date: DateTime.parse("2024-06-11"),
      backgroundColor: Colors.yellow.shade200,
    ),
    MenuEntry(
      name: "Happy",
      description: "Best in town",
      mealPeriod: "Lunch",
      meal: "Cheese cake",
      classroom: "Dolphin",
      image: "B",
      date: DateTime.parse("2024-06-11"),
      backgroundColor: Colors.yellow.shade200,
    ),
    MenuEntry(
      name: "Sad",
      description: "Not so well",
      mealPeriod: "Supper",
      meal: "Rice and Pork",
      classroom: "Dolphin",
      image: "C",
      date: DateTime.parse("2024-06-11"),
      backgroundColor: Colors.yellow.shade200,
    ),
    MenuEntry(
      name: "Surprise",
      description: "Best in the west",
      mealPeriod: "Breakfast",
      meal: "Ham and Cheese",
      classroom: "Dolphin",
      image: "A",
      date: DateTime.parse("2024-06-09"),
      backgroundColor: Colors.yellow.shade200,
    ),
    MenuEntry(
      name: "Happy",
      description: "Best in town",
      mealPeriod: "Lunch",
      meal: "Cheese cake",
      classroom: "Dolphin",
      image: "B",
      date: DateTime.parse("2024-06-09"),
      backgroundColor: Colors.yellow.shade200,
    ),
    MenuEntry(
      name: "Sad",
      description: "Not so well",
      mealPeriod: "Supper",
      meal: "Rice and Pork",
      classroom: "Dolphin",
      image: "C",
      date: DateTime.parse("2024-06-09"),
      backgroundColor: Colors.yellow.shade200,
    ),
  ];

  late List<MenuEntry> getEntries;
  late MenuEntry overlay;

  @override
  void initState() {
    super.initState();

    _loadMenu(DateTime.parse(
        "${DateTime.now().year}-0${DateTime.now().month}-${DateTime.now().day}"));
  }

  Future<void> _loadMenu(DateTime chosenDate) async {
    setState(() {
      getEntries = List<MenuEntry>.from(entries)
          .where((element) => element.date == chosenDate)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: EasyDateTimeLine(
            initialDate: DateTime.now(),
            onDateChange: (selectedDate) {
              _loadMenu(selectedDate);
            },
            activeColor: const Color.fromRGBO(254, 206, 38, 1),
            dayProps: const EasyDayProps(
              dayStructure: DayStructure.dayStrDayNum,
              width: 55.0,
              height: 70.0,
              todayHighlightStyle: TodayHighlightStyle.withBorder,
              todayHighlightColor: Color.fromRGBO(254, 206, 38, 1),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: getEntries.length,
            itemBuilder: (context, index) {
              final entry = getEntries[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: entry.backgroundColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextButton(
                                  onPressed: () =>
                                      {overlay = entry, _toggleOverlay()},
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        // Text(
                                        //   "Date: ${entry.date}",
                                        //   style: const TextStyle(
                                        //     color: Colors.black,
                                        //     fontWeight: FontWeight.bold,
                                        //     fontSize: 16,
                                        //   ),
                                        // ),
                                        Text(
                                          entry.mealPeriod,
                                          style: const TextStyle(
                                            color: Colors.black54,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          entry.description,
                                          style: const TextStyle(
                                            color: Colors.black54,
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          "Classroom: ${entry.classroom}",
                                          style: const TextStyle(
                                            color: Colors.black54,
                                            fontSize: 14,
                                          ),
                                        ),
                                        Text(
                                          entry.meal,
                                          style: const TextStyle(
                                            color: Colors.black54,
                                            fontSize: 14,
                                          ),
                                        ),
                                        Text(
                                          entry.image,
                                          style: const TextStyle(
                                            color: Colors.black54,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ])),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void _toggleOverlay() {
    if (_isOverlayVisible) {
      _overlayEntry.remove();
      setState(() {
        _isOverlayVisible = false;
      });
    } else {
      _overlayEntry = _createOverlayEntry(overlay);
      Overlay.of(context).insert(_overlayEntry);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          _isOverlayVisible = true;
        });
      });
    }
  }
}
