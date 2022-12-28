import 'package:flutter/material.dart';
import 'package:quitanda_virtual/src/config/custom_colors.dart';

class QuantityWidget extends StatelessWidget {
  int value;
  final String suffixText;
  final Function(int quantity) result;
  final bool isRemovable; 

  QuantityWidget(
      {required this.value, required this.suffixText, required this.result, this.isRemovable = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300, spreadRadius: 1, blurRadius: 2),
          ]),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _QuantityButton(
            color: isRemovable && value == 1 ? Colors.red : Colors.grey,
            icon: isRemovable && value == 1 ? Icons.delete_forever : Icons.remove,
            onPressed: () {
              if (value == 1 && !isRemovable) {
                return;
              }
              int resultCount = value - 1;

              result(resultCount);
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              '${value}${suffixText}',
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          _QuantityButton(
              color: CustomColors.customSwatchColor[900]!,
              icon: Icons.add,
              onPressed: () {
                int resultCount = value + 1;
                result(resultCount);
              }),
        ],
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final VoidCallback onPressed;

  _QuantityButton(
      {required this.color, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(50),
        child: Ink(
          height: 25,
          width: 25,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
          child: Icon(
            icon,
            color: Colors.white,
            size: 16,
          ),
        ),
      ),
    );
  }
}
