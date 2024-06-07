import 'package:flutter/material.dart';

class TimetableEntry {
  final String startTime;
  final String endTime;
  final String name;
  final String description;
  final String location;
  final String classroom;
  final Color backgroundColor;

  TimetableEntry({
    required this.startTime,
    required this.endTime,
    required this.name,
    required this.description,
    required this.location,
    required this.classroom,
    required this.backgroundColor,
  });
}

class TimetableTab extends StatefulWidget {
  @override
  _TimetableTabState createState() => _TimetableTabState();
}

class _TimetableTabState extends State<TimetableTab> {
  final List<String> days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
  final List<String> dates = ["16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29"];
  
  int _selectedIndex = 0; // Track the selected index

  final List<TimetableEntry> entries = [
    TimetableEntry(
      startTime: "8:00 AM",
      endTime: "8:30 AM",
      name: "Morning Assembly",
      description: "Prayer and Pledge",
      location: "Hall",
      classroom: "Dolphin",
      backgroundColor: Colors.grey.shade200,
    ),
    TimetableEntry(
      startTime: "8:30 AM",
      endTime: "9:00 AM",
      name: "Mathematics",
      description: "Lesson 1: Addition",
      location: "In-Class",
      classroom: "Dolphin",
      backgroundColor: Colors.grey.shade200,
    ),
    TimetableEntry(
      startTime: "9:00 AM",
      endTime: "9:30 AM",
      name: "Science",
      description: "Lesson 1: Plants",
      location: "In-Class",
      classroom: "Dolphin",
      backgroundColor: Colors.grey.shade200,
    ),
    TimetableEntry(
      startTime: "9:30 AM",
      endTime: "10:00 AM",
      name: "Break",
      description: "Morning Snack",
      location: "Canteen",
      classroom: "Dolphin",
      backgroundColor: Colors.grey.shade200,
    ),
    TimetableEntry(
      startTime: "10:00 AM",
      endTime: "10:30 AM",
      name: "English",
      description: "Lesson 1: Reading",
      location: "In-Class",
      classroom: "Dolphin",
      backgroundColor: Colors.grey.shade200,
    ),
    // Add more entries here
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          // Adding current date information
          Padding(
            padding: const EdgeInsets.all(8.0),
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
            padding: const EdgeInsets.symmetric(horizontal: 8),
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
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 80,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              entry.startTime,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 4),
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
                      SizedBox(width: 12),
                      
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
                                Text(
                                  entry.name,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  entry.description,
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
