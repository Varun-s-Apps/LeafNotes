import 'package:flutter/material.dart';
import 'package:leaf_notes/ui/widgets/common/d_button.dart';
import 'package:leaf_notes/ui/widgets/common/d_category_dropdown.dart';
import 'package:leaf_notes/ui/widgets/common/d_divider.dart';
import 'package:leaf_notes/ui/widgets/common/d_gap.dart';
import 'package:leaf_notes/ui/widgets/common/d_text_field.dart';
import 'package:leaf_notes/utils/constants/colors.dart';
import 'package:leaf_notes/utils/constants/sizes.dart';
import 'package:leaf_notes/utils/text_themes/text_styles.dart';

class UpdateNotePage extends StatefulWidget {
  const UpdateNotePage({super.key});

  @override
  State<UpdateNotePage> createState() => _UpdateNotePageState();
}

class _UpdateNotePageState extends State<UpdateNotePage> {
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
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: dPadding * 2),
            child: Row(
              children: [
                const DCategoryDropdown(),
                const SizedBox(
                  width: dMargin * 2,
                ),
                TextButton(
                    child: Text(
                      "delete",
                      style: body(),
                    ),
                    onPressed: () {}),
              ],
            ),
          ),
        ],
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
                  Text(
                    "26th July 2024 03:11 AM",
                    style: caption(size: 14),
                  ),
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
                //TODO: #4 Update note automatically
                DButton(text: "Update Note", onPressed: () => _updateNote()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _updateNote() {}
}
