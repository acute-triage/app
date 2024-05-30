import 'package:flutter_starter/features/contact_card/data/codes.dart';
import 'package:flutter_starter/features/contact_card/domain/contact_reason_card.dart';
import 'package:flutter_starter/features/contact_card/domain/symptom.dart';
import 'package:flutter_starter/features/contact_card/domain/sympton_category.dart';

const contactCard12 = ContactReasonCard(
  title: 'Forgiftning, røgforgiftning, forbrænding og el-stød',
  number: 12,
  symptomCategories: [
    SymptomCategory(
      name:
          'Mistanke om forbrænding eller ætsning i svælg med stridor, hæshed eller synkebesvær',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeRed,
        ),
      ],
    ),
    SymptomCategory(
      name:
          'Indtagelse af medicin i giftig dosis eller symptomer på forgiftning',
      symptoms: [
        Symptom(
          description: 'Alment påvirket',
          code: codeRed,
        ),
        Symptom(
          description: 'Upåvirket',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Indtagelse af giftig plante',
      symptoms: [
        Symptom(
          description: 'Alment påvirket',
          code: codeRed,
        ),
        Symptom(
          description: 'Upåvirket',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Udsættelse for lampeolie eller klordampe',
      symptoms: [
        Symptom(
          description: 'Alment påvirket',
          code: codeRed,
        ),
        Symptom(
          description: 'Upåvirket',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Indtagelse af euforiserende stof',
      symptoms: [
        Symptom(
          description: 'Alment påvirket',
          code: codeRed,
        ),
        Symptom(
          description: 'Upåvirket og tp over 38',
          code: codeOrange,
        ),
        Symptom(
          description: 'Upåvirket og afebril',
          code: codeYellow,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Røgforgiftning',
      symptoms: [
        Symptom(
          description: 'Alment påvirket',
          code: codeRed,
        ),
        Symptom(
          description: 'Upåvirket',
          code: codeOrange,
        ),
        Symptom(
          description: 'Universelt',
          code: codeYellow,
        ),
        Symptom(
          description: 'Lokalt',
          code: codeGreen,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Elstød',
      symptoms: [
        Symptom(
          description: 'Besvimelse ved stød',
          code: codeRed,
        ),
        Symptom(
          description: 'Forbrænding eller EKG-forandringer',
          code: codeOrange,
        ),
        Symptom(
          description: 'Ja',
          code: codeGreen,
        ),
      ],
    ),
  ],
);
