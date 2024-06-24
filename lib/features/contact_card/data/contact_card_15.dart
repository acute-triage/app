import 'package:flutter_starter/features/contact_card/domain/contact_reason_card.dart';
import 'package:flutter_starter/features/contact_card/domain/symptom.dart';
import 'package:flutter_starter/features/contact_card/domain/sympton_category.dart';

import 'package:flutter_starter/features/contact_card/domain/code.dart';

final contactCard15 = ContactReasonCard(
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
          code: Code.red(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Neurologiske udfald (nedsat kraft, dobbeltsyn, talebesvær)',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.red(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Højenergitraume',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.red(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Forbigående kramper efter traumet',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Forbigående bevidstløs ved traumet',
      symptoms: [
        Symptom(
          description: 'Mere end få sekunder',
          code: Code.orange(),
        ),
        Symptom(
          description: 'Få sekunder eller mistanke om kortvarig bevidstløshed',
          code: Code.yellow(),
        ),
      ],
    ),
    SymptomCategory(
      name:
          'Mistanke om kraniefraktur (konturspring/hæmatom over 5 cm i diameter)',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Mistanke om vold inkl. "shaken baby"',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Spændt fontanelle',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Kendt ITP, AK-behandling, hæmofili',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Opkastninger',
      symptoms: [
        Symptom(
          description: 'Over 2 opkastninger',
          code: Code.orange(),
        ),
        Symptom(
          description: 'Under eller lig to (og upåvirket)',
          code: Code.green(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Børn under 3 mdr.',
      symptoms: [
        Symptom(
          description: 'Alment påvirket',
          code: Code.red(),
        ),
        Symptom(
          description: 'Alment upåvirket',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Børn over 3 mdr. og under 12 mdr.',
      symptoms: [
        Symptom(
          description: 'Alment påvirket',
          code: Code.red(),
        ),
        Symptom(
          description: 'Alment upåvirket',
          code: Code.yellow(),
        ),
      ],
    ),
  ],
);
