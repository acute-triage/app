import 'package:collection/collection.dart';
import 'package:flutter_starter/features/contact_card/domain/contact_reason_card.dart';
import 'package:flutter_starter/features/contact_card/domain/symptom.dart';
import 'package:flutter_starter/features/contact_card/domain/sympton_category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient_contact_card.freezed.dart';

@freezed
class PatientContactCard with _$PatientContactCard {
  const PatientContactCard._();

  const factory PatientContactCard({
    String? name,
    String? cprNumber,
    required ContactReasonCard contactReasonCard,
    @Default(<SymptomCategory, Symptom>{})
    Map<SymptomCategory, Symptom?> findings,
  }) = _PatientContactCard;

  List<Symptom> get symptoms {
    return findings.values.whereNotNull().toList();
  }
}
