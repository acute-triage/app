import 'package:flutter_starter/features/contact_card/domain/sympton_category.dart';

class ContactReasonCard {
  final String title;
  final int number;
  final List<SymptomCategory> symptomCategories;

  const ContactReasonCard({
    required this.title,
    required this.number,
    this.symptomCategories = const [],
  });
}
