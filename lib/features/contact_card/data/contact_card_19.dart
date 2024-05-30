import 'package:flutter_starter/features/contact_card/data/codes.dart';
import 'package:flutter_starter/features/contact_card/domain/contact_reason_card.dart';
import 'package:flutter_starter/features/contact_card/domain/symptom.dart';
import 'package:flutter_starter/features/contact_card/domain/sympton_category.dart';

const contactCard19 = ContactReasonCard(
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
          code: codeYellow,
        ),
      ],
    ),
    SymptomCategory(
      name: 'Smerter',
      symptoms: [
        Symptom(
          description: 'Ja',
          code: codeYellow,
        ),
      ],
    ),
  ],
);
