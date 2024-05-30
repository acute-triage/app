import 'package:flutter_starter/features/contact_card/data/codes.dart';
import 'package:flutter_starter/features/contact_card/domain/contact_reason_card.dart';
import 'package:flutter_starter/features/contact_card/domain/symptom.dart';
import 'package:flutter_starter/features/contact_card/domain/sympton_category.dart';

const contactCard11 = ContactReasonCard(
  title: 'Feber - temperatur på 38 °C eller derover',
  number: 11,
  symptomCategories: [
    SymptomCategory(
      name: 'Nakkerygstiv og alment medtaget',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeRed,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Barn under 3 mdr.',
      symptoms: [
        Symptom(
          description: 'Bevidsthedspåvirket',
          code: codeRed,
        ),
        Symptom(
          description: 'Temperatur over 38.0 eller under 36.0',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Barn til og med 2 år',
      symptoms: [
        Symptom(
          description: 'Bevidsthedspåvirket',
          code: codeRed,
        ),
        Symptom(
          description: 'Irritabel eller utrøstelig',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Barn over 2 år',
      symptoms: [
        Symptom(
          description: 'Bevidsthedspåvirket',
          code: codeRed,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Nakkerygstiv men ikke alment medtaget',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Petekkier',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Immundefekt barn (se "Risikopatient")',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Nylig kirurgi eller kateter (intravenøst, shunt)',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeYellow,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Kendt urinvejsmisdannelse eller nyresygdom',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeYellow,
        ),
      ],
    ),
  ],
);
