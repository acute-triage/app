import 'package:flutter_starter/features/contact_card/domain/contact_reason_card.dart';
import 'package:flutter_starter/features/contact_card/domain/symptom.dart';
import 'package:flutter_starter/features/contact_card/domain/sympton_category.dart';

import 'package:flutter_starter/features/contact_card/domain/code.dart';

final contactCard18 = ContactReasonCard(
  title: 'Mavesmerter (skrigeture)',
  searchTerms: [
    'traume',
    'abdominalomfang',
    'galdefarvede',
    'blodige',
    'slim',
    'opkastninger',
    'afføring',
    'immundefekt',
    'feber',
    'magneter',
    'knapbatteri',
    'petekkier',
    'kussmaul',
    'brok',
    'graviditet',
    'skrotum',
    'scrotum',
  ],
  number: 18,
  symptomCategories: [
    SymptomCategory(
      name: 'Traume',
      symptoms: [
        Symptom(
          description: 'Tiltagende abdominalomfang',
          code: Code.red(),
        ),
        Symptom(
          description: 'Normalt abdominalomfang',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Galdefarvede eller blodige opkastninger',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Blodigt slim uden afføring per rectum',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Børn under 3 mdr. med opkastninger',
      symptoms: [
        Symptom(
          description: 'Alment påvirket',
          code: Code.orange(),
        ),
        Symptom(
          description: 'Alment upåvirket',
          code: Code.yellow(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Immundefekt eller neutropen (under 0.5 mia/l) og feber',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Indtagelse af magneter eller knapbatteri',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Aktuelle smerter',
      symptoms: [
        Symptom(
          description: 'Ligger forpint og stille i seng',
          code: Code.orange(),
        ),
        Symptom(
          description: 'Bevæger sig frit',
          code: Code.green(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Diffuse smerter, der har flyttet sig til højre fossa',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.yellow(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Petekkier, bleghed og irritabilitet (HUS)',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Kussmaul respiration',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Synligt brok',
      symptoms: [
        Symptom(
          description: 'Misfarvet eller ømt og hårdt brok',
          code: Code.orange(),
        ),
        Symptom(
          description: 'Brok kan reponeres',
          code: Code.green(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Potentielt gravid eller vaginal blødning',
      symptoms: [
        Symptom(
          description: 'Bleg eller alment medtaget',
          code: Code.red(),
        ),
        Symptom(
          description: 'Ja',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Smerter fra scrotum',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.orange(),
        ),
      ],
    ),
  ],
);
