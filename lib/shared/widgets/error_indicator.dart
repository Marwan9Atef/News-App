import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorIndicator extends StatelessWidget {
  ErrorIndicator({required this.errorMessage});
String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(errorMessage,style: Theme.of(context).textTheme.titleMedium,));
  }
}
