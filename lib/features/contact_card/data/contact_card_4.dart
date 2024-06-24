import 'package:flutter_starter/features/contact_card/domain/contact_reason_card.dart';
import 'package:flutter_starter/features/contact_card/domain/symptom.dart';
import 'package:flutter_starter/features/contact_card/domain/sympton_category.dart';

import 'package:flutter_starter/features/contact_card/domain/code.dart';

final contactCard4 = ContactReasonCard(
  title: 'Besvimelse (nu vågen)',
  searchTerms: [
    'brystsmerter',
    'neologiske',
    'faldskade',
    'hovedtraume',
    'epilepsi',
    'hyperventilation',
    'hjertesygdom',
    'hovedpine',
  ],
  number: 4,
  symptomCategories: [
    SymptomCategory(
      name: 'Elstød',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.red(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Gentagne besvimelser i seneste døgn',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Kendt hjertesygdom',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Udløst af anstrengelse eller forskrækkelse',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Aktuelle brystsmerter, trykken i bryst eller hjertebanken',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.orange(),
        ),
        Symptom(
          description: 'Nej, er nu ophørt',
          code: Code.yellow(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Pludselig uventet død i familien af uklar årsag',
      symptoms: [
        Symptom(
          description: 'Med brystsmerter',
          code: Code.orange(),
        ),
        Symptom(
          description: 'Uden brystsmerter',
          code: Code.yellow(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Forudgående hovedpine eller hovedtraume (se også kort nr. 14)',
      symptoms: [
        Symptom(
          description: 'Mere end 5-10 sekunder',
          code: Code.orange(),
        ),
        Symptom(
          description: 'Få sekunder og bare mistanke om kortvarig besvimelse',
          code: Code.yellow(),
        ),
      ],
    ),
    SymptomCategory(
      name:
          'Ledsagende neurologiske udfald (nedsat kraft, dobbeltsyn, talebesvær)',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Faldskade uden øvrige',
      symptoms: [
        Symptom(
          description: 'Uden prodrom',
          code: Code.orange(),
        ),
        Symptom(
          description: 'Med prodrom',
          code: Code.yellow(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Kendt epilepsi eller migrænesyndrom',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.green(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Udløst af affekt og "breathholding" hos i øvrigt raskt barn',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.green(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Hyperventilation og i øvrigt rask',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.green(),
        ),
      ],
    ),
  ],
);
