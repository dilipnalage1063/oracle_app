import 'package:flutter/material.dart';
import '../../../core/constants/dummy_employee.dart';

class EditLegislativeInfoScreen extends StatefulWidget {
  const EditLegislativeInfoScreen({super.key});

  @override
  State<EditLegislativeInfoScreen> createState() =>
      _EditLegislativeInfoScreenState();
}

class _EditLegislativeInfoScreenState extends State<EditLegislativeInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController countryController = TextEditingController();

  @override
  void initState() {
    super.initState();
    countryController.text = employeeData.country;
  }

  @override
  void dispose() {
    countryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Legislative Information')),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          height: 55,
          child: ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                employeeData.country = countryController.text.trim();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Legislative information saved'),
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
                'Legislative Information',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: countryController,
                decoration: const InputDecoration(
                  labelText: 'Country',
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
