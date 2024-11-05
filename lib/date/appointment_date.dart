import 'package:flutter/material.dart';

class AppointmentDate extends StatelessWidget {
  final String date;

  const AppointmentDate({
    Key? key,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        date,
        style: TextStyle(
          color: Colors.grey[800],
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}