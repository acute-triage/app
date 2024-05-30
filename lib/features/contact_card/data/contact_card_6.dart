import 'package:flutter_starter/features/contact_card/data/codes.dart';
import 'package:flutter_starter/features/contact_card/domain/contact_reason_card.dart';
import 'package:flutter_starter/features/contact_card/domain/symptom.dart';
import 'package:flutter_starter/features/contact_card/domain/sympton_category.dart';

const contactCard6 = ContactReasonCard(
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
          code: codeRed,
        ),
        Symptom(
          description: 'Ja',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Kendt hjertesygdom eller nylig thoraxkirurgi',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name:
          'Åndenød, takykardi og lav saturation. Smerter ofte respirations-synkrone',
      symptoms: [
        Symptom(
          description: 'Mistanke om DVT og evt. indtagelse P-piller',
          code: codeRed,
        ),
        Symptom(
          description: 'Ja',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Anstrengelsesudløst besvimelse',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name:
          'Mistanke om fremmedlegeme i spiserør (savlen, opkast, synkebesvær)',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Smerter ved vejrtrækning uden takykardi eller lav saturation',
      symptoms: [
        Symptom(
          description: 'Svære smerter eller kombineret med åndenød',
          code: codeOrange,
        ),
        Symptom(
          description: 'Moderate smerter uden åndenød',
          code: codeYellow,
        ),
        Symptom(
          description: 'Lette smerter uden åndenød',
          code: codeGreen,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Feber',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name:
          'Familiær disposition til pludselig uventet død, medfødt hjertesygdom eller blodprop i hjertet',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Kendt Kawasakisyndrom',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Højenergitraume',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Forværring i liggende og bedring ved foroverbøjning',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Hyperventilationstilfælde',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeGreen,
        ),
      ],
    ),
  ],
);
