// Class symptom with category, description and code
import 'package:flutter_starter/features/contact_card/domain/code.dart';

class Symptom {
  final String description;
  final Code? code;

  const Symptom({
    required this.description,
    this.code,
  });

  @override
  int get hashCode => description.hashCode ^ code.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Symptom &&
        other.description == description &&
        other.code == code;
  }
}
