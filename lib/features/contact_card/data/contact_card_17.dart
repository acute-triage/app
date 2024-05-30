import 'package:flutter_starter/features/contact_card/data/codes.dart';
import 'package:flutter_starter/features/contact_card/domain/contact_reason_card.dart';
import 'package:flutter_starter/features/contact_card/domain/symptom.dart';
import 'package:flutter_starter/features/contact_card/domain/sympton_category.dart';

const contactCard17 = ContactReasonCard(
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
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Efter hovedtraume',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Tegn på eller mistanke om vold',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Hovedpine',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Varighed',
      symptoms: [
        Symptom(
          description: 'Over 15 min',
          code: codeOrange,
        ),
        Symptom(
          description: '5-15 min',
          code: codeYellow,
        ),
        Symptom(
          description: 'Under 5 min',
          code: codeGreen,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Udløst af affekt og "breathholding" hos raskt barn',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeGreen,
        ),
      ],
    ),
  ],
);
