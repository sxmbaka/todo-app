import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TodoListTile extends StatelessWidget {
  final String taskName;
  final bool isTaskComplete;
  final Function(bool?)? onChanged;

  TodoListTile({
    super.key,
    required this.taskName,
    required this.isTaskComplete,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      decoration: BoxDecoration(
        color: Colors.yellow[400],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Checkbox(
            value: isTaskComplete,
            onChanged: onChanged,
            activeColor: Colors.black87,
          ),
          Text(
            taskName,
            style: GoogleFonts.ubuntu(
              fontSize: 17,
              decoration: isTaskComplete
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
            maxLines: 5,
          ),
        ],
      ),
    );
  }
}
