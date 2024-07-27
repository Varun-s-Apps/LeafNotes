import 'package:flutter/material.dart';
import 'package:leaf_notes/ui/widgets/common/d_button.dart';
import 'package:leaf_notes/ui/widgets/common/d_divider.dart';
import 'package:leaf_notes/ui/widgets/common/d_outlined_button.dart';
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const DDivider(height: 2, thickness: 2),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // DBorderLessTextField(hintText: "Title", controller: _titleController, textStyle: headline(),),
                  DTextField(
                    hintText: "Title",
                    textAlignment: TextAlign.start,
                    controller: _titleController,
                    textStyle: boldHeading(weight: FontWeight.w500, size: 32),
                    isBorderless: true,
                    
                  ),
                  Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: dPadding),
                      decoration: BoxDecoration(
                          // color: dBlackColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(dBorderRadius)),
                      child: DTextField(
                        hintText: "Description",
                        textAlignment: TextAlign.start,
                        textStyle: body(
                            weight: FontWeight.w400, color: dTextGreyColor),
                        padding: 0.0,
                        controller: _descriptionController,
                        isBorderless: true,
                      )),
                  const DGap(),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: dPadding * 2),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Text("❤️", style: caption(size: 15),),
                  ],
                ),
                //TODO: #3 Add note automatically
                DButton(text: "Add Note", onPressed: () => _addNewNote()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _addNewNote() {
    dSnackBar(context, "New Note Added Successfully");
  }
}
