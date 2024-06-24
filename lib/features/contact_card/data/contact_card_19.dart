import 'package:flutter_starter/features/contact_card/domain/contact_reason_card.dart';
import 'package:flutter_starter/features/contact_card/domain/symptom.dart';
import 'package:flutter_starter/features/contact_card/domain/sympton_category.dart';

import 'package:flutter_starter/features/contact_card/domain/code.dart';

final contactCard19 = ContactReasonCard(
  title: 'Mistanke om fysisk eller seksuelt overgreb',
  searchTerms: [
    'vold',
    'misbrug',
    'mishandling',
    'voldtægt',
    'seksuelt',
    'sex',
    'blåtmærke',
  ],
  number: 19,
  symptomCategories: [
    SymptomCategory(
      name: 'Synlige tegn på overgreb',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.yellow(),
        ),
      ],
    ),
    SymptomCategory(
      name: 'Smerter',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: Code.yellow(),
        ),
      ],
    ),
  ],
);
