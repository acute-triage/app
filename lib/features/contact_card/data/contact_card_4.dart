import 'package:flutter_starter/features/contact_card/data/codes.dart';
import 'package:flutter_starter/features/contact_card/domain/contact_reason_card.dart';
import 'package:flutter_starter/features/contact_card/domain/symptom.dart';
import 'package:flutter_starter/features/contact_card/domain/sympton_category.dart';

const contactCard4 = ContactReasonCard(
  title: 'Besvimelse (nu vågen)',
  number: 4,
  symptomCategories: [
    SymptomCategory(
      name: 'Elstød',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeRed,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Gentagne besvimelser i seneste døgn',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Kendt hjertesygdom',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Udløst af anstrengelse eller forskrækkelse',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Aktuelle brystsmerter, trykken i bryst eller hjertebanken',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeOrange,
        ),
        Symptom(
          description: 'Nej, er nu ophørt',
          code: codeYellow,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Pludselig uventet død i familien af uklar årsag',
      symptoms: [
        Symptom(
          description: 'Med brystsmerter',
          code: codeOrange,
        ),
        Symptom(
          description: 'Uden brystsmerter',
          code: codeYellow,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Forudgående hovedpine eller hovedtraume (se også kort nr. 14)',
      symptoms: [
        Symptom(
          description: 'Mere end 5-10 sekunder',
          code: codeOrange,
        ),
        Symptom(
          description: 'Få sekunder og bare mistanke om kortvarig besvimelse',
          code: codeYellow,
        ),
      ],
    ),
    SymptomCategory(
      name:
          'Ledsagende neurologiske udfald (nedsat kraft, dobbeltsyn, talebesvær)',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Faldskade uden øvrige',
      symptoms: [
        Symptom(
          description: 'Uden prodrom',
          code: codeOrange,
        ),
        Symptom(
          description: 'Med prodrom',
          code: codeYellow,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Kendt epilepsi eller migrænesyndrom',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeGreen,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Udløst af affekt og "breathholding" hos i øvrigt raskt barn',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeGreen,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Hyperventilation og i øvrigt rask',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeGreen,
        ),
      ],
    ),
  ],
);
