import 'package:flutter_starter/features/contact_card/data/codes.dart';
import 'package:flutter_starter/features/contact_card/domain/code.dart';
import 'package:flutter_starter/features/contact_card/domain/contact_reason_card.dart';
import 'package:flutter_starter/features/contact_card/domain/finding.dart';
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
    @Default([]) List<Finding> findings,
  }) = _PatientContactCard;

  Code get code {
    if (findingsOrderedByPriority.isEmpty) {
      return codeGreen;
    }

    final finding = findingsOrderedByPriority.first;

    return finding.code;
  }

  String get treatmentTime {
    return code.maxWaitTime.inMinutes == 0
        ? 'Omgående'
        : '0-${code.maxWaitTime.inMinutes} minutter';
  }

  List<Finding> get findingsOrderedByPriority {
    final sorted = [...findings]
      ..sort((finding, b) => (finding.code).compareTo(b.code));

    return sorted;
  }
}
