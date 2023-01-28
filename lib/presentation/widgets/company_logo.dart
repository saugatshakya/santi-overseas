import 'package:flutter/material.dart';

class CompanyLogo extends StatelessWidget {
  const CompanyLogo({super.key, required this.imageLink});
  final String imageLink;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 164,
      height: 100,
      child: Chip(
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
