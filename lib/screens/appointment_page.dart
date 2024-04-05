import 'package:doctor_appointment/utils/config.dart';
import 'package:flutter/material.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

enum FilterStatus { upcoming, complete, cancel }

class _AppointmentPageState extends State<AppointmentPage> {
  FilterStatus status = FilterStatus.upcoming;
  Alignment _alignment = Alignment.centerLeft;

  List<dynamic> schedules = [
    {
      "doctor_name": "Dr. Amanda",
      "doctor_profile": "assets/doctor_1.jpg",
      "category": "General",
      "status": FilterStatus.upcoming,
    },
    {
      "doctor_name": "Dr. Max",
      "doctor_profile": "assets/doctor_2.jpg",
      "category": "Cardiology",
      "status": FilterStatus.complete,
    },
    {
      "doctor_name": "Dr. Richard",
      "doctor_profile": "assets/doctor_3.jpg",
      "category": "Respiration",
      "status": FilterStatus.cancel,
    },
    {
      "doctor_name": "Dr. Jenny",
      "doctor_profile": "assets/doctor_4.jpg",
      "category": "Dermatology",
      "status": FilterStatus.upcoming,
    },
    {
      "doctor_name": "Dr. Alicia",
      "doctor_profile": "assets/doctor_5.jpg",
      "category": "Gynecology",
      "status": FilterStatus.complete,
    },
    {
      "doctor_name": "Dr. Jane",
      "doctor_profile": "assets/doctor_6.jpg",
      "category": "Dental",
      "status": FilterStatus.cancel,
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<dynamic> filterSchedules = schedules.where((element) {
      return element['status'] == status;
    }).toList();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Appointment Schedule',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Config.spaceSmall,
            Stack(
              children: [
                Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (FilterStatus filterStatus in FilterStatus.values)
                        Expanded(
                          child: GestureDetector(
                            onTap: () => setState(() {
                              if (filterStatus == FilterStatus.upcoming) {
                                status = FilterStatus.upcoming;
                                _alignment = Alignment.centerLeft;
                              } else if (filterStatus == FilterStatus.complete) {
                                status = FilterStatus.complete;
                                _alignment = Alignment.center;
                              } else if (filterStatus == FilterStatus.cancel) {
                                status = FilterStatus.cancel;
                                _alignment = Alignment.centerRight;
                              }
                            }),
                            child: Center(
                              child: Text(
                                filterStatus.name,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                AnimatedAlign(
                  alignment: _alignment,
                  duration: const Duration(milliseconds: 200),
                  child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Config.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        status.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Config.spaceSmall,
            Expanded(
              child: ListView.builder(
                itemCount: filterSchedules.length,
                itemBuilder: (context, index) {
                  var _schedule = filterSchedules[index];
                  bool isLastElement = filterSchedules.length == index + 1;

                  return Card(
                    surfaceTintColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Config.primaryColor,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: isLastElement
                        ? EdgeInsets.zero
                        : const EdgeInsets.only(bottom: 20),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(
                                  _schedule["doctor_profile"],
                                ),
                              ),
                              const SizedBox(
                                width: 25,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _schedule["doctor_name"],
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    _schedule["category"],
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          ScheduleCard(),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: const Text(
                                    'Cancel',
                                    style: TextStyle(
                                      color: Config.primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: Config.primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: const Text(
                                    'Reschedule',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
      ),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.calendar_today,
            size: 15,
            color: Config.primaryColor,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            'Monday, 05/04/2024',
            style: const TextStyle(
              color: Config.primaryColor,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          const Icon(
            Icons.access_alarm,
            size: 15,
            color: Config.primaryColor,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            '02:00 PM',
            style: const TextStyle(
              color: Config.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
