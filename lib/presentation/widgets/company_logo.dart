import 'package:flutter/material.dart';

class CompanyLogo extends StatelessWidget {
  const CompanyLogo({super.key, required this.imageLink});
  final String imageLink;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width > 500 ? 164 : 84,
      height: width > 500 ? 164 : 84,
      child: Chip(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
            side: const BorderSide(width: 0.2)),
        padding: const EdgeInsets.all(0),
        label: Image.network(
          imageLink,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
