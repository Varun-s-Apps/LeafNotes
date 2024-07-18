import 'package:flutter/material.dart';
import 'package:leaf_notes/ui/widgets/common/d_button.dart';
import 'package:leaf_notes/ui/widgets/common/d_gap.dart';
import 'package:leaf_notes/ui/widgets/common/d_snackbar.dart';
import 'package:leaf_notes/ui/widgets/common/d_text_field.dart';
import 'package:leaf_notes/utils/constants/colors.dart';
import 'package:leaf_notes/utils/constants/sizes.dart';

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
          DTextField(hintText: "Title", controller: _titleController),
          const DGap(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: dPadding),
            decoration: BoxDecoration(
                // color: dBlackColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(dBorderRadius)),
            child: DTextField(hintText: "Description", controller: _descriptionController, maxLines: 10,)
          ),
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
