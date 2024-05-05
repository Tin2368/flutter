import 'package:flutter/material.dart';
import 'package:widget_compose/widgets/elements/texts/small_text.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final Color? titleColor;

  const PrimaryButton({super.key, required this.title, this.titleColor});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
            backgroundColor: const Color(0xFFEBEBEB),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
            )),
        child: SmallText(
          title: title,
          color: titleColor,
        ));
  }
}
