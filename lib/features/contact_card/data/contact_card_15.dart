import 'package:flutter_starter/features/contact_card/data/codes.dart';
import 'package:flutter_starter/features/contact_card/domain/contact_reason_card.dart';
import 'package:flutter_starter/features/contact_card/domain/symptom.dart';
import 'package:flutter_starter/features/contact_card/domain/sympton_category.dart';

const contactCard15 = ContactReasonCard(
  title: 'Hovedtraume',
  number: 15,
  searchTerms: [
    'bevidsthedsniveau',
    'neologisk',
    'højenergitraume',
    'kramper',
    'bevidstløs',
    'kraniefraktur',
    'vold',
    'fontanelle',
    'opkastninger',
  ],
  symptomCategories: [
    SymptomCategory(
      name: 'Faldende bevidsthedsniveau (uanset normale pupiller)',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeRed,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Neurologiske udfald (nedsat kraft, dobbeltsyn, talebesvær)',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeRed,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Højenergitraume',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeRed,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Forbigående kramper efter traumet',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Forbigående bevidstløs ved traumet',
      symptoms: [
        Symptom(
          description: 'Mere end få sekunder',
          code: codeOrange,
        ),
        Symptom(
          description: 'Få sekunder eller mistanke om kortvarig bevidstløshed',
          code: codeYellow,
        ),
      ],
    ),
    SymptomCategory(
      name:
          'Mistanke om kraniefraktur (konturspring/hæmatom over 5 cm i diameter)',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Mistanke om vold inkl. "shaken baby"',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Spændt fontanelle',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Kendt ITP, AK-behandling, hæmofili',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Opkastninger',
      symptoms: [
        Symptom(
          description: 'Over 2 opkastninger',
          code: codeOrange,
        ),
        Symptom(
          description: 'Under eller lig to (og upåvirket)',
          code: codeGreen,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Børn under 3 mdr.',
      symptoms: [
        Symptom(
          description: 'Alment påvirket',
          code: codeRed,
        ),
        Symptom(
          description: 'Alment upåvirket',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Børn over 3 mdr. og under 12 mdr.',
      symptoms: [
        Symptom(
          description: 'Alment påvirket',
          code: codeRed,
        ),
        Symptom(
          description: 'Alment upåvirket',
          code: codeYellow,
        ),
      ],
    ),
  ],
);
