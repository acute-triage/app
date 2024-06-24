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

  @override
  int get hashCode => name.hashCode ^ symptoms.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SymptomCategory && other.name == name;
  }
}
