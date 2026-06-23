import 'package:flutter/material.dart';
import '../../../app/constants/app_colors.dart';
import '../../../app/models/organization_tree_model.dart';
import '../tree_details_screen.dart';

class OrgTreeCard extends StatefulWidget {
  final OrgTree tree;
  final bool initiallyExpanded;

  const OrgTreeCard({
    super.key,
    required this.tree,
    this.initiallyExpanded = false,
  });

  @override
  State<OrgTreeCard> createState() => _OrgTreeCardState();
}

class _OrgTreeCardState extends State<OrgTreeCard> {
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: _isExpanded,
          onExpansionChanged: (expanded) {
            setState(() => _isExpanded = expanded);
          },
          leading: Icon(Icons.account_tree_outlined, color: AppColors.primary),
          title: Text(
            widget.tree.name,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
            'Code: ${widget.tree.code}',
            style: const TextStyle(color: AppColors.textSecondary),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (_isExpanded) ...[
                IconButton(
                  icon: const Icon(Icons.open_in_new, size: 20),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => TreeDetailsScreen(tree: widget.tree),
                      ),
                    );
                  },
                ),
                const Icon(Icons.expand_less),
              ] else
                const Icon(Icons.expand_more),
            ],
          ),
          children: [
            if (widget.tree.hasVersions)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Versions',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ...widget.tree.versions.map((version) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppColors.background,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      version.name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      version.effectiveDateRange,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: AppColors.textSecondary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.open_in_new, size: 18),
                                onPressed: () {
                                  // Navigate to version details if needed
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              )
            else
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoRow('Set', widget.tree.set),
                    const SizedBox(height: 12),
                    _buildInfoRow('Structure', widget.tree.structure),
                    const SizedBox(height: 12),
                    _buildInfoRow(
                      'Effective Start',
                      widget.tree.effectiveStart,
                    ),
                    const SizedBox(height: 12),
                    _buildInfoRow('Effective End', widget.tree.effectiveEnd),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      children: [
        SizedBox(
          width: 120,
          child: Text(
            label,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value.isEmpty ? '—' : value,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
