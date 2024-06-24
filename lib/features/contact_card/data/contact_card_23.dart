import 'package:flutter_starter/features/contact_card/domain/contact_reason_card.dart';
import 'package:flutter_starter/features/contact_card/domain/symptom.dart';
import 'package:flutter_starter/features/contact_card/domain/sympton_category.dart';

import 'package:flutter_starter/features/contact_card/domain/code.dart';

final contactCard23 = ContactReasonCard(
  title: 'Vejrtrækningsbesvær',
  searchTerms: [
    'stridor',
    'åndenød',
    'dyspnø',
    'hævelse',
    'hoste',
    'søløvehoste',
    'hæshed',
    'fremmedlegeme',
    'pseudocroup',
    'lungeemboli',
    'apnø',
    'udtrætning',
    'cyanose',
    'hypotoni',
    'lungeemboli',
    'hæmoptyse',
    'ekspektoration',
  ],
  number: 23,
  symptomCategories: [
    SymptomCategory(
      name: 'Inspiratoriske stridor',
      symptoms: [
        Symptom(
          description:
              'Kan ikke synke spyt eller dyspnø der forværres liggendemed ødem af ansigt',
          code: Code.red(),
        ),
        Symptom(
          description: 'Hævelse i hals/svælg eller grødet stemme',
          code: Code.orange(),
        ),
        Symptom(
          description:
              'Pludselig stridor og hoste i vågen tilstand, men ikke stridor længere (mistanke om fremmedlegeme)',
          code: Code.yellow(),
        ),
        Symptom(
          description:
              'Stridor er ophørt kombineret med søløvehoste og hæshed (ukompliceret pseudocroup)',
          code: Code.green(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Grad af åndenød',
      symptoms: [
        Symptom(
          description: 'Svær hvile/taledyspnø',
          code: Code.red(),
        ),
        Symptom(
          description:
              'Nytilkommen hvile/taledyspnø eller forværring af habituel hvile/taledyspnø',
          code: Code.orange(),
        ),
        Symptom(
          description: 'Nytilkommen funktionsdyspnø',
          code: Code.yellow(),
        ),
        Symptom(
          description: 'Let funktionsdyspnø',
          code: Code.green(),
        ),
      ],
    ),
    SymptomCategory(
      name:
          'Mulig luftvejsskade med vejrtrækningsbesvær (stridor eller åndenød)',
      symptoms: [
        Symptom(
          description:
              'Brand- eller ætsningsskader eller penetrerende traume mod hals/thorax',
          code: Code.red(),
        ),
        Symptom(
          description: 'Stumpt traume mod hals eller thorax ',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Smerter ved vejrtrækning',
      symptoms: [
        Symptom(
          description: 'Kombineret med cyanose (lungeemboli)',
          code: Code.red(),
        ),
        Symptom(
          description: 'Svære eller kombineret med dyspnø (lungeemboli)',
          code: Code.orange(),
        ),
        Symptom(
          description: 'Moderate',
          code: Code.yellow(),
        ),
        Symptom(
          description: 'Lette',
          code: Code.green(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Apnøtilfælde og udtrætning',
      symptoms: [
        Symptom(
          description:
              'Paradoks respiration eller tilbagevendende apnøer med cyanose eller hypotoni',
          code: Code.red(),
        ),
        Symptom(
          description: 'uden farveskift',
          code: Code.yellow(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Alder',
      symptoms: [
        Symptom(
          description: 'under 3 mdr.',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Hoste',
      symptoms: [
        Symptom(
          description: 'Hæmoptyse flere gange seneste døgn',
          code: Code.orange(),
        ),
        Symptom(
          description: 'Purulent ekspektoration eller enkelt hæmoptyse',
          code: Code.yellow(),
        ),
        Symptom(
          description: 'Hoste uden ekspektoration',
          code: Code.green(),
        ),
      ],
    ),
  ],
);
