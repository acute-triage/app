import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/common/presentation/widgets/ui/text_typography.dart';
import 'package:flutter_starter/features/contact_card/data/codes.dart';
import 'package:flutter_starter/features/contact_card/domain/code.dart';
import 'package:flutter_starter/features/contact_card/domain/contact_reason_card.dart';
import 'package:flutter_starter/features/contact_card/domain/patient_contact_card.dart';
import 'package:flutter_starter/features/contact_card/domain/symptom.dart';
import 'package:flutter_starter/features/contact_card/domain/sympton_category.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:screenshot/screenshot.dart';

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
  late PatientContactCard patientContactCard;
  Code currentCode = codeGreen;

  @override
  initState() {
    super.initState();

    patientContactCard = PatientContactCard(
      contactReasonCard: widget.contactCard,
    );

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
    patientContactCard = patientContactCard.copyWith(
      findings: {
        ...patientContactCard.findings,
        currentSymptomCategory!: symptom,
      },
    );

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
          actions: [
            if (isDone)
              IconButton(
                icon: const Icon(Icons.close),
                color: currentCode.contrastColor,
                onPressed: () {
                  context.router.maybePop();
                },
              ),
          ],
        ),
        body: SingleChildScrollView(
          // always
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Center(
              child: !isDone
                  ? ChooseSymptomsWidget(
                      category: currentSymptomCategory!,
                      onChooseSympton: onChooseSympton,
                    )
                  : Column(
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        TriageFinished(
                          contactCard: patientContactCard,
                        ),
                        const SizedBox(height: 16.0),
                        TriageResult(
                          contactCard: patientContactCard,
                          forPrint: false,
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

class TriageResult extends StatelessWidget {
  final bool forPrint;

  final PatientContactCard contactCard;
  const TriageResult({
    super.key,
    required this.contactCard,
    this.forPrint = false,
  });

  @override
  Widget build(BuildContext context) {
    final categoryHeaderStyle = forPrint
        ? Theme.of(context).textTheme.bodyLarge
        : Theme.of(context).textTheme.headlineMedium!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (forPrint) ...[
          Container(
            height: 40,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1.0,
              ),
            ),
            child: const Center(
              child: TextTypography.body(
                'Indsæt patientlabel her',
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          const TextTypography.headline(
            'Kontaktårsagskort',
          ),
          const SizedBox(height: 4.0),
          TextTypography.body(
            contactCard.code == codeRed
                ? 'Kræver omgående behandling'
                : 'Påbegynd behandling indenfor: ${contactCard.treatmentTime}',
          ),
          const SizedBox(height: 16.0),
        ],
        TextTypography.headlineSmall(
          '${contactCard.contactReasonCard.number} - ${contactCard.contactReasonCard.title}',
        ),
        const SizedBox(height: 16.0),
        ...contactCard.findingsOrderedByPriority.entries.map(
          (entry) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entry.key.name,
                  style: categoryHeaderStyle,
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    Container(
                      width: 16.0,
                      height: 16.0,
                      decoration: BoxDecoration(
                        color: entry.value?.code.color ?? codeGreen.color,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: Text(
                        entry.value?.description ?? 'Ingen symptomer valgt',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
              ],
            );
          },
        ),
      ],
    );
  }
}

class TriageFinished extends StatefulWidget {
  final PatientContactCard contactCard;

  const TriageFinished({
    super.key,
    required this.contactCard,
  });

  @override
  State<TriageFinished> createState() => _TriageFinishedState();
}

class _TriageFinishedState extends State<TriageFinished> {
  //Create an instance of ScreenshotController
  ScreenshotController screenshotController = ScreenshotController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final code = widget.contactCard.code;

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
            widget.contactCard.treatmentTime,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: code.contrastColor,
                ),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () async {
              final doc = pw.Document();

              screenshotController
                  .captureFromWidget(
                TriageResult(
                  contactCard: widget.contactCard,
                  forPrint: true,
                ),
              )
                  .then(
                (capturedImage) async {
                  doc.addPage(pw.Page(build: (pw.Context context) {
                    final image = pw.MemoryImage(capturedImage);
                    return pw.Center(
                      child: pw.Image(image),
                    ); // Center
                  })); // Page

                  await Printing.layoutPdf(
                    onLayout: (PdfPageFormat format) async => doc.save(),
                  );
                },
              );
              // context.router.maybePop();
            },
            child: const Text('Print resultat'),
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
