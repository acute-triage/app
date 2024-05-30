// Class SymptonCategory
import 'package:flutter_starter/features/contact_card/domain/symptom.dart';

class SymptomCategory {
  final String name;
  final List<Symptom> symptoms;

  const SymptomCategory({
    required this.name,
    this.symptoms = const [],
  });
}
