import 'package:flutter_starter/features/contact_card/domain/contact_reason_card.dart';
import 'package:flutter_starter/features/contact_card/domain/symptom.dart';
import 'package:flutter_starter/features/contact_card/domain/sympton_category.dart';

import 'package:flutter_starter/features/contact_card/domain/code.dart';

final contactCard24 = ContactReasonCard(
  title: 'Frakturer',
  searchTerms: [
    'compartment-syndrom',
    'smerter',
    'knogle',
    'hudperforation',
    'bleghed',
  ],
  number: 24,
  symptomCategories: [
    SymptomCategory(
      name:
          'Mistanke om compartment-syndrom: stærke smerter, nedsat følesans og/eller paræstesier',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Smerter',
      symptoms: [
        Symptom(
          description: 'VAS 10',
          code: Code.orange(),
        ),
        Symptom(
          description: 'VAS 4-9',
          code: Code.yellow(),
        ),
        Symptom(
          description: 'VAS 1-3',
          code: Code.green(),
        ),
      ],
    ),
    SymptomCategory(
      name:
          'Påvirkede neurovaskulære forhold distalt for skade: nedsat følesans, forlænget kapillærrespons, bleghed, kølig hud, svækket puls',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Åben fraktur: fraktur med sårdannelse/hudperforation',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.yellow(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Lukket fraktur',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.green(),
        ),
      ],
    ),
  ],
);
