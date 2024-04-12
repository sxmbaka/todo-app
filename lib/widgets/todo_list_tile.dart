import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class TodoListTile extends StatelessWidget {
  final String taskName;
  final bool isTaskComplete;
  final Function(bool?)? onChanged;
  VoidCallback onEdit;
  Function(BuildContext)? onDelete;
  final DateTime dateTimeCreated;

  TodoListTile({
    super.key,
    required this.taskName,
    required this.isTaskComplete,
    required this.onChanged,
    required this.onDelete,
    required this.onEdit,
    required this.dateTimeCreated,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, top: 16, right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Slidable(
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
              padding: const EdgeInsets.only(
                left: 5,
                right: 19,
                top: 18,
                bottom: 6,
              ),
              decoration: BoxDecoration(
                color: Colors.yellow[400],
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
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
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      DateFormat('HH:mm   MM-dd-yyyy').format(dateTimeCreated),
                      style: GoogleFonts.ubuntu(
                        fontSize: 10,
                        color: Colors.red,
                      ),
                    ),
                    
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
