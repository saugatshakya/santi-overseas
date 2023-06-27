// ignore_for_file: library_private_types_in_public_api


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/controller/app_state_controller.dart';
import 'package:testapp/static/colors.dart';

class SearchableTextField extends StatefulWidget {
  final List<String> suggestions;
  final String label;
  final IconData? icon;
  final double width;
  final FocusNode focusNode;
  final Function(String) onChanged;

  const SearchableTextField(
      {super.key,
      required this.suggestions,
      required this.label,
      this.icon,
      required this.width,
      required this.focusNode,required this.onChanged});

  @override
  _SearchableTextFieldState createState() => _SearchableTextFieldState();
}

class _SearchableTextFieldState extends State<SearchableTextField> {
  final TextEditingController searchText = TextEditingController();
  List<String> suggestions = [];
  bool showSuggesation = true;
  @override
  void initState() {
    suggestions = widget.suggestions;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppStateController>(
        init: appStateController,
        builder: (state) {
          return SizedBox(
            width: widget.width,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: SizedBox(
                  width: widget.width,
                  child: TextField(
                    focusNode: widget.focusNode,
                    style: TextStyle(color: myColors.darkgreen),
                    cursorColor: myColors.darkgreen,
                    controller: searchText,
                    onTap: () {
                      state.requestFocus(widget.focusNode);
                    },
                    onChanged: (val) {
                      setState(() {
                        showSuggesation = true;
                      });
                      widget.onChanged(val);
                    },
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: myColors.lightgreen)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: myColors.darkgreen)),
                        labelText: widget.label,
                        labelStyle: TextStyle(color: myColors.darkgreen),
                        floatingLabelStyle: TextStyle(
                          color: myColors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          backgroundColor: myColors.white,
                        ),
                        prefixIconConstraints:
                            const BoxConstraints(minWidth: 0),
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
                ),
              ),
              // const SizedBox(
              //   height: 8,
              // ),
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     for (int i = 0; i < suggestions.length; i++)
              //       if (suggestions[i]
              //               .toLowerCase()
              //               .contains(searchText.text.toLowerCase()) &&
              //           searchText.text.isNotEmpty &&
              //           showSuggesation &&
              //           widget.focusNode.hasFocus)
              //         Options(
              //           option: suggestions[i],
              //           width: widget.width,
              //           ontap: () {
              //             if (widget.label ==
              //                 "Jobs, Title, Keywords or Company") {
              //               state.changeSearchJob(suggestions[i]);
              //             } else {
              //               state.changeSearchCountry(suggestions[i]);
              //             }
              //             searchText.text = suggestions[i];
              //             log(widget.label + searchText.text);
              //             setState(() {
              //               showSuggesation = false;
              //             });
              //           },
              //         )
              //   ],
              // )
            ]),
          );
        });
  }
}

class Options extends StatefulWidget {
  const Options(
      {super.key,
      required this.width,
      required this.option,
      required this.ontap});
  final double width;
  final String option;
  final Function ontap;

  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animationTween;
  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(microseconds: 100),
      vsync: this,
    );
    _animationTween =
        Tween(begin: 8.0, end: 0.0).animate(_animationController!);
    _animationController!.addListener(() {
      setState(() {});
    });
  }

  void _onTapDown(TapDownDetails details) {
    _animationController!.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _animationController!.reverse();
  }

  bool hovering = false;

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: (_) {
        _onTapUp(_);
        widget.ontap();
      },
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            hovering = true;
          });
        },
        onExit: (_) {
          setState(() {
            hovering = false;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Material(
              borderRadius: BorderRadius.circular(4),
              color: hovering ? Colors.black12 : Colors.white,
              elevation: hovering ? 0 : _animationTween!.value,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    width: widget.width - 54, child: Text(widget.option)),
              )),
        ),
      ),
    );
  }
}
