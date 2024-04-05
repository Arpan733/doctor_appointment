import 'package:doctor_appointment/screens/appointment_page.dart';
import 'package:doctor_appointment/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentPage = 0;
  late PageController _page = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _page,
        onPageChanged: (value) {
          _currentPage = value;
        },
        children: [
          HomePage(),
          AppointmentPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPage,
        onTap: (value) {
          setState(() {
            _currentPage = value;

            _page.animateToPage(
              value,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'Home',
            icon: FaIcon(
              FontAwesomeIcons.houseChimneyMedical,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Appointment',
            icon: FaIcon(
              FontAwesomeIcons.solidCalendarCheck,
            ),
          ),
        ],
      ),
    );
  }
}
