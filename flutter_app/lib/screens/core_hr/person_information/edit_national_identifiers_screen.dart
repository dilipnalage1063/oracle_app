import 'package:flutter/material.dart';
import '../../../core/constants/dummy_employee.dart';

class EditNationalIdentifiersScreen extends StatefulWidget {
  const EditNationalIdentifiersScreen({super.key});

  @override
  State<EditNationalIdentifiersScreen> createState() =>
      _EditNationalIdentifiersScreenState();
}

class _EditNationalIdentifiersScreenState
    extends State<EditNationalIdentifiersScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController panController = TextEditingController();
  final TextEditingController nationalIdController = TextEditingController();

  @override
  void initState() {
    super.initState();
    panController.text = employeeData.pan;
    nationalIdController.text = employeeData.nationalId;
  }

  @override
  void dispose() {
    panController.dispose();
    nationalIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit National Identifiers")),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          height: 55,
          child: ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                employeeData.pan = panController.text.trim();
                employeeData.nationalId = nationalIdController.text.trim();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("National identifiers saved")),
                );
                Navigator.pop(context);
              }
            },
            child: const Text("Save Changes"),
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "National Identifiers",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: panController,
                decoration: const InputDecoration(
                  labelText: "PAN",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Required";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: nationalIdController,
                decoration: const InputDecoration(
                  labelText: "National ID",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Required";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
