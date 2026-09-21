import 'package:flutter/material.dart';
import '../main.dart';

class MedicineDetailsScreen extends StatelessWidget {
  final MedicineData medicine;
  const MedicineDetailsScreen({super.key, required this.medicine});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Medicine Details')),
    body: Center(child: Card(margin: const EdgeInsets.all(20), child: Padding(padding: const EdgeInsets.all(24), child: Column(mainAxisSize: MainAxisSize.min, children: [
      const CircleAvatar(radius: 35, child: Icon(Icons.medication, size: 38)),
      const SizedBox(height: 14), Text(medicine.name, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
      const SizedBox(height: 14), Text('Dosage: ${medicine.dosage}'), Text('Time: ${medicine.time}'), Text('Frequency: ${medicine.frequency}'),
      const SizedBox(height: 18), ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text('Back')),
    ])))));
}
