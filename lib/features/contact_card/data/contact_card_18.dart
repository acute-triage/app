import 'package:flutter_starter/features/contact_card/data/codes.dart';
import 'package:flutter_starter/features/contact_card/domain/contact_reason_card.dart';
import 'package:flutter_starter/features/contact_card/domain/symptom.dart';
import 'package:flutter_starter/features/contact_card/domain/sympton_category.dart';

const contactCard18 = ContactReasonCard(
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
          code: codeRed,
        ),
        Symptom(
          description: 'Normalt abdominalomfang',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Galdefarvede eller blodige opkastninger',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Blodigt slim uden afføring per rectum',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Børn under 3 mdr. med opkastninger',
      symptoms: [
        Symptom(
          description: 'Alment påvirket',
          code: codeOrange,
        ),
        Symptom(
          description: 'Alment upåvirket',
          code: codeYellow,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Immundefekt eller neutropen (under 0.5 mia/l) og feber',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Indtagelse af magneter eller knapbatteri',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Aktuelle smerter',
      symptoms: [
        Symptom(
          description: 'Ligger forpint og stille i seng',
          code: codeOrange,
        ),
        Symptom(
          description: 'Bevæger sig frit',
          code: codeGreen,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Diffuse smerter, der har flyttet sig til højre fossa',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeYellow,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Petekkier, bleghed og irritabilitet (HUS)',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Kussmaul respiration',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Synligt brok',
      symptoms: [
        Symptom(
          description: 'Misfarvet eller ømt og hårdt brok',
          code: codeOrange,
        ),
        Symptom(
          description: 'Brok kan reponeres',
          code: codeGreen,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Potentielt gravid eller vaginal blødning',
      symptoms: [
        Symptom(
          description: 'Bleg eller alment medtaget',
          code: codeRed,
        ),
        Symptom(
          description: 'Ja',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Smerter fra scrotum',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeOrange,
        ),
      ],
    ),
  ],
);
