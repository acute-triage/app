// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

const LEFT_CONTENT_PADDING = 12.0;
const RIGHT_CONTENT_PADDING = 12.0;
const TOP_CONTENT_PADDING = 16.0;

class ContentPadding extends StatelessWidget {
  final Widget child;
  final bool vertical;
  final bool noBottomPadding;

  const ContentPadding({
    super.key,
    required this.child,
    this.vertical = false,
    this.noBottomPadding = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: noBottomPadding
          ? const EdgeInsets.only(
              left: LEFT_CONTENT_PADDING,
              right: RIGHT_CONTENT_PADDING,
              top: TOP_CONTENT_PADDING,
            )
          : EdgeInsets.symmetric(
              horizontal: (LEFT_CONTENT_PADDING + RIGHT_CONTENT_PADDING) / 2,
              vertical: vertical ? TOP_CONTENT_PADDING : 0,
            ),
      child: child,
    );
  }
}
