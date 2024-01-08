import 'package:flutter/material.dart';

import '../../../../../util/design/color/app_colors.dart';
import '../../../../../util/design/text/app_assets.dart';


const HORIZONTAL_ORIENTATION = 'horizontal';
const VERTICAL_ORIENTATION = 'vertical';


class CustomRadioListTile extends StatefulWidget {

  final List<String> options;

  final Function(String) onSelectedOptionChanged;

  final String selectedOption;

  final String orientation;

  final bool isEditable;

  CustomRadioListTile({required this.options, required this.onSelectedOptionChanged, required this.selectedOption, required this.orientation, required this.isEditable});

  @override
  _CustomRadioListTileState createState() => _CustomRadioListTileState();
}

class _CustomRadioListTileState extends State<CustomRadioListTile> {

  int selectedOptionIndex = -1;


  @override
  Widget build(BuildContext context) {

    for (int i = 0; i < widget.options.length; i++) {
      if(widget.options[i] == widget.selectedOption){
        selectedOptionIndex = i;
      }
    }

    if(widget.options.isEmpty){
      return Container();
    }

    if(widget.orientation == HORIZONTAL_ORIENTATION){
      return Row(
          children: widget.options
              .asMap()
              .entries
              .map(
                (entry) {
              return Expanded(
                child: RadioListTile(
                  contentPadding: const EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 0),
                  title: Text(entry.value, style: const TextStyle(color: DARK_PRIMARY_COLOR, fontSize: 12, fontFamily: MONTSERRAT_FONT),),
                  value: entry.key,
                  activeColor: DARK_PRIMARY_COLOR,
                  groupValue: selectedOptionIndex,
                  onChanged: (value) {
                    if(widget.isEditable){
                      setState(() {
                        selectedOptionIndex = value ?? 0;
                        widget.onSelectedOptionChanged(entry.value);
                      });
                    }
                  },
                ),
              );
            },
          ).toList(),
        );
    }else{
      return Column(
        children: widget.options
            .asMap()
            .entries
            .map(
              (entry) {
            return RadioListTile(
              contentPadding: const EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 0),
              title: Text(entry.value, style: const TextStyle(color: DARK_PRIMARY_COLOR, fontSize: 12, fontFamily: MONTSERRAT_FONT)),
              value: entry.key,
              activeColor: DARK_PRIMARY_COLOR,
              groupValue: selectedOptionIndex,
              onChanged: (value) {
                if(widget.isEditable){
                  setState(() {
                    selectedOptionIndex = value ?? 0;
                    widget.onSelectedOptionChanged(entry.value);
                  });
                }
              },
            );
          },
        ).toList(),
      );
    }
  }
}
