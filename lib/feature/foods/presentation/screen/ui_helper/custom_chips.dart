import 'package:flutter/material.dart';

import '../../../../../util/design/color/app_colors.dart';

class DynamicChips extends StatefulWidget {

  final List<String> items;

  final Function(String) onItemRemoved;

  DynamicChips({required this.items, required this.onItemRemoved});

  @override
  _DynamicChipsState createState() => _DynamicChipsState();
}

class _DynamicChipsState extends State<DynamicChips> {

  int selectedOptionIndex = -1;

  @override
  Widget build(BuildContext context) {
    return  Wrap(
      spacing: 24,
      children: widget.items.map(
            (item) {
          return Chip(
            backgroundColor: DARK_PRIMARY_COLOR,
            onDeleted: () {
              widget.onItemRemoved(item);
            },
            deleteIcon: const Icon(Icons.remove_circle, color: Colors.white,),
            label: Text(item, style: const TextStyle(color: Colors.white),),
          );
        },
      ).toList(),
    );
  }
}


