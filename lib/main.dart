import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() => runApp(const MedicineReminderApp());

class MedicineReminderApp extends StatelessWidget {
  const MedicineReminderApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Medicine Reminder',
        theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal), useMaterial3: true),
        home: const HomeScreen(),
      );
}

class MedicineData {
  final String name, dosage, time, frequency;
  const MedicineData({required this.name, required this.dosage, required this.time, required this.frequency});
}
