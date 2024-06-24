import 'package:flutter_starter/features/contact_card/domain/contact_reason_card.dart';
import 'package:flutter_starter/features/contact_card/domain/symptom.dart';
import 'package:flutter_starter/features/contact_card/domain/sympton_category.dart';

import 'package:flutter_starter/features/contact_card/domain/code.dart';

final contactCard1 = ContactReasonCard(
  title: 'Allergisk reaktion',
  number: 1,
  searchTerms: [
    'allergi',
    'allergisk',
    'reaktion',
    'hævelse',
    'tunge',
    'læber',
    'svælg',
    'hals',
    'åndenød',
    'kløe',
    'urticaria',
    'nældefeber',
  ],
  symptomCategories: [
    SymptomCategory(
      name: 'Åndenød',
      symptoms: [
        Symptom(
          description: 'Svær hviledyspnø',
          code: Code.red(),
        ),
        Symptom(
          description: 'Hviledyspnø',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Hævelse af tunge, læber, svælg og/eller hals',
      symptoms: [
        Symptom(
          description: 'Med stridor',
          code: Code.red(),
        ),
        Symptom(
          description: 'Uden stridor',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Symptomer udviklet på minutter',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Tidligere alvorlig allergisk reaktion',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Kløe i halsen',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.yellow(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Urticaria (nældefeber)',
      symptoms: [
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
      name: 'Intet af ovenstående',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.green(),
        ),
      ],
    ),
  ],
);
