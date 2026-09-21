import 'package:flutter/material.dart';
import '../main.dart';
import '../widgets/medicine_card.dart';

class MedicinesScreen extends StatelessWidget {
  const MedicinesScreen({super.key});
  static const medicines = [
    MedicineData(name: 'Paracetamol', dosage: '500 mg', time: '8:00 AM', frequency: 'After breakfast'),
    MedicineData(name: 'Vitamin D', dosage: '1 tablet', time: '1:00 PM', frequency: 'Once daily'),
    MedicineData(name: 'Calcium', dosage: '600 mg', time: '8:00 PM', frequency: 'After dinner'),
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('My Medicines')),
    body: ListView(padding: const EdgeInsets.all(16), children: medicines.map((m) => Padding(padding: const EdgeInsets.only(bottom: 10), child: MedicineCard(medicine: m, onTap: () => Navigator.pushNamed(context, '/details', arguments: m)))).toList()),
    floatingActionButton: FloatingActionButton.extended(onPressed: () => Navigator.pushNamed(context, '/add'), icon: const Icon(Icons.add), label: const Text('Add')),
  );
}
