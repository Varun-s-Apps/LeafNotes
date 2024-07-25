import 'package:flutter/material.dart';
import 'package:leaf_notes/utils/constants/sizes.dart';

class DCategoryDropdown extends StatefulWidget {
  const DCategoryDropdown({super.key});

  @override
  State<DCategoryDropdown> createState() => _DCategoryDropdownState();
}

class _DCategoryDropdownState extends State<DCategoryDropdown> {
  @override
  Widget build(BuildContext context) {
    String? selectedValue;
  final List<String> items = ['😊', '🚀', '🌟' ,'🍕' ,'🎉'];
    return DropdownButton<String>(
      // padding: EdgeInsets.all(dPadding),
      elevation: 50,
      value: selectedValue,
      hint: Text(selectedValue??"❤️",),
      items: items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          selectedValue = newValue;
        });
      },
      dropdownColor: Colors.white,
      alignment: Alignment.centerLeft,
      menuMaxHeight: 200,
      itemHeight: 48,

      borderRadius: BorderRadius.circular(dBorderRadius),
      // itemPadding: EdgeInsets.symmetric(horizontal: 16),
    
    );
  }
}
