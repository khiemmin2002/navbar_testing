import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'home_screen.dart';
import 'schedule_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const ScheduleScreen(),
    Container(color: Color.fromRGBO(39, 188, 44, 1)),
    Container(color: Color.fromRGBO(28, 120, 213, 1)),
    Container(color: Color.fromRGBO(129, 31, 185, 1)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        unselectedItemColor: Color.fromRGBO(120, 120, 120, 1),
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text("Home"),
            selectedColor: Color.fromRGBO(254, 174, 0, 1),
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.calendar_month_rounded),
            title: const Text("Schedule"),
            selectedColor: Color.fromRGBO(231, 28, 95, 1),
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.photo_album_outlined),
            title: const Text("Gallery"),
            selectedColor: Color.fromRGBO(39, 188, 44, 1),
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.notifications),
            title: const Text("Notifications"),
            selectedColor: Color.fromRGBO(28, 120, 213, 1),
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.more_horiz),
            title: const Text("More"),
            selectedColor: Color.fromRGBO(129, 31, 185, 1),
          ),
        ],
      ),
    );
  }
}