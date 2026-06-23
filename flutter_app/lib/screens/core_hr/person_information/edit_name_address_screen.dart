import 'package:flutter/material.dart';
import '../../../core/constants/dummy_employee.dart';

class EditNameAddressScreen extends StatefulWidget {
  const EditNameAddressScreen({super.key});

  @override
  State<EditNameAddressScreen> createState() => _EditNameAddressScreenState();
}

class _EditNameAddressScreenState extends State<EditNameAddressScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();

  final TextEditingController fatherNameController = TextEditingController();

  final TextEditingController grandfatherNameController =
      TextEditingController();

  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController motherFirstController = TextEditingController();

  final TextEditingController motherLastController = TextEditingController();

  final TextEditingController homeAddressController = TextEditingController();

  String selectedTitle = "Ms";
  bool primaryMailing = true;

  @override
  void initState() {
    super.initState();
    selectedTitle = employeeData.title;
    firstNameController.text = employeeData.firstName;
    fatherNameController.text = employeeData.fatherName;
    grandfatherNameController.text = employeeData.grandfatherName;
    lastNameController.text = employeeData.lastName;
    motherFirstController.text = employeeData.motherFirstName;
    motherLastController.text = employeeData.motherLastName;
    homeAddressController.text = employeeData.homeAddress;
    primaryMailing = employeeData.primaryMailing;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Name & Address")),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          height: 55,
          child: ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                employeeData.title = selectedTitle;
                employeeData.firstName = firstNameController.text.trim();
                employeeData.fatherName = fatherNameController.text.trim();
                employeeData.grandfatherName = grandfatherNameController.text
                    .trim();
                employeeData.lastName = lastNameController.text.trim();
                employeeData.motherFirstName = motherFirstController.text
                    .trim();
                employeeData.motherLastName = motherLastController.text.trim();
                employeeData.homeAddress = homeAddressController.text.trim();
                employeeData.primaryMailing = primaryMailing;

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Changes saved successfully")),
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
                "Name Information",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 16),

              DropdownButtonFormField(
                initialValue: selectedTitle,
                decoration: const InputDecoration(
                  labelText: "Title",
                  border: OutlineInputBorder(),
                ),

                items: const [
                  DropdownMenuItem(value: "Mr", child: Text("Mr")),
                  DropdownMenuItem(value: "Ms", child: Text("Ms")),
                  DropdownMenuItem(value: "Mrs", child: Text("Mrs")),
                ],

                onChanged: (value) {
                  setState(() {
                    selectedTitle = value!;
                  });
                },
              ),

              const SizedBox(height: 16),

              _buildTextField(
                controller: firstNameController,
                label: "First Name",
              ),

              const SizedBox(height: 16),

              _buildTextField(
                controller: fatherNameController,
                label: "Second/Father Name",
              ),

              const SizedBox(height: 16),

              _buildTextField(
                controller: grandfatherNameController,
                label: "Third/Grandfather Name",
              ),

              const SizedBox(height: 16),

              _buildTextField(
                controller: lastNameController,
                label: "Last Name",
              ),

              const SizedBox(height: 16),

              _buildTextField(
                controller: motherFirstController,
                label: "Mother First Name",
              ),

              const SizedBox(height: 16),

              _buildTextField(
                controller: motherLastController,
                label: "Mother Last Name",
              ),

              const SizedBox(height: 32),

              const Divider(),

              const SizedBox(height: 16),

              const Text(
                "Address Information",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: homeAddressController,
                maxLines: 4,

                decoration: const InputDecoration(
                  labelText: "Home Address",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              SwitchListTile(
                value: primaryMailing,

                title: const Text("Primary Mailing Address"),

                onChanged: (value) {
                  setState(() {
                    primaryMailing = value;
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
  }) {
    return TextFormField(
      controller: controller,

      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),

      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Required";
        }
        return null;
      },
    );
  }
}
