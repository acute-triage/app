import 'package:flutter_starter/features/contact_card/domain/code.dart';
import 'package:flutter_starter/features/contact_card/domain/contact_reason_card.dart';
import 'package:flutter_starter/features/contact_card/domain/symptom.dart';
import 'package:flutter_starter/features/contact_card/domain/sympton_category.dart';

final contactCard12 = ContactReasonCard(
  title: 'Forgiftning, røgforgiftning, forbrænding og el-stød',
  number: 12,
  searchTerms: [
    'stridor',
    'hæshed',
    'synkebesvær',
    'medicin',
    'giftig',
    'plante',
    'lampeolie',
    'klordampe',
    'euforiserende',
    'stof',
    'røg',
    'elstød',
    'ætsende',
    'besvimelse',
  ],
  symptomCategories: [
    SymptomCategory(
      name:
          'Mistanke om forbrænding eller ætsning i svælg med stridor, hæshed eller synkebesvær',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.red(),
        ),
      ],
    ),
    SymptomCategory(
      name:
          'Indtagelse af medicin i giftig dosis eller symptomer på forgiftning',
      symptoms: [
        Symptom(
          description: 'Alment påvirket',
          code: Code.red(),
        ),
        Symptom(
          description: 'Upåvirket',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Indtagelse af giftig plante',
      symptoms: [
        Symptom(
          description: 'Alment påvirket',
          code: Code.red(),
        ),
        Symptom(
          description: 'Upåvirket',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Udsættelse for lampeolie eller klordampe',
      symptoms: [
        Symptom(
          description: 'Alment påvirket',
          code: Code.red(),
        ),
        Symptom(
          description: 'Upåvirket',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Indtagelse af euforiserende stof',
      symptoms: [
        Symptom(
          description: 'Alment påvirket',
          code: Code.red(),
        ),
        Symptom(
          description: 'Upåvirket og tp over 38',
          code: Code.orange(),
        ),
        Symptom(
          description: 'Upåvirket og afebril',
          code: Code.yellow(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Røgforgiftning',
      symptoms: [
        Symptom(
          description: 'Alment påvirket',
          code: Code.red(),
        ),
        Symptom(
          description: 'Upåvirket',
          code: Code.orange(),
        ),
        Symptom(
          description: 'Universelt',
          code: Code.yellow(),
        ),
        Symptom(
          description: 'Lokalt',
          code: Code.green(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Elstød',
      symptoms: [
        Symptom(
          description: 'Besvimelse ved stød',
          code: Code.red(),
        ),
        Symptom(
          description: 'Forbrænding eller EKG-forandringer',
          code: Code.orange(),
        ),
        Symptom(
          description: 'Ja',
          code: Code.green(),
        ),
      ],
    ),
  ],
);
