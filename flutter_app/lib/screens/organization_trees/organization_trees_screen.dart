import 'package:flutter/material.dart';
import '../../app/models/organization_tree_model.dart';
import '../../app/constants/app_colors.dart';
import 'widgets/search_filter_card.dart';
import 'widgets/org_tree_card.dart';

class OrganizationTreesScreen extends StatefulWidget {
  const OrganizationTreesScreen({super.key});

  @override
  State<OrganizationTreesScreen> createState() =>
      _OrganizationTreesScreenState();
}

class _OrganizationTreesScreenState extends State<OrganizationTreesScreen> {
  final _treeCodeController = TextEditingController();
  final _treeNameController = TextEditingController();
  late List<OrgTree> _filteredTrees;

  final Set<int> _defaultExpanded = {1, 3, 4, 7};

  @override
  void initState() {
    super.initState();
    _filteredTrees = List.of(sampleOrgTrees);
  }

  @override
  void dispose() {
    _treeCodeController.dispose();
    _treeNameController.dispose();
    super.dispose();
  }

  void _onSearch() {
    final code = _treeCodeController.text.trim().toLowerCase();
    final name = _treeNameController.text.trim().toLowerCase();

    setState(() {
      _filteredTrees = sampleOrgTrees.where((tree) {
        final matchesCode =
            code.isEmpty || tree.code.toLowerCase().contains(code);
        final matchesName =
            name.isEmpty || tree.name.toLowerCase().contains(name);
        return matchesCode && matchesName;
      }).toList();
    });
  }

  void _onReset() {
    _treeCodeController.clear();
    _treeNameController.clear();
    setState(() => _filteredTrees = List.of(sampleOrgTrees));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left_rounded, size: 28),
          onPressed: () => Navigator.maybePop(context),
          tooltip: 'Back',
        ),
        title: const Text('Organization Trees'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_rounded, size: 24),
            onPressed: () {},
            tooltip: 'Search',
          ),
        ],
      ),
      body: Column(
        children: [
          SearchFilterCard(
            treeCodeController: _treeCodeController,
            treeNameController: _treeNameController,
            onSearch: _onSearch,
            onReset: _onReset,
          ),
          Expanded(
            child: _filteredTrees.isEmpty
                ? const _EmptyState()
                : ListView.separated(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                    itemCount: _filteredTrees.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      final tree = _filteredTrees[index];
                      return OrgTreeCard(
                        key: ValueKey(tree.id),
                        tree: tree,
                        initiallyExpanded: _defaultExpanded.contains(tree.id),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.account_tree_outlined,
            size: 56,
            color: AppColors.textMuted,
          ),
          const SizedBox(height: 16),
          const Text(
            'No trees found',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Try adjusting your search filters.',
            style: TextStyle(fontSize: 13, color: AppColors.textMuted),
          ),
        ],
      ),
    );
  }
}
