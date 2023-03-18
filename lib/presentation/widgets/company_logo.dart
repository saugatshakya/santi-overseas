import 'package:flutter/material.dart';
import 'package:testapp/static/colors.dart';

class CompanyLogo extends StatefulWidget {
  const CompanyLogo({super.key, required this.imageLink});
  final String imageLink;

  @override
  State<CompanyLogo> createState() => _CompanyLogoState();
}

class _CompanyLogoState extends State<CompanyLogo> {    bool hovering = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Center(
      child: MouseRegion(cursor: SystemMouseCursors.click  ,onEnter: (_) {
        setState(() {
          hovering = true;
        });
      },
      onExit: (_) {
        setState(() {
          hovering = false;
        });
      },
        child: Container(
          width: width > 500 ? 164 : 84,
          height: width > 500 ? 164 : 84,
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: hovering?Colors.black12:Colors.white,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(width: 0.5, color: myColors.blue)),
          child: Center(
            child: Image.asset(
              widget.imageLink,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
