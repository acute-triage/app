import 'package:flutter_starter/features/contact_card/domain/contact_reason_card.dart';
import 'package:flutter_starter/features/contact_card/domain/symptom.dart';
import 'package:flutter_starter/features/contact_card/domain/sympton_category.dart';

import 'package:flutter_starter/features/contact_card/domain/code.dart';

final contactCard16 = ContactReasonCard(
  title: 'Hudsymptomer (udslæt)',
  number: 16,
  searchTerms: [
    'petekkier',
    'hudblødning',
    'mikropetekkier',
    'blærer',
    'hudløsning',
    'periorbital',
    'rødme',
    'infektion',
    'udslæt',
    'smerter',
    'nakkerygstivhed',
  ],
  symptomCategories: [
    SymptomCategory(
      name: 'Petekkier eller større hudblødninger (svinder ikke for tryk)',
      symptoms: [
        Symptom(
          description: 'Med nakkerygstivhed',
          code: Code.red(),
        ),
        Symptom(
          description: 'Feber (over eller lig 38.0)',
          code: Code.orange(),
        ),
        Symptom(
          description: 'Uden feber (under 38.0)',
          code: Code.yellow(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Mikropetekkier (under 1 mm i diameter)',
      symptoms: [
        Symptom(
          description: 'Med nakkerygstivhed',
          code: Code.red(),
        ),
        Symptom(
          description: 'Universelt',
          code: Code.orange(),
        ),
        Symptom(
          description: 'Kun ansigt og hals (hoste, opkastning)',
          code: Code.green(),
        ),
      ],
    ),
    SymptomCategory(
      name:
          'Stærke smerter fra inficeret hud eller gasudvikling i huden (knitren)',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.red(),
        ),
      ],
    ),
    SymptomCategory(
      name:
          'Blærer eller løsning af hud på mere end 5-10 % af hudens overflade (barnets håndflade er 1 %)',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Periorbital rødme og hævelse',
      symptoms: [
        Symptom(
          description:
              'Påvirket syn, smerter ved øjenbevægelser eller frembulende øje',
          code: Code.orange(),
        ),
        Symptom(
          description: 'Upåvirket syn',
          code: Code.yellow(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Mistanke om infektion i hud (rødme, hævelse, ømhed, feber)',
      symptoms: [
        Symptom(
          description: 'Alment påvirket',
          code: Code.yellow(),
        ),
        Symptom(
          description: 'Alment upåvirket',
          code: Code.green(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Udslæt svinder for tryk',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.green(),
        ),
      ],
    ),
  ],
);
