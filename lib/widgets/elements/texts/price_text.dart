import 'package:flutter/material.dart';

class PriceText extends StatelessWidget {
  final String price;
  final Color? color;
  final double? fontsize;

  const PriceText({super.key, required this.price, this.color, this.fontsize});

  @override
  Widget build(BuildContext context) {
    return Text(
      price,
      style: TextStyle(
        color: color ?? Colors.white,
        fontSize: fontsize ?? 16 ,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}