import 'package:flutter_starter/features/contact_card/data/codes.dart';
import 'package:flutter_starter/features/contact_card/domain/contact_reason_card.dart';
import 'package:flutter_starter/features/contact_card/domain/symptom.dart';
import 'package:flutter_starter/features/contact_card/domain/sympton_category.dart';

const contactCard16 = ContactReasonCard(
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
          code: codeRed,
        ),
        Symptom(
          description: 'Feber (over eller lig 38.0)',
          code: codeOrange,
        ),
        Symptom(
          description: 'Uden feber (under 38.0)',
          code: codeYellow,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Mikropetekkier (under 1 mm i diameter)',
      symptoms: [
        Symptom(
          description: 'Med nakkerygstivhed',
          code: codeRed,
        ),
        Symptom(
          description: 'Universelt',
          code: codeOrange,
        ),
        Symptom(
          description: 'Kun ansigt og hals (hoste, opkastning)',
          code: codeGreen,
        ),
      ],
    ),
    SymptomCategory(
      name:
          'Stærke smerter fra inficeret hud eller gasudvikling i huden (knitren)',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeRed,
        ),
      ],
    ),
    SymptomCategory(
      name:
          'Blærer eller løsning af hud på mere end 5-10 % af hudens overflade (barnets håndflade er 1 %)',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Periorbital rødme og hævelse',
      symptoms: [
        Symptom(
          description:
              'Påvirket syn, smerter ved øjenbevægelser eller frembulende øje',
          code: codeOrange,
        ),
        Symptom(
          description: 'Upåvirket syn',
          code: codeYellow,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Mistanke om infektion i hud (rødme, hævelse, ømhed, feber)',
      symptoms: [
        Symptom(
          description: 'Alment påvirket',
          code: codeYellow,
        ),
        Symptom(
          description: 'Alment upåvirket',
          code: codeGreen,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Udslæt svinder for tryk',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeGreen,
        ),
      ],
    ),
  ],
);
