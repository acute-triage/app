import 'package:flutter_starter/features/contact_card/data/codes.dart';
import 'package:flutter_starter/features/contact_card/domain/contact_reason_card.dart';
import 'package:flutter_starter/features/contact_card/domain/symptom.dart';
import 'package:flutter_starter/features/contact_card/domain/sympton_category.dart';

const contactCard2 = ContactReasonCard(
  title: 'Træthed og bleghed (anæmi)',
  number: 2,
  searchTerms: [
    'træthed',
    'bleghed',
    'anæmi',
    'næseblod',
    'næseblødninger',
    'åndenød',
    'halten',
    'smerter',
    'vægttab',
    'feber',
    'petekkier',
  ],
  symptomCategories: [
    SymptomCategory(
      name: 'Petekkier',
      symptoms: [
        Symptom(
          description: 'Temperatur over eller lig 38.0',
          code: codeOrange,
        ),
        Symptom(
          description: 'Ingen feber',
          code: codeYellow,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Vægttab',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeYellow,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Halten, knogle- eller ledsmerter',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeYellow,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Stomatitis (mundbetændelse)',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeYellow,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Næseblødninger',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeYellow,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Åndenød/takypnø',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeYellow,
        ),
      ],
    ),
  ],
);
