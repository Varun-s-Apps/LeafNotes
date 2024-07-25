import 'package:flutter/material.dart';
import 'package:leaf_notes/ui/widgets/common/d_button.dart';
import 'package:leaf_notes/ui/widgets/common/d_gap.dart';
import 'package:leaf_notes/ui/widgets/common/d_snackbar.dart';
import 'package:leaf_notes/ui/widgets/common/d_text_field.dart';
import 'package:leaf_notes/utils/constants/colors.dart';
import 'package:leaf_notes/utils/constants/sizes.dart';
import 'package:leaf_notes/utils/text_themes/text_styles.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key});

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  //TO PREVENT MEMORY LEAKAGE
  void dispose() {
    _descriptionController.dispose();
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Note"),
      ),
      body: Column(
        children: [
          DTextField(
            hintText: "Title",
            textAlignment: TextAlign.start,
            controller: _titleController,
            textStyle: boldHeading(weight: FontWeight.w500, size: 32),
            isBorderless: true,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: dPadding),
            child: DTextField(
              hintText: "Description",
              textAlignment: TextAlign.start,
              textStyle: body(weight: FontWeight.w400, color: dTextGreyColor),
              padding: 0.0,
              controller: _descriptionController,
              isBorderless: true,
            ),
          ),
          // const DGap(),

          const DGap(),
          DButton(text: "Add New Note", onPressed: () => _addNewNote())
        ],
      ),
    );
  }

  void _addNewNote() {
    dSnackBar(context, "New Note Added Successfully");
  }
}
