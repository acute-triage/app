import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/features/contact_card/data/codes.dart';
import 'package:flutter_starter/features/contact_card/domain/code.dart';
import 'package:flutter_starter/features/contact_card/domain/contact_reason_card.dart';
import 'package:flutter_starter/features/contact_card/domain/symptom.dart';
import 'package:flutter_starter/features/contact_card/domain/sympton_category.dart';

@RoutePage()
class ContactCardScreen extends ConsumerStatefulWidget {
  final ContactReasonCard contactCard;

  const ContactCardScreen({
    super.key,
    required this.contactCard,
  });

  @override
  ConsumerState<ContactCardScreen> createState() => _ContactCardScreenState();
}

class _ContactCardScreenState extends ConsumerState<ContactCardScreen> {
  SymptomCategory? currentSymptomCategory;
  List<Symptom> selectedSymptoms = [];
  Code currentCode = codeGreen;

  @override
  initState() {
    super.initState();

    currentSymptomCategory = widget.contactCard.symptomCategories.first;
  }

  Code _detectCode() {
    final selectedCodes = selectedSymptoms.map((e) => e.code).toList();

    if (selectedCodes.isEmpty) {
      return codeGreen;
    }

    final lowestCode = selectedCodes.reduce((value, element) {
      return value.number < element.number ? value : element;
    });

    return lowestCode;
  }

  onChooseSympton(Symptom? symptom) {
    // If symptom is not null, add it to the list of selected symptoms
    if (symptom != null) {
      selectedSymptoms.add(symptom);
    }

    setState(() {
      currentCode = _detectCode();
    });

    // Go to next symptom category
    final nextIndex =
        widget.contactCard.symptomCategories.indexOf(currentSymptomCategory!) +
            1;

    setState(() {
      currentSymptomCategory =
          nextIndex < widget.contactCard.symptomCategories.length
              ? widget.contactCard.symptomCategories[nextIndex]
              : null;
    });
  }

  _removeLastSelectedSymptom() {
    if (selectedSymptoms.isNotEmpty) {
      selectedSymptoms.removeLast();
    }
  }

  bool get isDone => currentSymptomCategory == null;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: isDone
            ? ColorScheme.fromSeed(
                seedColor: currentCode.color,
                onBackground: currentCode.contrastColor,
                background: currentCode.color,
              )
            : null,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: isDone ? currentCode.contrastColor : null,
              displayColor: isDone ? currentCode.contrastColor : null,
            ),
        appBarTheme: Theme.of(context).appBarTheme.copyWith(
            backgroundColor: isDone ? currentCode.color : null,
            titleTextStyle: isDone
                ? Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: currentCode.contrastColor,
                    )
                : Theme.of(context).textTheme.bodyMedium!),
      ),
      child: Scaffold(
        backgroundColor: isDone ? currentCode.color : null,
        appBar: AppBar(
          title: !isDone
              ? Text(widget.contactCard.title)
              : Text(currentCode.description),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: isDone ? currentCode.contrastColor : null,
            onPressed: () {
              if (isDone) {
                _removeLastSelectedSymptom();

                setState(() {
                  currentSymptomCategory =
                      widget.contactCard.symptomCategories.last;
                });

                return;
              }

              final currentSymptomCategoryIndex = widget
                  .contactCard.symptomCategories
                  .indexOf(currentSymptomCategory!);

              if (currentSymptomCategoryIndex > 0) {
                _removeLastSelectedSymptom();

                setState(() {
                  currentSymptomCategory = widget.contactCard
                      .symptomCategories[currentSymptomCategoryIndex - 1];
                });

                return;
              }

              context.router.maybePop();
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Center(
            child: !isDone
                ? ChooseSymptomsWidget(
                    category: currentSymptomCategory!,
                    onChooseSympton: onChooseSympton,
                  )
                : DefaultTextStyle(
                    style: TextStyle(
                      color: currentCode.contrastColor,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 8.0),
                        Text(
                          'Barnet triageres ${currentCode.name} på baggrund af det udfyldte kontaktårsagskort',
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16.0),
                        // heading
                        Text(
                          'Behandlingstid: ${currentCode.maxWaitTime.inMinutes == 0 ? 'Omgående' : '0-${currentCode.maxWaitTime.inMinutes} minutter'}',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                color: currentCode.contrastColor,
                              ),
                        ),
                        const SizedBox(height: 16.0),
                        ElevatedButton(
                          onPressed: () {
                            context.router.maybePop();
                          },
                          child: const Text('Gem resultat'),
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

class ChooseSymptomsWidget extends StatelessWidget {
  final SymptomCategory category;
  final void Function(Symptom? symptom) onChooseSympton;

  const ChooseSymptomsWidget({
    super.key,
    required this.category,
    required this.onChooseSympton,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IntrinsicHeight(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    category.name,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          height: 1.5,
                        ),
                  ),
                ),
              ),
              ...category.symptoms.map(
                (sympton) => Expanded(
                  child: FilledButton(
                    onPressed: () {
                      onChooseSympton(sympton);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        sympton.code.color,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        sympton.description,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: FilledButton(
                  onPressed: () {
                    onChooseSympton(null);
                  },
                  child: const Text('Ingen af ovenstående'),
                ),
              ),
            ]
                .expand(
                  (element) => [
                    element,
                    const SizedBox(
                      height: 16.0,
                    ),
                  ],
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
