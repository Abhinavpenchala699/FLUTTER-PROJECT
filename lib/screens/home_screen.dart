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
        body: SafeArea(
          child: LayoutBuilder(builder: (context, constraints) {
            final wide = constraints.maxWidth >= 600;
            final padding = wide ? 28.0 : 16.0;
            return SingleChildScrollView(
              padding: EdgeInsets.all(padding),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Stack(children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(wide ? 28 : 22),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Theme.of(context).colorScheme.primaryContainer),
                    child: Row(children: [
                      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text('Good morning!', style: TextStyle(fontSize: wide ? 30 : 24, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        const Text('Stay on schedule with your medicines.'),
                      ])),
                      const Icon(Icons.health_and_safety_outlined, size: 58),
                    ]),
                  ),
                  const Positioned(right: 12, top: 10, child: Icon(Icons.notifications_active_outlined, size: 20)),
                ]),
                const SizedBox(height: 20),
                Row(children: [
                  Expanded(child: _SummaryCard(icon: Icons.medication, value: '2', label: 'Medicines')),
                  Expanded(child: _SummaryCard(icon: Icons.check_circle, value: '1', label: 'Taken')),
                  Expanded(child: _SummaryCard(icon: Icons.alarm, value: '1', label: 'Upcoming')),
                ]),
                const SizedBox(height: 24),
                const Text("Today's medicines", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                if (wide)
                  Row(children: [
                    Expanded(child: MedicineCard(medicine: medicines[0])),
                    const SizedBox(width: 16),
                    Expanded(child: MedicineCard(medicine: medicines[1])),
                  ])
                else
                  ...medicines.map((m) => Padding(padding: const EdgeInsets.only(bottom: 10), child: MedicineCard(medicine: m))),
                const SizedBox(height: 16),
                SizedBox(width: double.infinity, child: ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.add), label: const Text('Add New Medicine'))),
                const SizedBox(height: 12),
                Text('Screen width: ${MediaQuery.of(context).size.width.toStringAsFixed(0)} px', style: Theme.of(context).textTheme.bodySmall),
              ]),
            );
          }),
        ),
      );
}

class _SummaryCard extends StatelessWidget {
  final IconData icon;
  final String value, label;
  const _SummaryCard({required this.icon, required this.value, required this.label});
  @override
  Widget build(BuildContext context) => Card(child: Padding(padding: const EdgeInsets.all(12), child: Column(children: [Icon(icon), Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)), Text(label, textAlign: TextAlign.center)])));
}
