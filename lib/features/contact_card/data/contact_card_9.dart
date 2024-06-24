import 'package:flutter_starter/features/contact_card/domain/contact_reason_card.dart';
import 'package:flutter_starter/features/contact_card/domain/symptom.dart';
import 'package:flutter_starter/features/contact_card/domain/sympton_category.dart';

import 'package:flutter_starter/features/contact_card/domain/code.dart';

final contactCard9 = ContactReasonCard(
  title: 'Diabetes mellitus (DM)',
  searchTerms: [
    'hyperglykæmi',
    'hypoglykæmi',
    'sukkersyge',
    'ketoacidose',
    'koma',
    'blodsukker',
  ],
  number: 9,
  symptomCategories: [
    SymptomCategory(
      name: 'Nyopdaget DM',
      symptoms: [
        Symptom(
          description: 'pH under 7.10, HCO3- under 5 mmol/l',
          code: Code.red(),
        ),
        Symptom(
          description: 'pH 7.10-7.19, HCO3- 5-10 mmol/l',
          code: Code.orange(),
        ),
        Symptom(
          description: 'pH 7.20-7.30, HCO3- 10-15 mmol/l',
          code: Code.yellow(),
        ),
        Symptom(
          description: 'pH over 7.30, HCO3- over 15 mmol/l',
          code: Code.green(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Kendt DM med hyperglykæmi',
      symptoms: [
        Symptom(
          description: 'pH under 7.10, HCO3- under 5 mmol/l',
          code: Code.red(),
        ),
        Symptom(
          description: 'pH 7.10-7.19, HCO3- 5-10 mmol/l',
          code: Code.orange(),
        ),
        Symptom(
          description: 'pH 7.20-7.30, HCO3- 10-15 mmol/l',
          code: Code.yellow(),
        ),
        Symptom(
          description: 'pH over 7.30, HCO3- over 15 mmol/l',
          code: Code.green(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Kendt DM med hypoglykæmi',
      symptoms: [
        Symptom(
          description: 'BS under eller lig 3',
          code: Code.orange(),
        ),
        Symptom(
          description: 'BS over 3',
          code: Code.yellow(),
        ),
      ],
    ),
  ],
);
