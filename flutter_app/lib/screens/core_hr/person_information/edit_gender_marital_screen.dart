import 'package:flutter/material.dart';
import '../../../core/constants/dummy_employee.dart';

class EditGenderMaritalScreen extends StatefulWidget {
  const EditGenderMaritalScreen({super.key});

  @override
  State<EditGenderMaritalScreen> createState() =>
      _EditGenderMaritalScreenState();
}

class _EditGenderMaritalScreenState extends State<EditGenderMaritalScreen> {
  final _formKey = GlobalKey<FormState>();

  String gender = 'Female';
  String maritalStatus = 'Single';

  @override
  void initState() {
    super.initState();
    gender = employeeData.gender;
    maritalStatus = employeeData.maritalStatus;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Gender & Marital Status')),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          height: 55,
          child: ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                employeeData.gender = gender;
                employeeData.maritalStatus = maritalStatus;

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Gender and marital status saved'),
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
                'Gender',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 16),

              DropdownButtonFormField<String>(
                initialValue: gender,
                decoration: const InputDecoration(
                  labelText: 'Gender',
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(value: 'Female', child: Text('Female')),
                  DropdownMenuItem(value: 'Male', child: Text('Male')),
                  DropdownMenuItem(value: 'Other', child: Text('Other')),
                ],
                onChanged: (value) {
                  setState(() {
                    gender = value!;
                  });
                },
              ),

              const SizedBox(height: 30),

              const Text(
                'Marital Status',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 16),

              DropdownButtonFormField<String>(
                initialValue: maritalStatus,
                decoration: const InputDecoration(
                  labelText: 'Marital Status',
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(value: 'Single', child: Text('Single')),
                  DropdownMenuItem(value: 'Married', child: Text('Married')),
                  DropdownMenuItem(value: 'Divorced', child: Text('Divorced')),
                  DropdownMenuItem(value: 'Widowed', child: Text('Widowed')),
                ],
                onChanged: (value) {
                  setState(() {
                    maritalStatus = value!;
                  });
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
