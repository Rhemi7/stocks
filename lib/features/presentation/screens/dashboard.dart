import 'package:flutter/material.dart';
import 'package:stock_data/features/presentation/screens/date_range_screen.dart';

import 'home_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int? selectedIndex = 0;

  static List<Widget> widgetOptions = <Widget>[
    const HomeScreen(),
    const DateRangeScreen(),
  ];

  void _onTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetOptions.elementAt(selectedIndex!), //New
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTapped,
        elevation: 0,
        currentIndex: selectedIndex!,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        iconSize: 25,
        mouseCursor: SystemMouseCursors.grab,
        selectedLabelStyle: const TextStyle(color: Colors.blue, fontSize: 14),
        unselectedLabelStyle: const TextStyle(color: Colors.grey, fontSize: 14),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.date_range),
            label: "Date",
          ),
        ],
      ),
    );
  }
}
