import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class TodoListTile extends StatelessWidget {
  final String taskName;
  final bool isTaskComplete;
  final Function(bool?)? onChanged;
  VoidCallback onEdit;
  Function(BuildContext)? onDelete;

  TodoListTile({
    super.key,
    required this.taskName,
    required this.isTaskComplete,
    required this.onChanged,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, top: 16, right: 12),
      child: Slidable(
        endActionPane: ActionPane(
          extentRatio: 0.3,
          motion: StretchMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(30),
              onPressed: onDelete,
              icon: Icons.delete,
              backgroundColor: Colors.red,
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.only(
            left: 5,
            right: 19,
            top: 12,
            bottom: 12,
          ),
          decoration: BoxDecoration(
            color: Colors.yellow[400],
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              Checkbox(
                value: isTaskComplete,
                onChanged: onChanged,
                activeColor: Colors.black87,
              ),
              Expanded(
                child: Text(
                  taskName,
                  style: GoogleFonts.ubuntu(
                    fontSize: 17,
                    decoration: isTaskComplete
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                  maxLines: 5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
