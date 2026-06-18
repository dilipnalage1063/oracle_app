import 'package:flutter/material.dart';

class PersonSearchScreen extends StatefulWidget {
  const PersonSearchScreen({super.key});

  @override
  State<PersonSearchScreen> createState() => _PersonSearchScreenState();
}

class _PersonSearchScreenState extends State<PersonSearchScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _keywordsController = TextEditingController();
  final TextEditingController _personNumberController = TextEditingController();
  final TextEditingController _nationalIdController = TextEditingController();
  DateTime _selectedDate = DateTime(2025, 5, 18);
  bool _includeTerminated = false;
  int _searchResultsCount = 0;
  List<Map<String, String>> _searchResults = [];

  @override
  void dispose() {
    _nameController.dispose();
    _keywordsController.dispose();
    _personNumberController.dispose();
    _nationalIdController.dispose();
    super.dispose();
  }

  void _performSearch() {
    // Simulate search results
    setState(() {
      _searchResults = [
        {
          'name': 'John Doe',
          'personNumber': 'P001',
          'nationalId': '123-45-6789',
          'department': 'Engineering',
          'location': 'New York',
          'job': 'Senior Developer',
          'assignment': 'Full-time',
        },
        {
          'name': 'Jane Smith',
          'personNumber': 'P002',
          'nationalId': '987-65-4321',
          'department': 'HR',
          'location': 'Los Angeles',
          'job': 'HR Manager',
          'assignment': 'Full-time',
        },
      ];
      _searchResultsCount = _searchResults.length;
    });
  }

  void _resetSearch() {
    setState(() {
      _nameController.clear();
      _keywordsController.clear();
      _personNumberController.clear();
      _nationalIdController.clear();
      _selectedDate = DateTime(2025, 5, 18);
      _includeTerminated = false;
      _searchResults = [];
      _searchResultsCount = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;
    final padding = isSmallScreen ? 12.0 : 16.0;
    
    return Scaffold(
      backgroundColor: const Color(0xFFEEF5FC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F4E8C),
        elevation: 0,
        title: const Text('Core HR Services', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          Stack(
            children: [
              IconButton(icon: const Icon(Icons.notifications_none), onPressed: () {}),
              Positioned(
                right: 6,
                top: 6,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: const Color(0xFFDC2626),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: const BoxConstraints(minWidth: 14, minHeight: 14),
                  child: const Text('12', style: TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section with Person Management
              Container(
                padding: EdgeInsets.all(isSmallScreen ? 16 : 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 8)],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Person Management',
                            style: TextStyle(
                              fontSize: isSmallScreen ? 18 : 20,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF1F2937),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Search, view and manage employee information',
                            style: TextStyle(
                              fontSize: isSmallScreen ? 12 : 13,
                              color: const Color(0xFF6B7280),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: isSmallScreen ? 60 : 70,
                      height: isSmallScreen ? 60 : 70,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE3F2FD),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.people_alt,
                        size: isSmallScreen ? 32 : 40,
                        color: const Color(0xFF64B5F6),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: isSmallScreen ? 12 : 16),

              // Search Form Card
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: EdgeInsets.all(isSmallScreen ? 16 : 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.search, color: Color(0xFF1F4E8C), size: 20),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Search People',
                              style: TextStyle(
                                fontSize: isSmallScreen ? 14 : 16,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFF1F2937),
                              ),
                            ),
                          ),
                          if (!isSmallScreen) ...[
                            TextButton(
                              onPressed: () {},
                              child: const Text('Saved Search', style: TextStyle(color: Color(0xFF1F4E8C), fontSize: 12)),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF9FAFB),
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(color: const Color(0xFFE5E7EB)),
                              ),
                              child: Row(
                                children: const [
                                  Text('All People', style: TextStyle(color: Color(0xFF1F2937), fontSize: 11)),
                                  SizedBox(width: 6),
                                  Icon(Icons.arrow_drop_down, size: 18, color: Color(0xFF6B7280)),
                                ],
                              ),
                            ),
                          ],
                        ],
                      ),
                      if (isSmallScreen) ...[
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 8)),
                                child: const Text('Saved Search', style: TextStyle(color: Color(0xFF1F4E8C), fontSize: 11)),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF9FAFB),
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(color: const Color(0xFFE5E7EB)),
                                ),
                                child: Row(
                                  children: const [
                                    Text('All People', style: TextStyle(color: Color(0xFF1F2937), fontSize: 10)),
                                    SizedBox(width: 4),
                                    Icon(Icons.arrow_drop_down, size: 16, color: Color(0xFF6B7280)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                      SizedBox(height: isSmallScreen ? 12 : 16),

                      // Name & Keywords
                      if (isSmallScreen)
                        Column(
                          children: [
                            _buildFormField(
                              label: '** Name',
                              controller: _nameController,
                              hintText: 'Enter name',
                              isSmallScreen: true,
                            ),
                            const SizedBox(height: 12),
                            _buildFormField(
                              label: '** Keywords',
                              controller: _keywordsController,
                              hintText: 'Enter keywords',
                              isSmallScreen: true,
                            ),
                            const SizedBox(height: 12),
                            _buildFormField(
                              label: '** Person Number',
                              controller: _personNumberController,
                              hintText: 'Enter person number',
                              isSmallScreen: true,
                            ),
                            const SizedBox(height: 12),
                            _buildDateField(),
                            const SizedBox(height: 12),
                            _buildFormField(
                              label: '** National ID',
                              controller: _nationalIdController,
                              hintText: 'Enter national ID',
                              isSmallScreen: true,
                            ),
                          ],
                        )
                      else
                        Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: _buildFormField(
                                    label: '** Name',
                                    controller: _nameController,
                                    hintText: 'Enter name',
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: _buildFormField(
                                    label: '** Keywords',
                                    controller: _keywordsController,
                                    hintText: 'Enter keywords',
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  child: _buildFormField(
                                    label: '** Person Number',
                                    controller: _personNumberController,
                                    hintText: 'Enter person number',
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(child: _buildDateField()),
                              ],
                            ),
                            const SizedBox(height: 16),
                            _buildFormField(
                              label: '** National ID',
                              controller: _nationalIdController,
                              hintText: 'Enter national ID',
                            ),
                          ],
                        ),
                      SizedBox(height: isSmallScreen ? 12 : 16),

                      // Buttons
                      if (isSmallScreen)
                        Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: OutlinedButton(
                                    onPressed: _resetSearch,
                                    style: OutlinedButton.styleFrom(
                                      foregroundColor: const Color(0xFF1F4E8C),
                                      side: const BorderSide(color: Color(0xFF1F4E8C)),
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                                    ),
                                    child: const Text('Reset', style: TextStyle(fontSize: 12)),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: OutlinedButton(
                                    onPressed: () {},
                                    style: OutlinedButton.styleFrom(
                                      foregroundColor: const Color(0xFF1F4E8C),
                                      side: const BorderSide(color: Color(0xFF1F4E8C)),
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                                    ),
                                    child: const Text('Save...', style: TextStyle(fontSize: 12)),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: _performSearch,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF1F4E8C),
                                  padding: const EdgeInsets.symmetric(vertical: 14),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                                ),
                                child: const Text('Search', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                              ),
                            ),
                          ],
                        )
                      else
                        Row(
                          children: [
                            OutlinedButton(
                              onPressed: _resetSearch,
                              style: OutlinedButton.styleFrom(
                                foregroundColor: const Color(0xFF1F4E8C),
                                side: const BorderSide(color: Color(0xFF1F4E8C)),
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              ),
                              child: const Text('Reset', style: TextStyle(fontSize: 12)),
                            ),
                            const SizedBox(width: 12),
                            OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                foregroundColor: const Color(0xFF1F4E8C),
                                side: const BorderSide(color: Color(0xFF1F4E8C)),
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              ),
                              child: const Text('Save...', style: TextStyle(fontSize: 12)),
                            ),
                            const Spacer(),
                            ElevatedButton(
                              onPressed: _performSearch,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF1F4E8C),
                                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                              ),
                              child: const Text('Search', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                            ),
                          ],
                        ),

                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text('* Required', style: TextStyle(color: const Color(0xFF1F4E8C).withValues(alpha: 0.7), fontSize: 10)),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: isSmallScreen ? 12 : 16),

              // Search Results Card
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: EdgeInsets.all(isSmallScreen ? 16 : 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Search Results  $_searchResultsCount',
                              style: TextStyle(
                                fontSize: isSmallScreen ? 13 : 14,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFF1F2937),
                              ),
                            ),
                            if (!isSmallScreen)
                              Row(
                                children: [
                                  TextButton.icon(
                                    onPressed: () {},
                                    icon: const Icon(Icons.arrow_downward, size: 14),
                                    label: const Text('Actions', style: TextStyle(fontSize: 11)),
                                    style: TextButton.styleFrom(foregroundColor: const Color(0xFF1F4E8C)),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text('View', style: TextStyle(fontSize: 11)),
                                    style: TextButton.styleFrom(foregroundColor: const Color(0xFF1F4E8C)),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                      SizedBox(height: isSmallScreen ? 12 : 16),
                      _searchResults.isEmpty
                          ? Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(vertical: isSmallScreen ? 32 : 48),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF9FAFB),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.folder_open_outlined,
                                    size: isSmallScreen ? 48 : 56,
                                    color: const Color(0xFFD1D5DB),
                                  ),
                                  SizedBox(height: isSmallScreen ? 12 : 16),
                                  Text(
                                    'No records found',
                                    style: TextStyle(
                                      fontSize: isSmallScreen ? 13 : 14,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFF6B7280),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16),
                                    child: Text(
                                      'Use the search criteria above to find people',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: isSmallScreen ? 11 : 12,
                                        color: const Color(0xFF9CA3AF),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: DataTable(
                                columnSpacing: isSmallScreen ? 12 : 16,
                                columns: const [
                                  DataColumn(label: Text('Name', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 11))),
                                  DataColumn(label: Text('Person Number', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 11))),
                                  DataColumn(label: Text('National ID', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 11))),
                                  DataColumn(label: Text('Department', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 11))),
                                  DataColumn(label: Text('Location', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 11))),
                                  DataColumn(label: Text('Job', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 11))),
                                  DataColumn(label: Text('Assignment', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 11))),
                                ],
                                rows: _searchResults
                                    .map(
                                      (result) => DataRow(
                                        cells: [
                                          DataCell(Text(result['name'] ?? '', style: const TextStyle(fontSize: 11))),
                                          DataCell(Text(result['personNumber'] ?? '', style: const TextStyle(fontSize: 11))),
                                          DataCell(Text(result['nationalId'] ?? '', style: const TextStyle(fontSize: 11))),
                                          DataCell(Text(result['department'] ?? '', style: const TextStyle(fontSize: 11))),
                                          DataCell(Text(result['location'] ?? '', style: const TextStyle(fontSize: 11))),
                                          DataCell(Text(result['job'] ?? '', style: const TextStyle(fontSize: 11))),
                                          DataCell(Text(result['assignment'] ?? '', style: const TextStyle(fontSize: 11))),
                                        ],
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF1F4E8C),
        unselectedItemColor: const Color(0xFF9CA3AF),
        currentIndex: 3,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Requests',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle_outline),
            label: 'Approvals',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Directory',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildFormField({
    required String label,
    required TextEditingController controller,
    required String hintText,
    bool isSmallScreen = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isSmallScreen ? 10 : 11,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1F2937),
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Color(0xFFB0BEC5), fontSize: 12),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: Color(0xFFE0E0E0), width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: Color(0xFF1F4E8C), width: 1.5),
            ),
          ),
          style: const TextStyle(fontSize: 13),
        ),
      ],
    );
  }

  Widget _buildDateField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '* Effective As-of Date',
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF1F2937)),
        ),
        const SizedBox(height: 6),
        InkWell(
          onTap: () async {
            final pickedDate = await showDatePicker(
              context: context,
              initialDate: _selectedDate,
              firstDate: DateTime(2020),
              lastDate: DateTime(2100),
            );
            if (pickedDate != null) {
              setState(() => _selectedDate = pickedDate);
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: const Color(0xFFE0E0E0)),
            ),
            child: Row(
              children: [
                const Icon(Icons.calendar_today, size: 16, color: Color(0xFF6B7280)),
                const SizedBox(width: 8),
                Text(
                  '${_selectedDate.day} ${_monthName(_selectedDate.month)} ${_selectedDate.year}',
                  style: const TextStyle(fontSize: 13, color: Color(0xFF1F2937)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  String _monthName(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return months[month - 1];
  }
}
