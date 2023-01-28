// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:testapp/static/colors.dart';

class SearchableTextField extends StatefulWidget {
  final List<String> suggestions;
  final String label;
  final IconData? icon;
  final double width;

  const SearchableTextField(
      {super.key,
      required this.suggestions,
      required this.label,
      this.icon,
      required this.width});

  @override
  _SearchableTextFieldState createState() => _SearchableTextFieldState();
}

class _SearchableTextFieldState extends State<SearchableTextField> {
  String searchText = '';
  List<String> suggestions = [];

  @override
  void initState() {
    suggestions = widget.suggestions;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      constraints: const BoxConstraints(maxHeight: 300, maxWidth: 300),
      child: Autocomplete(
        optionsBuilder: (TextEditingValue textEditingValue) {
          if (textEditingValue.text == '') {
            return const Iterable<String>.empty();
          } else {
            List<String> matches = <String>[];
            matches.addAll(suggestions);
            matches.retainWhere((s) {
              return s
                  .toLowerCase()
                  .contains(textEditingValue.text.toLowerCase());
            });
            return matches;
          }
        },
        onSelected: (String selection) {
          print('You just selected $selection');
        },
        fieldViewBuilder: (_, __, ___, ____) => TextField(
          focusNode: ___,
          controller: __,
          style: TextStyle(color: myColors.darkgreen),
          cursorColor: myColors.darkgreen,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: myColors.lightgreen)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: myColors.darkgreen)),
              labelText: widget.label,
              labelStyle: TextStyle(color: myColors.darkgreen),
              prefixIconConstraints: const BoxConstraints(minWidth: 0),
              prefixIcon: widget.icon == null
                  ? const SizedBox(
                      width: 16,
                    )
                  : SizedBox(
                      width: 48,
                      child: Icon(
                        widget.icon,
                        color: myColors.darkgreen,
                      ))),
        ),

        // optionsViewBuilder: (context, onSelected, options) => Center(
        //       child: Card(
        //         child: Container(
        //           constraints: BoxConstraints(
        //             minHeight: 5.0,
        //             minWidth: 5.0,
        //             maxHeight: 100.0,
        //             maxWidth: 100.0,
        //           ),
        //           child: Column(
        //             children: [
        //               for (int i = 0; i < options.length; i++)
        //                 Text(options.elementAt(i))
        //             ],
        //           ),
        //         ),
        //       ),
        //     )
      ),
    );
  }
}
