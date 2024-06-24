import 'package:flutter_starter/features/contact_card/domain/contact_reason_card.dart';
import 'package:flutter_starter/features/contact_card/domain/symptom.dart';
import 'package:flutter_starter/features/contact_card/domain/sympton_category.dart';

import 'package:flutter_starter/features/contact_card/domain/code.dart';

final contactCard8 = ContactReasonCard(
  title: 'Dehydrering',
  number: 8,
  searchTerms: [],
  symptomCategories: [
    SymptomCategory(
      name: 'Symptomer',
      type: SymptomCategoryType.symptomsCountToCode,
      symptomsCountToCode: {
        2: Code.green(),
        4: Code.yellow(),
        5: Code.orange(),
        6: Code.red(),
      },
      symptoms: [
        Symptom(
          description: 'Tørstig, træt/sløv eller urolig',
        ),
        Symptom(
          description: 'Takypnø (dvs. gul, orange eller rød på RF)',
        ),
        Symptom(
          description: '3 Takykardi (dvs. gul, orange eller rød på P)',
        ),
        Symptom(
          description: 'Kapillærrespons over 2 s',
        ),
        Symptom(
          description: 'Nedsat tåreproduktion (græder uden tårer)',
        ),
        Symptom(
          description: 'Tørre slimhinder (inkl. klistrede slimhinder)',
        ),
        Symptom(
          description:
              'Nedsat elasticitet af huden. Trækker sig ikke sammen straks',
        ),
        Symptom(
          description: 'Indsunkne øjne',
        ),
      ],
    ),
  ],
);
