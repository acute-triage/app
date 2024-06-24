import 'package:flutter_starter/features/contact_card/domain/contact_reason_card.dart';
import 'package:flutter_starter/features/contact_card/domain/symptom.dart';
import 'package:flutter_starter/features/contact_card/domain/sympton_category.dart';

import 'package:flutter_starter/features/contact_card/domain/code.dart';

final contactCard17 = ContactReasonCard(
  title: 'Kramper (nu ophørt)',
  number: 17,
  searchTerms: [
    'bevidsthedsniveau',
    'neurologisk',
    'hovedtraume',
    'vold',
    'hovedpine',
    'affekt',
    'breathholding',
  ],
  symptomCategories: [
    SymptomCategory(
      name: 'Neurologiske udfald (nedsat kraft, dobbeltsyn, talebesvær)',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Efter hovedtraume',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Tegn på eller mistanke om vold',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Hovedpine',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Varighed',
      symptoms: [
        Symptom(
          description: 'Over 15 min',
          code: Code.orange(),
        ),
        Symptom(
          description: '5-15 min',
          code: Code.yellow(),
        ),
        Symptom(
          description: 'Under 5 min',
          code: Code.green(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Udløst af affekt og "breathholding" hos raskt barn',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.green(),
        ),
      ],
    ),
  ],
);
