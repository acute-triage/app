import 'package:flutter_starter/features/contact_card/data/codes.dart';
import 'package:flutter_starter/features/contact_card/domain/contact_reason_card.dart';
import 'package:flutter_starter/features/contact_card/domain/symptom.dart';
import 'package:flutter_starter/features/contact_card/domain/sympton_category.dart';

const contactCard9 = ContactReasonCard(
  title: 'Diabetes mellitus (DM)',
  number: 9,
  symptomCategories: [
    SymptomCategory(
      name: 'Nyopdaget DM',
      symptoms: [
        Symptom(
          description: 'pH under 7.10, HCO3- under 5 mmol/l',
          code: codeRed,
        ),
        Symptom(
          description: 'pH 7.10-7.19, HCO3- 5-10 mmol/l',
          code: codeOrange,
        ),
        Symptom(
          description: 'pH 7.20-7.30, HCO3- 10-15 mmol/l',
          code: codeYellow,
        ),
        Symptom(
          description: 'pH over 7.30, HCO3- over 15 mmol/l',
          code: codeGreen,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Kendt DM med hyperglykæmi',
      symptoms: [
        Symptom(
          description: 'pH under 7.10, HCO3- under 5 mmol/l',
          code: codeRed,
        ),
        Symptom(
          description: 'pH 7.10-7.19, HCO3- 5-10 mmol/l',
          code: codeOrange,
        ),
        Symptom(
          description: 'pH 7.20-7.30, HCO3- 10-15 mmol/l',
          code: codeYellow,
        ),
        Symptom(
          description: 'pH over 7.30, HCO3- over 15 mmol/l',
          code: codeGreen,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Kendt DM med hypoglykæmi',
      symptoms: [
        Symptom(
          description: 'BS under eller lig 3',
          code: codeOrange,
        ),
        Symptom(
          description: 'BS over 3',
          code: codeYellow,
        ),
      ],
    ),
  ],
);
