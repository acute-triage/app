import 'package:flutter_starter/features/contact_card/domain/sympton_category.dart';

class ContactReasonCard {
  final String title;
  final int number;
  final List<SymptomCategory> symptomCategories;
  final List<String> searchTerms;

  const ContactReasonCard({
    required this.title,
    required this.number,
    required this.searchTerms,
    this.symptomCategories = const [],
  });
}
