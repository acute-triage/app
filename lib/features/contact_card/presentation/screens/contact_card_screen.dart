import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/common/presentation/widgets/ui/content_padding.dart';
import 'package:flutter_starter/common/presentation/widgets/ui/text_typography.dart';
import 'package:flutter_starter/common/util/haptic_feedback.dart';
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
              playHapticFeedback();

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
                  playHapticFeedback();

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
                        const SizedBox(height: 32.0),
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
        ? Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: 11,
            )
        : Theme.of(context).textTheme.headlineMedium!;

    final symptomStyle = forPrint
        ? Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 8,
            )
        : Theme.of(context).textTheme.bodyMedium;

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
          SizedBox(height: forPrint ? 8 : 16.0),
          const TextTypography.headline(
            'Kontaktårsagskort',
          ),
          const SizedBox(height: 4.0),
          TextTypography.body(
            contactCard.code == codeRed
                ? 'Kræver omgående behandling'
                : 'Påbegynd behandling indenfor: ${contactCard.treatmentTime}',
          ),
          SizedBox(height: forPrint ? 4 : 8.0),
        ],
        TextTypography.headlineSmall(
          '${contactCard.contactReasonCard.number} - ${contactCard.contactReasonCard.title}',
        ),
        const SizedBox(height: 8.0),
        ...contactCard.findingsOrderedByPriority.entries.map(
          (entry) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entry.key.name,
                  style: categoryHeaderStyle,
                ),
                SizedBox(height: forPrint ? 0 : 8.0),
                Row(
                  children: [
                    Container(
                      width: forPrint ? 8 : 16.0,
                      height: forPrint ? 8 : 16.0,
                      decoration: BoxDecoration(
                        color: entry.value?.code.color ?? codeGreen.color,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                    ),
                    SizedBox(width: forPrint ? 4 : 8.0),
                    Expanded(
                      child: Text(
                        entry.value?.description ?? 'Ingen symptomer valgt',
                        style: symptomStyle,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: forPrint ? 8 : 16.0),
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
  bool loading = false;
  pw.MemoryImage? capturedImage;
  //Create an instance of ScreenshotController
  ScreenshotController screenshotController = ScreenshotController();
  Future? imageGenerator;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      imageGenerator = _generateContactCardImage();
    });
  }

  Future<void> _generateContactCardImage() async {
    final raw = await screenshotController.captureFromWidget(
      TriageResult(
        contactCard: widget.contactCard,
        forPrint: true,
      ),
    );

    setState(() {
      capturedImage = pw.MemoryImage(raw);
    });
  }

  @override
  Widget build(BuildContext context) {
    final code = widget.contactCard.code;

    return DefaultTextStyle(
      style: TextStyle(
        color: code.contrastColor,
      ),
      child: ContentPadding(
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
              onPressed: loading
                  ? null
                  : () async {
                      playHapticFeedback();

                      setState(() {
                        loading = true;
                      });

                      await imageGenerator;

                      final doc = pw.Document();

                      doc.addPage(
                        pw.Page(
                          pageFormat: PdfPageFormat.a4,
                          clip: false,
                          build: (pw.Context context) {
                            return pw.Center(
                              // color: PdfColor.fromInt(code.color.value),
                              child: pw.Image(
                                capturedImage!,
                                fit: pw.BoxFit.fitHeight,
                                width: 600,
                              ),
                            ); // Center
                          },
                        ),
                      ); // Page

                      await Printing.layoutPdf(
                        onLayout: (PdfPageFormat format) async => doc.save(),
                      );

                      setState(() {
                        loading = false;
                      });
                      // context.router.maybePop();
                    },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (loading) ...[
                    const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(),
                    ),
                    const SizedBox(width: 8.0),
                  ],
                  const Text('Udskriv kontaktårsagskort'),
                ],
              ),
            ),
          ],
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
                  playHapticFeedback();

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
                playHapticFeedback();

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
