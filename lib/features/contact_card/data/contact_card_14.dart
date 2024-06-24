import 'package:flutter_starter/features/contact_card/domain/contact_reason_card.dart';
import 'package:flutter_starter/features/contact_card/domain/symptom.dart';
import 'package:flutter_starter/features/contact_card/domain/sympton_category.dart';

import 'package:flutter_starter/features/contact_card/domain/code.dart';

final contactCard14 = ContactReasonCard(
  title: 'Hovedpine',
  number: 14,
  searchTerms: [
    'neurologisk',
    'hjertesygdom',
    'nakkerygstivhed',
    'forhøjet blodtryk',
    'hovedtraume',
    'migræne',
    'feber',
  ],
  symptomCategories: [
    SymptomCategory(
      name: 'Neurologisk udfald (nedsat kraft, dobbeltsyn, talebesvær)',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Værste hovedpine nogensinde (tordenskraldshovedpine)',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name:
          'Kendt ITP, AK-behandling, shunt, hjertesygdom med hul i hjerte, immundefekt, seglcelleanæmi',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Nakkerygstivhed uden feber',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name:
          'Svært forhøjet BT (dvs. over eller lig 99-percentil for alder og højde + 5 mmHg)',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Hovedtraume',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Debut natligt eller tidlig morgen',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.yellow(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Kendt migræne',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.yellow(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Feber',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.yellow(),
        ),
      ],
    ),
  ],
);
