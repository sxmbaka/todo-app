import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/widgets/dialog_box_button.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  VoidCallback onClear;

  DialogBox({
    super.key,
    required this.controller,
    required this.onCancel,
    required this.onSave,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      content: Container(
        height: 230,
        width: 300,
        child: Column(
          children: [
            // get user input
            Text(
              "Add New Task!",
              style: GoogleFonts.ubuntu(
                fontSize: 20,
                color: Colors.redAccent,
              ),
            ),
            Gap(8),
            TextField(
              decoration: InputDecoration(
                focusColor: Colors.black,
                border: InputBorder.none,
                fillColor: Colors.white,
                hintText: "Add task description!",
                hintStyle: GoogleFonts.ubuntu(),
              ),
              cursorColor: Colors.black,
              maxLines: 4,
              minLines: 4,
              enabled: true,
              controller: controller,
            ),
            Gap(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DialogBoxButtom(
                  text: "Save",
                  onPressed: onSave,
                ),
                Gap(10),
                DialogBoxButtom(
                  text: "Cancel",
                  onPressed: onCancel,
                ),
                Gap(10),
                DialogBoxButtom(
                  text: "Clear",
                  onPressed: onClear,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
