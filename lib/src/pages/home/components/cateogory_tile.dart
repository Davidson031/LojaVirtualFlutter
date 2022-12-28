import 'package:flutter/material.dart';
import 'package:quitanda_virtual/src/config/custom_colors.dart';

class CategoryTile extends StatelessWidget {

  final String category;
  final bool isSelected;
  final VoidCallback onPressed;

  CategoryTile({required this.category, required this.isSelected, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: onPressed,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isSelected ? CustomColors.customSwatchColor[800] : Colors.transparent,
          ),
          child: Text(
            category,
            style: TextStyle(
              color: isSelected ? Colors.white : CustomColors.customContrastColor,
              fontWeight: FontWeight.bold,
              fontSize: isSelected ? 16 : 14
            ),
          ),
        ),
      ),
    );
  }
}