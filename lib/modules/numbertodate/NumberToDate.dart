import 'package:daytodate_gdsc/modules/review/reviewpage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../reusables/CustomTextField.dart';
import '../../reusables/buttons.dart';
import '../../reusables/textWidget.dart';

class NumberToDate extends StatefulWidget {
  const NumberToDate({super.key});

  @override
  State<NumberToDate> createState() => _NumberToDateState();
}

class _NumberToDateState extends State<NumberToDate> {
  TextEditingController numberOfDays = TextEditingController();
  TextEditingController year = TextEditingController();
  String? resultDate;
  String? leapYearText;
  int? weekNumber;
  bool isCheckButtonVisible = true;
  bool isReviewButtonVisible = false;
  bool isResetButtonVisible = false;
  String? errorMessage; // Add this line to declare an error message variable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff303030),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40),
          //appbar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: Container(
                        height: 45,
                        width: 45,
                        color: Color(0xff999999),
                      ),
                    ),
                    SizedBox(width: 10),
                    textWidget(text: 'Hello Manan'),
                  ],
                ),
                if (isResetButtonVisible)
                  IconButton(
                    onPressed: () {
                      setState(() {
                        numberOfDays.clear();
                        year.clear();
                        resultDate = null;
                        leapYearText = null;
                        weekNumber = null;
                        isCheckButtonVisible = true;
                        isReviewButtonVisible = false;
                        isResetButtonVisible = false;
                      });
                    },
                    icon: Icon(Icons.restart_alt_rounded, color: Colors.white),
                  ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: textWidget(text: 'Enter Number of Days'),
          ),
          CustomTextField(controller: numberOfDays, hintText: ''),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: textWidget(text: 'Enter the Year'),
          ),
          CustomTextField(controller: year, hintText: ''),
          SizedBox(height: 28),
          if (isCheckButtonVisible)
            Center(
              child: blackButton(
                text: 'CHECK?',
                onTab: () {
                  calculateDate();
                },
              ),
            ),
          if (errorMessage != null)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: textWidget(text: errorMessage!),
            ),
          if (resultDate != null && leapYearText != null) ...[
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                children: [
                  textWidget(text: 'Date: $resultDate'),
                  textWidget(text: 'Is Leap Year: $leapYearText'),
                  textWidget(text: 'Week Number: $weekNumber'),
                ],
              ),
            ),
          ],
          Spacer(),
          if (isReviewButtonVisible)
            Center(
              child: blackButton(
                text: 'WRITE A REVIEW',
                onTab: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => reviewPage()),
                  );
                },
              ),
            ),
          SizedBox(height: 20),

        ],
      ),
    );
  }

  void calculateDate() {
    int days = int.tryParse(numberOfDays.text) ?? 0;
    int inputYear = int.tryParse(year.text) ?? 0;

    if (numberOfDays.text.isEmpty || year.text.isEmpty) {
      setState(() {
        errorMessage = 'Both fields are required.';
      });
      return;
    }

    if (inputYear <= 0) {
      setState(() {
        errorMessage = 'Year must be greater than 0.';
      });
      return; // Exit the function early
    }

    if (days < 1 || days > 366) {
      setState(() {
        errorMessage = 'Days must be between 1 and 366.';
      });
      return; // Exit the function early
    }

    DateTime date = DateTime(inputYear).add(Duration(days: days - 1));
    bool isLeap = isLeapYear(inputYear);
    int weekNum = weekOfYear(date);

    setState(() {
      resultDate = DateFormat('dd/MM/yyyy').format(date);
      leapYearText = isLeap ? 'Yes' : 'No';
      weekNumber = weekNum;
      isCheckButtonVisible = false;
      isReviewButtonVisible = true;
      isResetButtonVisible = true;
      errorMessage = null; // Clear error message on successful calculation
    });
  }

  bool isLeapYear(int year) {
    if (year % 4 == 0) {
      if (year % 100 == 0) {
        if (year % 400 == 0) {
          return true;
        }
        return false;
      }
      return true;
    }
    return false;
  }

  int weekOfYear(DateTime date) {
    int dayOfYear = int.parse(DateFormat("D").format(date));
    return ((dayOfYear - date.weekday + 10) / 7).floor();
  }
}