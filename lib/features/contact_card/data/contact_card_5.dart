import 'package:flutter_starter/features/contact_card/data/codes.dart';
import 'package:flutter_starter/features/contact_card/domain/contact_reason_card.dart';
import 'package:flutter_starter/features/contact_card/domain/symptom.dart';
import 'package:flutter_starter/features/contact_card/domain/sympton_category.dart';

const contactCard5 = ContactReasonCard(
  title: 'Bevidsthedspåvirkning',
  number: 5,
  searchTerms: [
    'stoffer',
    'forgiftning',
    'euforiserende',
    'hovedtraume',
    'vejrtrækningsbesvær',
    'diabetes',
    'feber',
  ],
  symptomCategories: [
    SymptomCategory(
      name: 'Hovedtraume og faldende bevidsthedsniveau',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeRed,
        ),
      ],
    ),
    SymptomCategory(
      name:
          'Hovedtraume med neurologiske udfald (nedsat kraft, dobbeltsyn, talebesvær)',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeRed,
        ),
      ],
    ),
    SymptomCategory(
      name: 'ITP, AK-behandling, hæmofili',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeRed,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Højenergitraume',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeRed,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Forgiftning/elstød',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeRed,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Diabetes og pH under 7.10',
      symptoms: [
        Symptom(
          description: 'Ja (pH under 7.10)',
          code: codeRed,
        ),
        Symptom(
          description: 'Ja (pH over eller lig 7.10)',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name:
          'Feber (over eller lig 38.0), nakkerygstiv eller anden meningitismistanke',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeRed,
        ),
      ],
    ),
    SymptomCategory(
      name:
          'Feber (over eller lig 38.0), og mere bevidsthedspåvirket end irritabel (nedsat smerte, konfus osv.)',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeRed,
        ),
        Symptom(
          description: 'Nej, ”kun” irritabel (utrøstelig)',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Vejrtrækningsbesvær (alle former)',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeRed,
        ),
      ],
    ),
  ],
);
