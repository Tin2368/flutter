import 'package:flutter/material.dart';
import 'package:widget_compose/widgets/elements/inputs/search_input.dart';

class HomeNavbar extends StatelessWidget {
  const HomeNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: const Padding(
        padding: EdgeInsets.all(6.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: SearchInput()), //ขยายเต็มพื้นที่
            IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.info_outline_rounded,
                  color: Colors.white70,
                  size: 40,
                )),
          ],
        ),
      ),
    );
  }
}
