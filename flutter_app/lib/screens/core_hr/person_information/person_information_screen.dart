import 'package:flutter/material.dart';
import 'edit_biographical_info_screen.dart';
import 'edit_communication_screen.dart';
import 'edit_ethnicity_religion_screen.dart';
import 'edit_gender_marital_screen.dart';
import 'edit_legislative_screen.dart';
import 'edit_name_address_screen.dart';
import 'edit_national_identifiers_screen.dart';
import '../../../widgets/common/expandable_section_card.dart';
import '../../../widgets/common/info_row.dart';
import '../../../widgets/core_hr/employee_header_card.dart';
import '../../../core/constants/dummy_employee.dart';

class PersonInformationScreen extends StatelessWidget {
  const PersonInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Person Information")),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            EmployeeHeaderCard(
              onProfileTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const EditNameAddressScreen(),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            ExpandableSectionCard(
              title: "Name & Addresses",
              icon: Icons.person_outline,
              onEdit: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const EditNameAddressScreen(),
                  ),
                );
              },
              child: Column(
                children: [
                  InfoRow(label: "Title", value: "Ms"),
                  InfoRow(label: "First Name", value: employeeData.firstName),
                  InfoRow(label: "Last Name", value: employeeData.lastName),
                ],
              ),
            ),

            ExpandableSectionCard(
              title: "Communication Methods",
              icon: Icons.phone_outlined,

              onEdit: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const EditCommunicationScreen(),
                  ),
                );
              },

              child: Column(
                children: [
                  InfoRow(label: "Phone", value: employeeData.phone),
                  InfoRow(label: "Email", value: employeeData.email),
                ],
              ),
            ),
            ExpandableSectionCard(
              title: "National Identifiers",
              icon: Icons.badge_outlined,
              onEdit: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const EditNationalIdentifiersScreen(),
                  ),
                );
              },
              child: Column(
                children: [
                  InfoRow(label: "PAN", value: employeeData.pan),
                  InfoRow(label: "National ID", value: employeeData.nationalId),
                ],
              ),
            ),

            ExpandableSectionCard(
              title: "Biographical Information",
              icon: Icons.cake_outlined,
              onEdit: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const EditBiographicalInfoScreen(),
                  ),
                );
              },
              child: Column(
                children: [
                  InfoRow(label: "DOB", value: employeeData.dateOfBirth),
                  InfoRow(label: "Blood Group", value: employeeData.bloodGroup),
                ],
              ),
            ),

            ExpandableSectionCard(
              title: "Legislative Information",
              icon: Icons.public,
              onEdit: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const EditLegislativeInfoScreen(),
                  ),
                );
              },
              child: Column(
                children: [
                  InfoRow(label: "Country", value: employeeData.country),
                ],
              ),
            ),

            ExpandableSectionCard(
              title: "Gender & Marital Status",
              icon: Icons.people_outline,
              onEdit: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const EditGenderMaritalScreen(),
                  ),
                );
              },
              child: Column(
                children: [
                  InfoRow(label: "Gender", value: employeeData.gender),
                  InfoRow(
                    label: "Marital Status",
                    value: employeeData.maritalStatus,
                  ),
                ],
              ),
            ),

            ExpandableSectionCard(
              title: "Ethnicity & Religion",
              icon: Icons.account_balance_outlined,
              onEdit: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const EditEthnicityReligionScreen(),
                  ),
                );
              },
              child: Column(
                children: [
                  InfoRow(label: "Religion", value: employeeData.religion),
                  InfoRow(label: "Ethnicity", value: employeeData.ethnicity),
                ],
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
