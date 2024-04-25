import 'package:flutter/material.dart';
import 'package:flutter_starter/common/presentation/widgets/ui/text_typography.dart';
import 'package:flutter_starter/features/show/presentation/widgets/show_card.dart';

class ListHeader extends StatelessWidget {
  final String title;

  const ListHeader(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: ShowCard.leftMargin),
      child: TextTypography.headlineMedium(title),
    );
  }
}
