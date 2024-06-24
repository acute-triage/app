import 'package:flutter_starter/features/contact_card/domain/code.dart';
import 'package:flutter_starter/features/contact_card/domain/contact_reason_card.dart';
import 'package:flutter_starter/features/contact_card/domain/symptom.dart';
import 'package:flutter_starter/features/contact_card/domain/sympton_category.dart';

final contactCard11 = ContactReasonCard(
  title: 'Feber - temperatur på 38 °C eller derover',
  searchTerms: [
    'nakkestivhed',
    'rygstiv',
    'nakkerygstiv',
    'petekkier',
    'immundefekt',
    'kirurgi',
    'urinvejsmisdannelse',
    'nyresygdom',
    'bevidsthedspåvirket',
    'irritabel',
    'utrøstelig',
  ],
  number: 11,
  symptomCategories: [
    SymptomCategory(
      name: 'Nakkerygstiv og alment medtaget',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.red(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Barn under 3 mdr.',
      symptoms: [
        Symptom(
          description: 'Bevidsthedspåvirket',
          code: Code.red(),
        ),
        Symptom(
          description: 'Temperatur over 38.0 eller under 36.0',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Barn til og med 2 år',
      symptoms: [
        Symptom(
          description: 'Bevidsthedspåvirket',
          code: Code.red(),
        ),
        Symptom(
          description: 'Irritabel eller utrøstelig',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Barn over 2 år',
      symptoms: [
        Symptom(
          description: 'Bevidsthedspåvirket',
          code: Code.red(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Nakkerygstiv men ikke alment medtaget',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Petekkier',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Immundefekt barn (se "Risikopatient")',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Nylig kirurgi eller kateter (intravenøst, shunt)',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.yellow(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Kendt urinvejsmisdannelse eller nyresygdom',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.yellow(),
        ),
      ],
    ),
  ],
);
