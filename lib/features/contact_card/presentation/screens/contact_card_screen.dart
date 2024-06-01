import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/features/contact_card/data/codes.dart';
import 'package:flutter_starter/features/contact_card/domain/code.dart';
import 'package:flutter_starter/features/contact_card/domain/contact_reason_card.dart';
import 'package:flutter_starter/features/contact_card/domain/patient_contact_card.dart';
import 'package:flutter_starter/features/contact_card/domain/symptom.dart';
import 'package:flutter_starter/features/contact_card/domain/sympton_category.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

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
  PatientContactCard patientContactCard = const PatientContactCard();
  Code currentCode = codeGreen;

  @override
  initState() {
    super.initState();

    currentSymptomCategory = widget.contactCard.symptomCategories.first;
  }

  Code _detectCode() {
    final symptomCodes =
        patientContactCard.symptoms.map((symptom) => symptom.code).toList();

    if (symptomCodes.isEmpty) {
      return codeGreen;
    }

    final lowestCode = symptomCodes.reduce((lastCode, code) {
      return lastCode.number < code.number ? lastCode : code;
    });

    return lowestCode;
  }

  onChooseSympton(Symptom? symptom) {
    // If symptom is not null, add it to the list of selected symptoms
    if (symptom != null) {
      patientContactCard = patientContactCard.copyWith(
        findings: {
          ...patientContactCard.findings,
          currentSymptomCategory!: symptom,
        },
      );
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
                : TriageFinished(code: currentCode),
          ),
        ),
      ),
    );
  }
}

class PrintableTriage extends StatelessWidget {
  const PrintableTriage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class TriageFinished extends StatelessWidget {
  const TriageFinished({
    super.key,
    required this.code,
  });

  final Code code;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
        color: code.contrastColor,
      ),
      child: Column(
        children: [
          const SizedBox(height: 8.0),
          Text(
            'Barnet triageres ${code.name} på baggrund af det udfyldte kontaktårsagskort',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16.0),
          // heading
          Text(
            'Behandlingstid: ${code.maxWaitTime.inMinutes == 0 ? 'Omgående' : '0-${code.maxWaitTime.inMinutes} minutter'}',
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: code.contrastColor,
                ),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () async {
              final doc = pw.Document();

              doc.addPage(pw.Page(
                  pageFormat: PdfPageFormat.a4,
                  build: (pw.Context context) {
                    return pw.Center(
                      child: pw.Text('Hello World'),
                    ); // Center
                  })); // Page

              await Printing.layoutPdf(
                onLayout: (PdfPageFormat format) async => doc.save(),
              );
              // context.router.maybePop();
            },
            child: const Text('Gem resultat'),
          ),
        ],
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
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
            (sympton) => Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
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
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: sympton.code.contrastColor,
                        ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: FilledButton(
              onPressed: () {
                onChooseSympton(null);
              },
              child: const Text('Nej'),
            ),
          ),
        ],
      ),
    );
  }
}
