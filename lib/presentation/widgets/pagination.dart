// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/controller/app_state_controller.dart';
import 'package:testapp/static/colors.dart';

class NumberPagination extends StatefulWidget {
  /// Creates a NumberPagination widget.
  const NumberPagination({
    super.key,
    required this.onPageChanged,
    required this.pageTotal,
    this.threshold = 10,
    this.pageInit = 1,
    this.colorPrimary = Colors.black,
    this.colorSub = Colors.white,
    this.controlButton,
    this.iconToFirst,
    this.iconPrevious,
    this.iconNext,
    this.iconToLast,
    this.fontSize = 15,
    this.fontFamily,
  });

  ///Trigger when page changed
  final Function(int) onPageChanged;

  ///End of numbers.
  final int pageTotal;

  ///Page number to be displayed first
  final int pageInit;

  ///Numbers to show at once.
  final int threshold;

  ///Color of numbers.
  final Color colorPrimary;

  ///Color of background.
  final Color colorSub;

  ///to First, to Previous, to next, to Last Button UI.
  final Widget? controlButton;

  ///The icon of button to first.
  final Widget? iconToFirst;

  ///The icon of button to previous.
  final Widget? iconPrevious;

  ///The icon of button to next.
  final Widget? iconNext;

  ///The icon of button to last.
  final Widget? iconToLast;

  ///The size of numbers.
  final double fontSize;

  ///The fontFamily of numbers.
  final String? fontFamily;

  @override
  _NumberPaginationState createState() => _NumberPaginationState();
}

class _NumberPaginationState extends State<NumberPagination> {
  late int rangeStart;
  late int rangeEnd;
  late int currentPage;
  late final Widget iconToFirst;
  late final Widget iconPrevious;
  late final Widget iconNext;
  late final Widget iconToLast;

  @override
  void initState() {
    currentPage = widget.pageInit;
    iconToFirst = widget.iconToFirst ?? const Icon(Icons.first_page);
    iconPrevious = widget.iconPrevious ?? const Icon(Icons.keyboard_arrow_left);
    iconNext = widget.iconNext ?? const Icon(Icons.keyboard_arrow_right);
    iconToLast = widget.iconToLast ?? const Icon(Icons.last_page);

    _rangeSet();

    super.initState();
  }

  Widget _defaultControlButton(Widget icon) {
    return AbsorbPointer(
      child: TextButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(5.0),
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
          minimumSize: MaterialStateProperty.all(const Size(48, 48)),
        ),
        onPressed: () {},
        child: icon,
      ),
    );
  }

  void _changePage(int page) {
    if (page <= 0) page = 1;

    if (page > widget.pageTotal) page = widget.pageTotal;

    setState(() {
      currentPage = page;
      _rangeSet();
      widget.onPageChanged(currentPage);
    });
  }

  void _rangeSet() {
    rangeStart = currentPage % widget.threshold == 0
        ? currentPage - widget.threshold
        : (currentPage ~/ widget.threshold) * widget.threshold;

    rangeEnd = rangeStart + widget.threshold;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppStateController>(
        init: appStateController,
        builder: (state) {
          return Row(
            children: [
              InkWell(
                onTap: () => _changePage(--currentPage),
                child: Stack(
                  children: [
                    if (widget.controlButton != null) ...[
                      widget.controlButton!,
                      iconPrevious
                    ] else
                      _defaultControlButton(iconPrevious),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              ...List.generate(
                rangeEnd <= widget.pageTotal
                    ? widget.threshold
                    : widget.pageTotal % widget.threshold,
                (index) => Flexible(
                  child: InkWell(
                    hoverColor: Colors.black12,
                    enableFeedback: true,
                    onTap: () {
                      _changePage(index + 1 + rangeStart);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        elevation: state.pagination == (index + 1) ? 4 : 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                        color: (currentPage - 1) % widget.threshold == index
                            ? myColors.darkgreen
                            : Colors.grey[200],
                        child: SizedBox(
                          width: 32,
                          height: 32,
                          child: Center(
                            child: Text(
                              '${index + 1 + rangeStart}',
                              style: TextStyle(
                                  color: (currentPage - 1) % widget.threshold ==
                                          index
                                      ? Colors.white
                                      : myColors.darkgreen,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () => _changePage(++currentPage),
                child: Stack(
                  children: [
                    if (widget.controlButton != null) ...[
                      widget.controlButton!,
                      iconNext
                    ] else
                      _defaultControlButton(iconNext),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
