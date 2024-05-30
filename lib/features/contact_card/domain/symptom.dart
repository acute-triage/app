// Class symptom with category, description and code
import 'package:flutter_starter/features/contact_card/domain/code.dart';

class Symptom {
  final String description;
  final Code code;

  const Symptom({
    required this.description,
    required this.code,
  });
}
