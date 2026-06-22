import 'package:flutter/material.dart';
import '../../../core/constants/dummy_employee.dart';

class EditCommunicationScreen extends StatefulWidget {
  const EditCommunicationScreen({super.key});

  @override
  State<EditCommunicationScreen> createState() =>
      _EditCommunicationScreenState();
}

class _EditCommunicationScreenState extends State<EditCommunicationScreen> {
  final _formKey = GlobalKey<FormState>();

  final phoneController = TextEditingController();

  final emailController = TextEditingController();

  final communicationController = TextEditingController();

  String preference = "Mobile";

  @override
  void initState() {
    super.initState();
    phoneController.text = employeeData.phone;
    emailController.text = employeeData.email;
    communicationController.text = employeeData.communicationAccount;
    preference = employeeData.communicationPreference;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Communication Methods")),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          height: 55,
          child: ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                employeeData.phone = phoneController.text.trim();
                employeeData.email = emailController.text.trim();
                employeeData.communicationAccount = communicationController.text
                    .trim();
                employeeData.communicationPreference = preference;

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Communication details saved")),
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
                "Phone Details",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,

                decoration: const InputDecoration(
                  labelText: "Phone Number",
                  prefixIcon: Icon(Icons.phone_outlined),
                  border: OutlineInputBorder(),
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Required";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 30),

              const Text(
                "Email Details",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,

                decoration: const InputDecoration(
                  labelText: "Email Address",
                  prefixIcon: Icon(Icons.email_outlined),
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                "Other Communication Accounts",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: communicationController,

                decoration: const InputDecoration(
                  labelText: "Teams / Skype / Slack",
                  prefixIcon: Icon(Icons.chat_outlined),
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                "Order of Preference",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 16),

              DropdownButtonFormField(
                initialValue: preference,
                decoration: const InputDecoration(border: OutlineInputBorder()),

                items: const [
                  DropdownMenuItem(value: "Mobile", child: Text("Mobile")),
                  DropdownMenuItem(value: "Email", child: Text("Email")),
                  DropdownMenuItem(value: "Teams", child: Text("Teams")),
                ],

                onChanged: (value) {
                  setState(() {
                    preference = value!;
                  });
                },
              ),

              const SizedBox(height: 120),
            ],
          ),
        ),
      ),
    );
  }
}
