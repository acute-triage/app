import 'package:flutter_starter/features/contact_card/domain/contact_reason_card.dart';
import 'package:flutter_starter/features/contact_card/domain/symptom.dart';
import 'package:flutter_starter/features/contact_card/domain/sympton_category.dart';

import 'package:flutter_starter/features/contact_card/domain/code.dart';

final contactCard10 = ContactReasonCard(
  title: 'Diarré og opkastning',
  searchTerms: [
    'diarré',
    'opkastning',
    'blodig',
    'slim',
    'galdefarvede',
    'immundefekt',
    'feber',
    'petekkier',
    'bleghed',
    'irritabilitet',
    'hus',
    'kussmaul',
    'respiration',
    'halonerede',
    'vandladning',
    'våde',
    'bleer',
    'hyppighed',
    'diarreer',
    'tyndskid',
  ],
  number: 10,
  symptomCategories: [
    SymptomCategory(
      name: 'Aldersgruppe',
      symptoms: [
        Symptom(
          description: 'Under 3 mdr.',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Galdefarvede eller blodige opkastninger',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.red(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Blodigt slim uden afføring (invagination)',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.red(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Blodig diarre',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.red(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Immundefekt eller neutropen (under 0.5 mia/l) og feber',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.red(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Petekkier, bleghed og irritabilitet (HUS)',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.red(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Kussmaul respiration',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.red(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Halonerede øjne (mørk rand og indsunkne)',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Vandladning eller våde bleer',
      symptoms: [
        Symptom(
          description: 'Ingen sidste 12-24 timer (upåvirket)',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Diarre hyppighed',
      symptoms: [
        Symptom(
          description: 'Over 5 diarreer per døgn i mere end 2 dage',
          code: Code.yellow(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Opkastning hyppighed',
      symptoms: [
        Symptom(
          description: 'Over 10 seneste 24 timer',
          code: Code.yellow(),
        ),
      ],
    ),
  ],
);
