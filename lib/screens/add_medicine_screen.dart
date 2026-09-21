import 'package:flutter/material.dart';

class AddMedicineScreen extends StatefulWidget { const AddMedicineScreen({super.key}); @override State<AddMedicineScreen> createState() => _AddMedicineScreenState(); }
class _AddMedicineScreenState extends State<AddMedicineScreen> {
  final name = TextEditingController(); final dosage = TextEditingController();
  @override void dispose(){ name.dispose(); dosage.dispose(); super.dispose(); }
  @override Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Add Medicine')),
    body: SingleChildScrollView(padding: const EdgeInsets.all(20), child: Column(children: [
      TextField(controller: name, decoration: const InputDecoration(labelText: 'Medicine name', border: OutlineInputBorder())),
      const SizedBox(height: 14),
      TextField(controller: dosage, decoration: const InputDecoration(labelText: 'Dosage', border: OutlineInputBorder())),
      const SizedBox(height: 20),
      SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Medicine saved'))), child: const Text('Save Medicine'))),
    ])),
  );
}
