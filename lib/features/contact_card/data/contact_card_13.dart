import 'package:flutter_starter/features/contact_card/data/codes.dart';
import 'package:flutter_starter/features/contact_card/domain/contact_reason_card.dart';
import 'package:flutter_starter/features/contact_card/domain/symptom.dart';
import 'package:flutter_starter/features/contact_card/domain/sympton_category.dart';

const contactCard13 = ContactReasonCard(
  title: 'Gastrointestinal blødning',
  searchTerms: [
    'opkast',
    'blodig',
    'melæna',
    'slim',
    'ætsning',
    'fremmedlegeme',
    'knapbatteri',
    'varicer',
    'immundefekt',
    'leversyge',
    'galdefarvet',
    'invagination',
  ],
  number: 13,
  symptomCategories: [
    SymptomCategory(
      name: 'Mistanke om ætsning',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Mistanke om fremmedlegeme, særligt knapbatteri',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Kendt kronisk leversygdom (varicer? Koagulopati?)',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Blodig slim uden afføring (invagination)',
      symptoms: [
        Symptom(
          description: 'Ja (invagination)',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Galdefarvet opkast med eller uden blod',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name:
          'Immundefekt eller neutropen (under 0.5 mia/l) med feber, mavesmerter og blodig diarre',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Melæna',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeYellow,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Blod på overflade af afføring',
      symptoms: [
        Symptom(
          description: 'Upåvirket',
          code: codeGreen,
        ),
      ],
    ),
  ],
);
