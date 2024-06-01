import 'package:collection/collection.dart';
import 'package:flutter_starter/features/contact_card/data/codes.dart';
import 'package:flutter_starter/features/contact_card/domain/code.dart';
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

  List<Symptom> get symptomsOrderedByPriority {
    return symptoms..sort((a, b) => a.code.number.compareTo(b.code.number));
  }

  Code get code {
    return symptomsOrderedByPriority.firstOrNull?.code ?? codeGreen;
  }

  String get treatmentTime {
    return code.maxWaitTime.inMinutes == 0
        ? 'Omgående'
        : '0-${code.maxWaitTime.inMinutes} minutter';
  }

  Map<SymptomCategory, Symptom?> get findingsOrderedByPriority {
    final sortedFindings = findings.entries.toList()
      ..sort((a, b) =>
          (a.value?.code.number ?? 4).compareTo(b.value?.code.number ?? 4));

    return Map.fromEntries(sortedFindings);
  }
}
