import 'package:flutter_starter/features/contact_card/domain/contact_reason_card.dart';
import 'package:flutter_starter/features/contact_card/domain/symptom.dart';
import 'package:flutter_starter/features/contact_card/domain/sympton_category.dart';

import 'package:flutter_starter/features/contact_card/domain/code.dart';

final contactCard7 = ContactReasonCard(
  title: 'Cyanose i sygehistorie (ej cyanose mere)',
  number: 7,
  searchTerms: [
    'traume',
    'lungesygdom',
    'hjertesygdom',
    'neurologisk sygdom',
    'cyanose',
    'blå',
    'blålig',
    'blåfarvet',
    'blåfarvning',
    'farve',
    'farvning',
    'hud',
    'mund',
    'læber',
    'tunge',
    'negle',
    'hudfarve',
    'mundfarve',
    'læberfarve',
    'tungefarve',
    'neglefarve',
  ],
  symptomCategories: [
    SymptomCategory(
      name: 'Traume',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Kendt lungesygdom',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Mistanke om eller kendt hjertesygdom',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Nedsat tonus eller kendt neurologisk sygdom',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Feber',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Der kan svares nej på 1-5 og barnet er i habitualtilstand',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.green(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Kun perifert og/eller relation til kulde',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.green(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Omkring mund uden læbecyanose (normal fænomen)',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.green(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Muligt anfald og nu i habitualtilstand (fx affektanfald)',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.green(),
        ),
      ],
    ),
  ],
);
