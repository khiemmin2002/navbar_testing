import 'package:flutter/material.dart';

class TimetableEntryDetail {
  final String learningObjectives;
  final String learningOutcomes;
  final String resources;

  TimetableEntryDetail({
    required this.learningObjectives,
    required this.learningOutcomes,
    required this.resources,
  });
}

class TimetableEntry {
  final String time;
  final String endTime;
  final String course;
  final String details;
  final String location;
  final String classroom;
  final Color backgroundColor;
  final TimetableEntryDetail detail;

  TimetableEntry({
    required this.time,
    required this.endTime,
    required this.course,
    required this.details,
    required this.location,
    required this.classroom,
    required this.backgroundColor,
    required this.detail,
  });
}

class TimetableTab extends StatefulWidget {
  @override
  _TimetableTabState createState() => _TimetableTabState();
}

class _TimetableTabState extends State<TimetableTab> {
  final List<String> days = ["M", "T", "W", "T", "F", "S", "S"];
  final List<String> dates = ["16", "17", "18", "19", "20", "21", "22"];
  
  int _selectedIndex = 0; // Track the selected index

  final List<TimetableEntry> entries = [
    TimetableEntry(
      time: "8:00 AM",
      endTime: "8:30 AM",
      course: "Reading Stories",
      details: "Sự tích Khá Bảnh",
      location: "In-Class",
      classroom: "Dolphin",
      backgroundColor: Color.fromRGBO(254, 206, 38, 1),
      detail: TimetableEntryDetail(
        learningObjectives: "Understand the story of Khá Bảnh.",
        learningOutcomes: "Students will learn about cultural stories.",
        resources: "https://www.youtube.com/watch?v=example",
      ),
    ),
    TimetableEntry(
      time: "8:45 AM",
      endTime: "9:15 AM",
      course: "Basic Maths",
      details: "Counting cookies",
      location: "In-Class",
      classroom: "Dolphin",
      backgroundColor: Colors.grey.shade200,
      detail: TimetableEntryDetail(
        learningObjectives: "Learn to count cookies.",
        learningOutcomes: "Students will be able to count up to 10.",
        resources: "https://www.khanacademy.org/math",
      ),
    ),
    // Add more entries here
  ];

  OverlayEntry? _overlayEntry;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          // Adding current date information
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "24",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "Thursday",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "May 2024",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Text(
                  "Today",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          
          // Create a ListView with horizontal scroll direction for dates
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              height: 70,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: days.length,
                itemBuilder: (context, index) {
                  bool isSelected = index == _selectedIndex;
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      child: Container(
                        width: 50,
                        decoration: BoxDecoration(
                          color: isSelected ? Color.fromRGBO(254, 206, 38, 1) : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                days[index],
                                style: TextStyle(
                                  color: isSelected ? Colors.white : Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                dates[index],
                                style: TextStyle(
                                  color: isSelected ? Colors.white : Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          // Display timetable entries
          Expanded(
            child: ListView.builder(
              itemCount: entries.length,
              itemBuilder: (context, index) {
                final entry = entries[index];
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: InkWell(
                    onTap: () => _showOverlay(context, entry),
                    child: Row(
                      children: [
                        Container(
                          width: 80,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                entry.time,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                entry.endTime,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: entry.backgroundColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    entry.course,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    entry.details,
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    "Location: ${entry.location}",
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    "Classroom: ${entry.classroom}",
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showOverlay(BuildContext context, TimetableEntry entry) {
    OverlayState overlayState = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 100,
        left: 20,
        right: 20,
        child: Material(
          color: Colors.transparent,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: entry.backgroundColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            entry.course,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () => _overlayEntry?.remove(),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Learning Objectives: ${entry.detail.learningObjectives}",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Learning Outcomes: ${entry.detail.learningOutcomes}",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Resources: ${entry.detail.resources}",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
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

    overlayState.insert(_overlayEntry!);
  }
}