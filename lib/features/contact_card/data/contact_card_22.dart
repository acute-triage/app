import 'package:flutter_starter/features/contact_card/data/codes.dart';
import 'package:flutter_starter/features/contact_card/domain/contact_reason_card.dart';
import 'package:flutter_starter/features/contact_card/domain/symptom.dart';
import 'package:flutter_starter/features/contact_card/domain/sympton_category.dart';

const contactCard22 = ContactReasonCard(
  title: 'Urinvejssymptomer',
  number: 22,
  symptomCategories: [
    SymptomCategory(
      name: 'Ødemer',
      symptoms: [
        Symptom(
          description: 'Feber (over eller lig 38.0 °C)',
          code: codeOrange,
        ),
        Symptom(
          description: 'Ingen feber',
          code: codeYellow,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Med eller uden feber',
      symptoms: [
        Symptom(
          description: 'Feber (over eller lig 38.0 °C)',
          code: codeYellow,
        ),
        Symptom(
          description: 'Ingen feber',
          code: codeGreen,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Makroskopisk hæmaturi',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeYellow,
        ),
      ],
    ),
  ],
);
