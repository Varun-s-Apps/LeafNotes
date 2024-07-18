import 'package:flutter/material.dart';


void dSnackBar(BuildContext context, String text, {bool isError = false}) {
  final backgroundColor = isError ? Colors.red.withOpacity(0.8) : Colors.black.withOpacity(0.8);
  final textColor = isError ? Colors.white : Colors.white;

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.transparent,
      duration: const Duration(milliseconds: 1500),
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      content: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              isError ? Icons.error : Icons.info,
              color: textColor,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                text,
                style: TextStyle(color: textColor),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
