import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/medicines_screen.dart';
import 'screens/add_medicine_screen.dart';
import 'screens/medicine_details_screen.dart';

void main() => runApp(const MedicineReminderApp());

class MedicineReminderApp extends StatelessWidget {
  const MedicineReminderApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Medicine Reminder',
        theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal), useMaterial3: true),
        initialRoute: '/',
        routes: {
          '/': (_) => const HomeScreen(),
          '/medicines': (_) => const MedicinesScreen(),
          '/add': (_) => const AddMedicineScreen(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == '/details') {
            final medicine = settings.arguments as MedicineData;
            return MaterialPageRoute(builder: (_) => MedicineDetailsScreen(medicine: medicine));
          }
          return null;
        },
      );
}

class MedicineData {
  final String name, dosage, time, frequency;
  const MedicineData({required this.name, required this.dosage, required this.time, required this.frequency});
}
