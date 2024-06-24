import 'package:flutter_starter/features/contact_card/domain/contact_reason_card.dart';
import 'package:flutter_starter/features/contact_card/domain/symptom.dart';
import 'package:flutter_starter/features/contact_card/domain/sympton_category.dart';

import 'package:flutter_starter/features/contact_card/domain/code.dart';

final contactCard25 = ContactReasonCard(
  title: 'Kontaktårsag der ikke passer til noget kort',
  number: 25,
  searchTerms: [],
  symptomCategories: [
    SymptomCategory(
      name:
          'Relevante oplysninger fra anamnesen og objektive fund, som giver grund til optriagering.',
      symptoms: [
        Symptom(
          description: 'Rød',
          code: Code.red(),
        ),
        Symptom(
          description: 'Orange',
          code: Code.orange(),
        ),
        Symptom(
          description: 'Gul',
          code: Code.yellow(),
        ),
        Symptom(
          description: 'Grøn',
          code: Code.green(),
        ),
      ],
    ),
  ],
);
