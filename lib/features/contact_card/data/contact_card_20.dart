import 'package:flutter_starter/features/contact_card/data/codes.dart';
import 'package:flutter_starter/features/contact_card/domain/contact_reason_card.dart';
import 'package:flutter_starter/features/contact_card/domain/symptom.dart';
import 'package:flutter_starter/features/contact_card/domain/sympton_category.dart';

const contactCard20 = ContactReasonCard(
  title: 'Spiseproblemer, vægttab og anorexi',
  number: 20,
  searchTerms: [
    'spiseforstyrrelse'
        'arytmi'
        'bradykardi under 30'
        'ødemer'
        'vægt'
  ],
  symptomCategories: [
    SymptomCategory(
      name: 'Vægttab uden anorexi',
      symptoms: [
        Symptom(description: 'Ja', code: codeGreen),
      ],
    ),
    SymptomCategory(
      name: 'Arytmi anden end sinusbradykardi',
      symptoms: [
        Symptom(description: 'Ja', code: codeOrange),
      ],
    ),
    SymptomCategory(
      name: 'Synkope',
      symptoms: [
        Symptom(description: 'Ja', code: codeOrange),
      ],
    ),
    SymptomCategory(
      name: 'Kramper',
      symptoms: [
        Symptom(description: 'Ja', code: codeOrange),
      ],
    ),
    SymptomCategory(
      name: 'Hjerteinsufficiens',
      symptoms: [
        Symptom(description: 'Ja', code: codeOrange),
      ],
    ),
    SymptomCategory(
      name: 'Leverinsufficiens',
      symptoms: [
        Symptom(description: 'Ja', code: codeOrange),
      ],
    ),
    SymptomCategory(
      name: ' Elektrolytforstyrrelser (målt)',
      symptoms: [
        Symptom(description: 'Pancreatitis', code: codeYellow),
      ],
    ),
    SymptomCategory(
      name: 'Bradykardi under 30',
      symptoms: [
        Symptom(description: 'Ja', code: codeYellow),
      ],
    ),
    SymptomCategory(
      name:
          'Bradykardi under 40 kombineret med hypotension (sys-BT under 80) eller svimmelhed',
      symptoms: [
        Symptom(description: 'Ja', code: codeYellow),
      ],
    ),
    SymptomCategory(
      name: 'Temperatur under 35.0°C',
      symptoms: [
        Symptom(description: 'Ja', code: codeYellow),
      ],
    ),
    SymptomCategory(
      name:
          'Refeeding syndrom med mistanke om udtalte ødemer eller serum fosfat under 0.65 mmol/l',
      symptoms: [Symptom(description: 'Ja', code: codeOrange)],
    ),
    SymptomCategory(
      name: 'Udtalte ødemer',
      symptoms: [
        Symptom(description: 'Ja', code: codeOrange),
      ],
    ),
    SymptomCategory(
      name: 'Serum fosfat under 0.65 mmol/l',
      symptoms: [
        Symptom(description: 'Ja', code: codeOrange),
      ],
    ),
    SymptomCategory(
      name: 'Vægt for højde under 70% af 50-percentil (forventet)',
      symptoms: [
        Symptom(description: 'Ja', code: codeGreen),
      ],
    ),
  ],
);
