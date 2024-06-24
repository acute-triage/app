import 'package:flutter_starter/features/contact_card/domain/contact_reason_card.dart';
import 'package:flutter_starter/features/contact_card/domain/symptom.dart';
import 'package:flutter_starter/features/contact_card/domain/sympton_category.dart';

import 'package:flutter_starter/features/contact_card/domain/code.dart';

final contactCard3 = ContactReasonCard(
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
          code: Code.red(),
        ),
        Symptom(
          description: 'Påvirket almentilstand',
          code: Code.orange(),
        ),
        Symptom(
          description: 'Mistanke om dyb sårinfektion eller lymphangitis',
          code: Code.yellow(),
        ),
        Symptom(
          description: 'Overfladisk sårinfektion',
          code: Code.green(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Mistanke om DVT',
      symptoms: [
        Symptom(
          description: 'Med åndenød og/eller brystsmerter',
          code: Code.orange(),
        ),
        Symptom(
          description: 'Uden åndenød eller brystsmerter',
          code: Code.green(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Smerter',
      symptoms: [
        Symptom(
          description: 'Svære',
          code: Code.orange(),
        ),
        Symptom(
          description: 'Moderate',
          code: Code.yellow(),
        ),
        Symptom(
          description: 'Lette/ingen',
          code: Code.green(),
        ),
      ],
    ),
    SymptomCategory(
      name:
          'Led med hævelse, rødme, fikseret stilling eller indskrænket bevægelighed',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.yellow(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Halten, vil ikke gå, stå, sidde eller bruge arm',
      symptoms: [
        Symptom(
          description:
              'Med feber (over eller lig 38.0) eller immundefekt eller intravenøst kateter eller bleg og træt',
          code: Code.yellow(),
        ),
        Symptom(
          description: 'Uden feber',
          code: Code.green(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Kun natlige smerter',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.green(),
        ),
      ],
    ),
  ],
);
