import 'package:doctor_appointment/main_layout.dart';
import 'package:doctor_appointment/screens/auth_page.dart';
import 'package:doctor_appointment/screens/booking_page.dart';
import 'package:doctor_appointment/screens/doctor_detail_page.dart';
import 'package:doctor_appointment/screens/success_booked.dart';
import 'package:doctor_appointment/utils/config.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
<<<<<<< HEAD
        scaffoldBackgroundColor: Colors.white,
=======
>>>>>>> 360d2596be96406f38b335ddc770ac5dfacd70dc
        inputDecorationTheme: InputDecorationTheme(
          focusColor: Config.primaryColor,
          border: Config.outlineBorder,
          errorBorder: Config.errorBorder,
          enabledBorder: Config.outlineBorder,
          floatingLabelStyle: const TextStyle(
            color: Config.primaryColor,
          ),
          prefixIconColor: Colors.black38,
        ),
<<<<<<< HEAD
=======
        scaffoldBackgroundColor: Colors.white,
>>>>>>> 360d2596be96406f38b335ddc770ac5dfacd70dc
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Config.primaryColor,
          selectedItemColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          unselectedItemColor: Colors.grey.shade700,
          elevation: 10,
          type: BottomNavigationBarType.fixed,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthPage(),
        '/main': (context) => const MainLayout(),
        '/doctor_details': (context) => const DoctorDetailsPage(),
        '/booking': (context) => const BookingPage(),
        '/appointment_booking': (context) => const AppointmentBooked(),
      },
    );
  }
}
