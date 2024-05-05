import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      //รับข้อมูล
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          // เส้นขอบเมื่อไม่ได้โฟกัส
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(40)),
            borderSide: BorderSide(color: Colors.grey),
          ),
          // เส้นขอบเมื่อถูกโฟกัส
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(40)),
            borderSide: BorderSide(color: Colors.white),
          ),
          suffixIcon: Align(
            widthFactor: 1.0,
            heightFactor: 1.0,
            child: Icon(Icons.search),
          )),
    );
  }
}
