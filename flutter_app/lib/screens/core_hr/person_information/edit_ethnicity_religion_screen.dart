import 'package:flutter/material.dart';
import '../../../core/constants/dummy_employee.dart';

class EditEthnicityReligionScreen extends StatefulWidget {
  const EditEthnicityReligionScreen({super.key});

  @override
  State<EditEthnicityReligionScreen> createState() =>
      _EditEthnicityReligionScreenState();
}

class _EditEthnicityReligionScreenState
    extends State<EditEthnicityReligionScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController religionController = TextEditingController();
  final TextEditingController ethnicityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    religionController.text = employeeData.religion;
    ethnicityController.text = employeeData.ethnicity;
  }

  @override
  void dispose() {
    religionController.dispose();
    ethnicityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Ethnicity & Religion')),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          height: 55,
          child: ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                employeeData.religion = religionController.text.trim();
                employeeData.ethnicity = ethnicityController.text.trim();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Ethnicity and religion saved')),
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
                'Religion',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: religionController,
                decoration: const InputDecoration(
                  labelText: 'Religion',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              const Text(
                'Ethnicity',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: ethnicityController,
                decoration: const InputDecoration(
                  labelText: 'Ethnicity',
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
