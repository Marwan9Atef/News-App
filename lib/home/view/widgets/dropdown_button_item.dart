import 'package:flutter/material.dart';

import '../../../shared/app_theme.dart';

class DropdownButtonItem extends StatefulWidget {
  String selectedOption;
  List<String>options;
  DropdownButtonItem({required this.selectedOption,required this.options});

  @override
  State<DropdownButtonItem> createState() => _DropdownButtonItemState();
}

class _DropdownButtonItemState extends State<DropdownButtonItem> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      style: Theme.of(context).textTheme.titleLarge,
      value:widget.selectedOption,
      isExpanded: true,
      focusColor: AppTheme.black,
      underline: const SizedBox(),
      dropdownColor: AppTheme.black,
      borderRadius: BorderRadius.circular(16),
      iconDisabledColor: AppTheme.white,
      iconEnabledColor: AppTheme.white,
      items:widget.options.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(value: value, child: Text(value));
      }).toList(),
      onChanged: (value) {
        if(widget.selectedOption==value)return;
       widget.selectedOption=value!;
        setState(() {

        });
      },



    ) ;
  }
}
