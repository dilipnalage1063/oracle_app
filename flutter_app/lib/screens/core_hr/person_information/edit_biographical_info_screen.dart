import 'package:flutter/material.dart';
import '../../../core/constants/dummy_employee.dart';

class EditBiographicalInfoScreen extends StatefulWidget {
  const EditBiographicalInfoScreen({super.key});

  @override
  State<EditBiographicalInfoScreen> createState() =>
      _EditBiographicalInfoScreenState();
}

class _EditBiographicalInfoScreenState
    extends State<EditBiographicalInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController bloodGroupController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dateOfBirthController.text = employeeData.dateOfBirth;
    bloodGroupController.text = employeeData.bloodGroup;
  }

  @override
  void dispose() {
    dateOfBirthController.dispose();
    bloodGroupController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Biographical Information')),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          height: 55,
          child: ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                employeeData.dateOfBirth = dateOfBirthController.text.trim();
                employeeData.bloodGroup = bloodGroupController.text.trim();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Biographical information saved'),
                  ),
                );
                Navigator.pop(context);
              }
            },
            child: const Text('Save Changes'),
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
                'Biographical Information',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: dateOfBirthController,
                decoration: const InputDecoration(
                  labelText: 'DOB',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: bloodGroupController,
                decoration: const InputDecoration(
                  labelText: 'Blood Group',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Required';
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
