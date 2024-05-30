import 'package:flutter_starter/features/contact_card/data/codes.dart';
import 'package:flutter_starter/features/contact_card/domain/contact_reason_card.dart';
import 'package:flutter_starter/features/contact_card/domain/symptom.dart';
import 'package:flutter_starter/features/contact_card/domain/sympton_category.dart';

const contactCard10 = ContactReasonCard(
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
  ],
  number: 10,
  symptomCategories: [
    SymptomCategory(
      name: 'Aldersgruppe',
      symptoms: [
        Symptom(
          description: 'Under 3 mdr.',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Galdefarvede eller blodige opkastninger',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeRed,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Blodigt slim uden afføring (invagination)',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeRed,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Blodig diarre',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeRed,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Immundefekt eller neutropen (under 0.5 mia/l) og feber',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeRed,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Petekkier, bleghed og irritabilitet (HUS)',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeRed,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Kussmaul respiration',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeRed,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Halonerede øjne (mørk rand og indsunkne)',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Vandladning eller våde bleer',
      symptoms: [
        Symptom(
          description: 'Ingen sidste 12-24 timer (upåvirket)',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Diarre hyppighed',
      symptoms: [
        Symptom(
          description: 'Over 5 diarreer per døgn i mere end 2 dage',
          code: codeYellow,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Opkastning hyppighed',
      symptoms: [
        Symptom(
          description: 'Over 10 seneste 24 timer',
          code: codeYellow,
        ),
      ],
    ),
  ],
);
