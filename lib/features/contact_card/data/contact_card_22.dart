import 'package:flutter_starter/features/contact_card/domain/contact_reason_card.dart';
import 'package:flutter_starter/features/contact_card/domain/symptom.dart';
import 'package:flutter_starter/features/contact_card/domain/sympton_category.dart';

import 'package:flutter_starter/features/contact_card/domain/code.dart';

final contactCard22 = ContactReasonCard(
  title: 'Urinvejssymptomer',
  searchTerms: [
    'ødemer',
    'makroskopisk hæmaturi',
    'feber',
  ],
  number: 22,
  symptomCategories: [
    SymptomCategory(
      name: 'Ødemer',
      symptoms: [
        Symptom(
          description: 'Feber (over eller lig 38.0 °C)',
          code: Code.orange(),
        ),
        Symptom(
          description: 'Ingen feber',
          code: Code.yellow(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Med eller uden feber',
      symptoms: [
        Symptom(
          description: 'Feber (over eller lig 38.0 °C)',
          code: Code.yellow(),
        ),
        Symptom(
          description: 'Ingen feber',
          code: Code.green(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Makroskopisk hæmaturi',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.yellow(),
        ),
      ],
    ),
  ],
);
