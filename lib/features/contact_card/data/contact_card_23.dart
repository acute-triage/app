import 'package:flutter_starter/features/contact_card/data/codes.dart';
import 'package:flutter_starter/features/contact_card/domain/contact_reason_card.dart';
import 'package:flutter_starter/features/contact_card/domain/symptom.dart';
import 'package:flutter_starter/features/contact_card/domain/sympton_category.dart';

const vaertraekningsbesvaer = ContactReasonCard(
  title: 'Vejrtrækningsbesvær',
  number: 23,
  symptomCategories: [
    SymptomCategory(
      name: 'Inspiratoriske stridor',
      symptoms: [
        Symptom(
          description:
              'Kan ikke synke spyt eller dyspnø der forværres liggendemed ødem af ansigt',
          code: codeRed,
        ),
        Symptom(
          description: 'Hævelse i hals/svælg eller grødet stemme',
          code: codeOrange,
        ),
        Symptom(
          description:
              'Pludselig stridor og hoste i vågen tilstand, men ikke stridor længere (mistanke om fremmedlegeme)',
          code: codeYellow,
        ),
        Symptom(
          description:
              'Stridor er ophørt kombineret med søløvehoste og hæshed (ukompliceret pseudocroup)',
          code: codeGreen,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Grad af åndenød',
      symptoms: [
        Symptom(
          description: 'Svær hvile/taledyspnø',
          code: codeRed,
        ),
        Symptom(
          description:
              'Nytilkommen hvile/taledyspnø eller forværring af habituel hvile/taledyspnø',
          code: codeOrange,
        ),
        Symptom(
          description: 'Nytilkommen funktionsdyspnø',
          code: codeYellow,
        ),
        Symptom(
          description: 'Let funktionsdyspnø',
          code: codeGreen,
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
          code: codeRed,
        ),
        Symptom(
          description: 'Stumpt traume mod hals eller thorax ',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Smerter ved vejrtrækning',
      symptoms: [
        Symptom(
          description: 'Kombineret med cyanose (lungeemboli)',
          code: codeRed,
        ),
        Symptom(
          description: 'Svære eller kombineret med dyspnø (lungeemboli)',
          code: codeOrange,
        ),
        Symptom(
          description: 'Moderate',
          code: codeYellow,
        ),
        Symptom(
          description: 'Lette',
          code: codeGreen,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Apnøtilfælde og udtrætning',
      symptoms: [
        Symptom(
          description:
              'Paradoks respiration eller tilbagevendende apnøer med cyanose eller hypotoni',
          code: codeRed,
        ),
        Symptom(
          description: 'uden farveskift',
          code: codeYellow,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Alder',
      symptoms: [
        Symptom(
          description: 'under 3 mdr.',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Hoste',
      symptoms: [
        Symptom(
          description: 'Hæmoptyse flere gange seneste døgn',
          code: codeOrange,
        ),
        Symptom(
          description: 'Purulent ekspektoration eller enkelt hæmoptyse',
          code: codeYellow,
        ),
        Symptom(
          description: 'Hoste uden ekspektoration',
          code: codeGreen,
        ),
      ],
    ),
  ],
);
