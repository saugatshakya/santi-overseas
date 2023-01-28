// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

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
      child: Column(
        children: <Widget>[
          SizedBox(
            child: TextField(
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: widget.label,
                  prefixIconConstraints: const BoxConstraints(minWidth: 0),
                  prefixIcon: widget.icon == null
                      ? const SizedBox(
                          width: 16,
                        )
                      : SizedBox(width: 48, child: Icon(widget.icon))),
              onChanged: (value) {
                setState(() {
                  searchText = value;
                  suggestions = widget.suggestions
                      .where((suggestion) => suggestion
                          .toLowerCase()
                          .contains(searchText.toLowerCase()))
                      .toList();
                });
              },
            ),
          ),
          const SizedBox(height: 10),
          suggestions.isNotEmpty && searchText != ""
              ? Card(
                  child: Column(children: [
                    for (int i = 0; i < suggestions.length; i++)
                      ListTile(
                        title: Text(suggestions[i]),
                      )
                  ]),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
