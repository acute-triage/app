import 'package:flutter_starter/features/contact_card/domain/contact_reason_card.dart';
import 'package:flutter_starter/features/contact_card/domain/symptom.dart';
import 'package:flutter_starter/features/contact_card/domain/sympton_category.dart';

import 'package:flutter_starter/features/contact_card/domain/code.dart';

final contactCard2 = ContactReasonCard(
  title: 'Træthed og bleghed (anæmi)',
  number: 2,
  searchTerms: [
    'træthed',
    'bleghed',
    'anæmi',
    'næseblod',
    'næseblødninger',
    'åndenød',
    'halten',
    'smerter',
    'vægttab',
    'feber',
    'petekkier',
  ],
  symptomCategories: [
    SymptomCategory(
      name: 'Petekkier',
      symptoms: [
        Symptom(
          description: 'Med temperatur over eller lig 38.0',
          code: Code.orange(),
        ),
        Symptom(
          description: 'Ingen feber',
          code: Code.yellow(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Vægttab',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.yellow(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Halten, knogle- eller ledsmerter',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.yellow(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Stomatitis (mundbetændelse)',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.yellow(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Næseblødninger',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.yellow(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Åndenød/takypnø',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.yellow(),
        ),
      ],
    ),
  ],
);
