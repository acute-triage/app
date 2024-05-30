import 'package:flutter_starter/features/contact_card/data/codes.dart';
import 'package:flutter_starter/features/contact_card/domain/contact_reason_card.dart';
import 'package:flutter_starter/features/contact_card/domain/symptom.dart';
import 'package:flutter_starter/features/contact_card/domain/sympton_category.dart';

const contactCard24 = ContactReasonCard(
  title: 'Frakturer',
  number: 24,
  symptomCategories: [
    SymptomCategory(
      name:
          'Mistanke om compartment-syndrom: stærke smerter, nedsat følesans og/eller paræstesier',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Smerter',
      symptoms: [
        Symptom(
          description: 'VAS 10',
          code: codeOrange,
        ),
        Symptom(
          description: 'VAS 4-9',
          code: codeYellow,
        ),
        Symptom(
          description: 'VAS 1-3',
          code: codeGreen,
        ),
      ],
    ),
    SymptomCategory(
      name:
          'Påvirkede neurovaskulære forhold distalt for skade: nedsat følesans, forlænget kapillærrespons, bleghed, kølig hud, svækket puls',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Åben fraktur: fraktur med sårdannelse/hudperforation',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeYellow,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Lukket fraktur',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeGreen,
        ),
      ],
    ),
  ],
);
