import 'package:flutter_starter/features/contact_card/domain/contact_reason_card.dart';
import 'package:flutter_starter/features/contact_card/domain/symptom.dart';
import 'package:flutter_starter/features/contact_card/domain/sympton_category.dart';

import 'package:flutter_starter/features/contact_card/domain/code.dart';

final contactCard6 = ContactReasonCard(
  title: 'Brystsmerter',
  searchTerms: [
    'hjertesygdom',
    'åndenød',
    'hyperventilation',
    'hjertebanken',
    'besvimelse',
    'familiær disposition',
    'dvt',
    'smerter',
    'feber',
    'kawasakisyndrom',
    'højenergitraume',
  ],
  number: 6,
  symptomCategories: [
    SymptomCategory(
      name: 'Kendt Marfan, Ehlos-Danlos eller Turner syndrom',
      symptoms: [
        Symptom(
          description: 'Ja og svære smerter og dyspnø',
          code: Code.red(),
        ),
        Symptom(
          description: 'Ja',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Kendt hjertesygdom eller nylig thoraxkirurgi',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name:
          'Åndenød, takykardi og lav saturation. Smerter ofte respirations-synkrone',
      symptoms: [
        Symptom(
          description: 'Mistanke om DVT og evt. indtagelse P-piller',
          code: Code.red(),
        ),
        Symptom(
          description: 'Ja',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Anstrengelsesudløst besvimelse',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name:
          'Mistanke om fremmedlegeme i spiserør (savlen, opkast, synkebesvær)',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Smerter ved vejrtrækning uden takykardi eller lav saturation',
      symptoms: [
        Symptom(
          description: 'Svære smerter eller kombineret med åndenød',
          code: Code.orange(),
        ),
        Symptom(
          description: 'Moderate smerter uden åndenød',
          code: Code.yellow(),
        ),
        Symptom(
          description: 'Lette smerter uden åndenød',
          code: Code.green(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Feber',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name:
          'Familiær disposition til pludselig uventet død, medfødt hjertesygdom eller blodprop i hjertet',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Kendt Kawasakisyndrom',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Højenergitraume',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Forværring i liggende og bedring ved foroverbøjning',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.orange(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Hyperventilationstilfælde',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.green(),
        ),
      ],
    ),
  ],
);
