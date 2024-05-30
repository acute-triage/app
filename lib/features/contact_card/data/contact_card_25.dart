import 'package:flutter_starter/features/contact_card/data/codes.dart';
import 'package:flutter_starter/features/contact_card/domain/contact_reason_card.dart';
import 'package:flutter_starter/features/contact_card/domain/symptom.dart';
import 'package:flutter_starter/features/contact_card/domain/sympton_category.dart';

const contactCard25 = ContactReasonCard(
  title: 'Kontaktårsag der ikke passer til noget kort',
  number: 25,
  symptomCategories: [
    SymptomCategory(
      name:
          'Relevante oplysninger fra anamnesen og objektive fund, som giver grund til optriagering.',
      symptoms: [
        Symptom(
          description: 'Rød',
          code: codeRed,
        ),
        Symptom(
          description: 'Orange',
          code: codeOrange,
        ),
        Symptom(
          description: 'Gul',
          code: codeYellow,
        ),
        Symptom(
          description: 'Grøn',
          code: codeGreen,
        ),
      ],
    ),
  ],
);
