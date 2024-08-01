import 'package:flutter/material.dart';

import '../../reusables/CustomTextField.dart';
import '../../reusables/buttons.dart';
import '../numbertodate/NumberToDate.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff303030),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(flex: 2),
            Image.asset("assets/calandar.png"),
            SizedBox(height: 20),
            Text(
              "NUMBER OF DAYS \nDATE OF THE YEAR?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(flex: 3),
            blackButton(
              text: 'LETS GO!',
              onTab: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => NumberToDate()),
                );
              },
            ),
            Spacer(flex: 1),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Aryan Srivastava",
                style: TextStyle(color: Colors.white,fontSize: 16),
              ),
            ),
            SizedBox(height: 20), // Add a small space below the text
          ],
        ),
      ),
    );
  }
}
