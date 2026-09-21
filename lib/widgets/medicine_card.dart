import 'package:flutter/material.dart';
import '../main.dart';

class MedicineCard extends StatelessWidget {
  final MedicineData medicine;
  final VoidCallback? onTap;
  const MedicineCard({super.key, required this.medicine, this.onTap});

  @override
  Widget build(BuildContext context) => Card(
        child: InkWell(onTap: onTap, borderRadius: BorderRadius.circular(12), child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(children: [
            const CircleAvatar(child: Icon(Icons.medication_outlined)),
            const SizedBox(width: 12),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(medicine.name, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              Text('${medicine.dosage} • ${medicine.frequency}'),
            ])),
            Column(children: [const Icon(Icons.access_time, size: 18), Text(medicine.time)]),
          ]),
        )),
      );
}
