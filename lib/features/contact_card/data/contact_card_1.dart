import 'package:flutter_starter/features/contact_card/data/codes.dart';
import 'package:flutter_starter/features/contact_card/domain/contact_reason_card.dart';
import 'package:flutter_starter/features/contact_card/domain/symptom.dart';
import 'package:flutter_starter/features/contact_card/domain/sympton_category.dart';

const contactCard1 = ContactReasonCard(
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
          code: codeRed,
        ),
        Symptom(
          description: 'Hviledyspnø',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Hævelse af tunge, læber, svælg og/eller hals',
      symptoms: [
        Symptom(
          description: 'Med stridor',
          code: codeRed,
        ),
        Symptom(
          description: 'Uden stridor',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Symptomer udviklet på minutter',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Tidligere alvorlig allergisk reaktion',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Kløe i halsen',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeYellow,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Urticaria (nældefeber)',
      symptoms: [
        Symptom(
          description: 'Universelt',
          code: codeYellow,
        ),
        Symptom(
          description: 'Lokalt',
          code: codeGreen,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Intet af ovenstående',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeGreen,
        ),
      ],
    ),
  ],
);
