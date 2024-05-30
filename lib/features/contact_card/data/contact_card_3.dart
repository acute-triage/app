import 'package:flutter_starter/features/contact_card/data/codes.dart';
import 'package:flutter_starter/features/contact_card/domain/contact_reason_card.dart';
import 'package:flutter_starter/features/contact_card/domain/symptom.dart';
import 'package:flutter_starter/features/contact_card/domain/sympton_category.dart';

const contactCard3 = ContactReasonCard(
  title: 'Bevægeapparatsymptomer uden skade',
  number: 3,
  searchTerms: [
    'ben',
    'sår',
    'halten',
    'gå',
    'natlige',
    'smerter',
  ],
  symptomCategories: [
    SymptomCategory(
      name: 'Tegn på hudinfektion',
      symptoms: [
        Symptom(
          description:
              'Hastigt progredierende misfarvning, varme og hævelse eller gasudvikling/stærke smerter i hud',
          code: codeRed,
        ),
        Symptom(
          description: 'Påvirket almentilstand',
          code: codeOrange,
        ),
        Symptom(
          description: 'Mistanke om dyb sårinfektion eller lymphangitis',
          code: codeYellow,
        ),
        Symptom(
          description: 'Overfladisk sårinfektion',
          code: codeGreen,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Mistanke om DVT',
      symptoms: [
        Symptom(
          description: 'Med åndenød og/eller brystsmerter',
          code: codeOrange,
        ),
        Symptom(
          description: 'Uden åndenød eller brystsmerter',
          code: codeGreen,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Smerter',
      symptoms: [
        Symptom(
          description: 'Svære',
          code: codeOrange,
        ),
        Symptom(
          description: 'Moderate',
          code: codeYellow,
        ),
        Symptom(
          description: 'Lette/ingen',
          code: codeGreen,
        ),
      ],
    ),
    SymptomCategory(
      name:
          'Led med hævelse, rødme, fikseret stilling eller indskrænket bevægelighed',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeYellow,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Halten, vil ikke gå, stå, sidde eller bruge arm',
      symptoms: [
        Symptom(
          description:
              'Med feber (over eller lig 38.0) eller immundefekt eller intravenøst kateter eller bleg og træt',
          code: codeYellow,
        ),
        Symptom(
          description: 'Uden feber',
          code: codeGreen,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Kun natlige smerter',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeGreen,
        ),
      ],
    ),
  ],
);
