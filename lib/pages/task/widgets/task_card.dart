import 'package:flareline_crm/core/models/task_model.dart';
import 'package:flareline_crm/core/theme/crm_colors.dart';
import 'package:flareline_uikit/components/card/common_card.dart';
import 'package:flareline_uikit/components/image/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_stack/flutter_image_stack.dart';

class TaskCard extends StatelessWidget {
  final TaskModel task;
  final Color tagColor;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;

  const TaskCard({
    super.key,
    required this.task,
    required this.tagColor,
    this.onDelete,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return CommonCard(
      width: 300,
      height: 215,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: tagColor,
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                      color: tagColor.withValues(alpha: 0.26),
                      offset: const Offset(0, 6),
                      blurRadius: 12.0,
                      spreadRadius: 0.0,
                    ),
                  ],
                ),
                child: ImageWidget(
                  imageUrl: task.image,
                  width: 24,
                  height: 24,
                ),
              ),
              const Spacer(),
              PopupMenuButton<String>(
                icon: const Icon(
                  Icons.more_horiz,
                  color: CrmColors.paragraph,
                ),
                onSelected: (value) {
                  switch (value) {
                    case 'edit':
                      onEdit?.call();
                      break;
                    case 'delete':
                      onDelete?.call();
                      break;
                  }
                },
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'edit',
                    child: Row(
                      children: [
                        Icon(Icons.edit, size: 16),
                        SizedBox(width: 8),
                        Text('Modifier'),
                      ],
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'delete',
                    child: Row(
                      children: [
                        Icon(Icons.delete, size: 16, color: Colors.red),
                        SizedBox(width: 8),
                        Text('Supprimer', style: TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            '[${task.name} ${task.task}]',
            style: const TextStyle(color: CrmColors.heading),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: const BoxDecoration(color: Color(0xFFF6FFF5)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.access_time_outlined,
                        size: 18, color: CrmColors.green),
                    const SizedBox(width: 6),
                    Text(task.days,
                        style: const TextStyle(
                            fontSize: 12, color: CrmColors.green))
                  ],
                ),
              ),
              const Spacer(),
              FlutterImageStack(
                imageList: task.users,
                showTotalCount: false,
                totalCount: task.users.length,
                itemRadius: 32,
                itemCount: 3,
                itemBorderWidth: 3,
              )
            ],
          )
        ],
      ),
    );
  }
}
