import 'package:flutter_starter/features/contact_card/domain/contact_reason_card.dart';
import 'package:flutter_starter/features/contact_card/domain/symptom.dart';
import 'package:flutter_starter/features/contact_card/domain/sympton_category.dart';

import 'package:flutter_starter/features/contact_card/domain/code.dart';

final contactCard5 = ContactReasonCard(
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
          code: Code.red(),
        ),
      ],
    ),
    SymptomCategory(
      name:
          'Hovedtraume med neurologiske udfald (nedsat kraft, dobbeltsyn, talebesvær)',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.red(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'ITP, AK-behandling, hæmofili',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.red(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Højenergitraume',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.red(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Forgiftning/elstød',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.red(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Diabetes og pH under 7.10',
      symptoms: [
        Symptom(
          description: 'Ja (pH under 7.10)',
          code: Code.red(),
        ),
        Symptom(
          description: 'Ja (pH over eller lig 7.10)',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name:
          'Feber (over eller lig 38.0), nakkerygstiv eller anden meningitismistanke',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.red(),
        ),
      ],
    ),
    SymptomCategory(
      name:
          'Feber (over eller lig 38.0), og mere bevidsthedspåvirket end irritabel (nedsat smerte, konfus osv.)',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.red(),
        ),
        Symptom(
          description: 'Nej, ”kun” irritabel (utrøstelig)',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Vejrtrækningsbesvær (alle former)',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.red(),
        ),
      ],
    ),
  ],
);
