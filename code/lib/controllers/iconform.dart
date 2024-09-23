import 'package:flutter/material.dart';

import '../DTO/List_icon.dart';

class IconForm extends StatelessWidget {
  IconForm({super.key, this.cattype, required this.onChanged});

  final String? cattype;
  final ValueChanged<String?> onChanged;
  final IconClass appIcons = IconClass();

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: cattype,
      isExpanded: true,
      hint: const Text("Sélectionner catégorie"),
      items: appIcons.homeExpensesCategories
          .map((e) => DropdownMenuItem<String>(
        value: e['name'],
        child: Row(
          children: [
            Icon(
              e['icon'],
              color: Colors.black45,
            ),
            Text(
              e['name'],
              style: const TextStyle(color: Colors.black45),
            ),
          ],
        ),
      ))
          .toList(),
      onChanged: onChanged,
    );
  }
}
