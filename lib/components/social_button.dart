import 'package:doctor_appointment/utils/config.dart';
import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({super.key, required this.social});

  final String social;

  @override
  Widget build(BuildContext context) {
    Config.init(context: context);

    return GestureDetector(
      onTap: () {},
      child: Container(
        width: Config.screenWidth! * 0.4,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1,
            color: Colors.black,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/$social.png',
              width: 40,
              height: 40,
            ),
            Text(
              social.toUpperCase(),
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
