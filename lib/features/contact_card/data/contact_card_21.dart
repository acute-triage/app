import 'package:flutter_starter/features/contact_card/data/codes.dart';
import 'package:flutter_starter/features/contact_card/domain/contact_reason_card.dart';
import 'package:flutter_starter/features/contact_card/domain/symptom.dart';
import 'package:flutter_starter/features/contact_card/domain/sympton_category.dart';

const contactCard21 = ContactReasonCard(
  title: 'Underlivssmerter (US) ± vaginal blødning hos teenagepige',
  number: 21,
  symptomCategories: [
    SymptomCategory(
      name: 'US eller mavesmerter hos potentielt gravid (tag graviditetstest)',
      symptoms: [
        Symptom(
          description: 'Bleg eller alment medtaget',
          code: codeRed,
        ),
        Symptom(
          description: 'Ja',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name: 'US og vaginal blødning i 2. eller 3. del af graviditet',
      symptoms: [
        Symptom(
          description: 'Bleg eller alment medtaget',
          code: codeRed,
        ),
        Symptom(
          description: 'Ja',
          code: codeOrange,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Ensidige US, der kan have spredt sig',
      symptoms: [
        Symptom(
          description: 'Ja, stærke med påvirket almentilstand',
          code: codeOrange,
        ),
        Symptom(
          description: 'Ja, moderate til lette',
          code: codeYellow,
        ),
      ],
    ),
    SymptomCategory(
      name:
          'Større vaginalblødning (dvs. mere end 3 bind, der føles tunge efter 2 timers brug)',
      symptoms: [
        Symptom(
          description: 'Med påvirket almentilstand',
          code: codeOrange,
        ),
        Symptom(
          description: 'Uden påvirket almentilstand',
          code: codeYellow,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Ømhed i nedre halvdel af abdomen med feber (over 38.0)',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeYellow,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Diffuse mavesmerter, der har flyttet sig til hø. fossa',
      symptoms: [
        Symptom(
          description: 'Ligger forpint og stille i seng',
          code: codeOrange,
        ),
        Symptom(
          description: 'Ja',
          code: codeYellow,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Synligt brok',
      symptoms: [
        Symptom(
          description: 'Misfarvet eller ømt og hårdt brok',
          code: codeOrange,
        ),
        Symptom(
          description: 'Brok kan reponeres',
          code: codeGreen,
        ),
      ],
    ),
  ],
);
