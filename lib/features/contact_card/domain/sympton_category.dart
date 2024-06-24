import 'package:flutter_starter/features/contact_card/data/codes.dart';
import 'package:flutter_starter/features/contact_card/domain/code.dart';
import 'package:flutter_starter/features/contact_card/domain/symptom.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sympton_category.freezed.dart';

enum SymptomCategoryType {
  /// The code is determined by the highest priority symptom
  symptomCode,

  /// The code is determined by the number of symptoms reported
  symptomsCountToCode,
}

@freezed
class SymptomCategory with _$SymptomCategory {
  const SymptomCategory._();

  const factory SymptomCategory({
    required String name,
    required List<Symptom> symptoms,
    @Default(SymptomCategoryType.symptomCode) SymptomCategoryType type,
    Map<int, Code>? symptomsCountToCode,
  }) = _SymptomCategory;

  /// Returns the code for the symptom category, based on the type
  Code get code {
    if (type == SymptomCategoryType.symptomCode) {
      return symptoms.isEmpty ? codeGreen : symptoms.first.code!;
    }

    // Sort keys in descending order
    List<int> orderedSymptomsWithHighestCount =
        symptomsCountToCode!.keys.toList()..sort((a, b) => b.compareTo(a));

    for (int key in orderedSymptomsWithHighestCount) {
      if (symptoms.length >= key) {
        return symptomsCountToCode![key]!;
      }
    }

    // Return a default code if none match (optional)
    return codeGreen;
  }

  @override
  int get hashCode => name.hashCode ^ symptoms.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SymptomCategory && other.name == name;
  }
}
