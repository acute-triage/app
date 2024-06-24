// Class SymptonCategory
import 'package:collection/collection.dart';
import 'package:flutter_starter/features/contact_card/domain/code.dart';
import 'package:flutter_starter/features/contact_card/domain/symptom.dart';
import 'package:flutter_starter/features/contact_card/domain/sympton_category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'finding.freezed.dart';

@freezed
class Finding with _$Finding {
  const Finding._();

  const factory Finding({
    required SymptomCategory category,
    required List<Symptom> symptoms,
  }) = _SymptomCategory;

  Code get code {
    if (category.type == SymptomCategoryType.symptomCode) {
      return symptoms.isEmpty ? Code.green() : symptoms.first.code!;
    }

    // Sort keys in descending order
    List<int> sortedKeys = category.symptomsCountToCode!.keys.toList()
      ..sort((a, b) => b.compareTo(a));

    for (int key in sortedKeys) {
      if (symptoms.length >= key) {
        return category.symptomsCountToCode![key]!;
      }
    }

    // Return a default code if none match (optional)
    return Code.green();
  }

  @override
  int get hashCode => category.hashCode ^ symptoms.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Finding &&
        other.category == category &&
        const ListEquality().equals(other.symptoms, symptoms);
  }
}
