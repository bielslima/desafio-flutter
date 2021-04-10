import 'package:flutter/material.dart';

class FeatureWidget extends StatelessWidget {
  final String label;
  final String value;

  final TextStyle? labelStyle;
  final TextStyle? valueStyle;
  FeatureWidget(
    this.label,
    this.value, {
    this.labelStyle,
    this.valueStyle,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            this.label,
            style: this.labelStyle ?? TextStyle(),
          ),
          Text(": "),
          Text(
            this.value,
            style: this.valueStyle ?? TextStyle(),
          ),
        ],
      ),
    );
  }
}
