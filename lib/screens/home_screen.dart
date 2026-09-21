import 'package:flutter/material.dart';
import '../main.dart';
import '../widgets/medicine_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const medicines = [
    MedicineData(name: 'Paracetamol', dosage: '500 mg', time: '8:00 AM', frequency: 'After breakfast'),
    MedicineData(name: 'Vitamin D', dosage: '1 tablet', time: '1:00 PM', frequency: 'Once daily'),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Medicine Reminder')),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Stack(children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Theme.of(context).colorScheme.primaryContainer),
                child: const Row(children: [
                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('Good morning!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text('Stay on schedule with your medicines.'),
                  ])),
                  Icon(Icons.health_and_safety_outlined, size: 58),
                ]),
              ),
              const Positioned(right: 12, top: 10, child: Icon(Icons.notifications_active_outlined, size: 20)),
            ]),
            const SizedBox(height: 20),
            const Text("Today's medicines", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            ...medicines.map((m) => Padding(padding: const EdgeInsets.only(bottom: 10), child: MedicineCard(medicine: m))),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: const [Icon(Icons.medication), Icon(Icons.access_time), Icon(Icons.check_circle)]),
            const SizedBox(height: 16),
            SizedBox(width: double.infinity, child: ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.add), label: const Text('Add New Medicine'))),
          ]),
        ),
      );
}
