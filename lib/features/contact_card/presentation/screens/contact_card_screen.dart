import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/common/presentation/widgets/ui/content_padding.dart';
import 'package:flutter_starter/common/presentation/widgets/ui/text_typography.dart';
import 'package:flutter_starter/common/util/haptic_feedback.dart';
import 'package:flutter_starter/features/confirm_dialog/util/show_confirm_dialog.dart';
import 'package:flutter_starter/features/contact_card/data/codes.dart';
import 'package:flutter_starter/features/contact_card/domain/code.dart';
import 'package:flutter_starter/features/contact_card/domain/contact_reason_card.dart';
import 'package:flutter_starter/features/contact_card/domain/finding.dart';
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

  @override
  initState() {
    super.initState();

    patientContactCard = PatientContactCard(
      contactReasonCard: widget.contactCard,
    );

    currentSymptomCategory = widget.contactCard.symptomCategories.first;
  }

  onChooseSympton(List<Symptom> symptoms) {
    // If symptom is not null, add it to the list of selected symptoms
    patientContactCard = patientContactCard.copyWith(
      findings: [
        ...patientContactCard.findings,
        Finding(
          category: currentSymptomCategory!,
          symptoms: symptoms,
        ),
      ],
    );

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

  _removeLastFinding() {
    final findings = patientContactCard.findings;

    if (findings.isNotEmpty) {
      setState(() {
        patientContactCard = patientContactCard.copyWith(
          findings: findings.sublist(0, findings.length - 1),
        );
      });
    }
  }

  Code get currentCode {
    return patientContactCard.code;
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
                _removeLastFinding();

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
                _removeLastFinding();

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
            IconButton(
              icon: const Icon(Icons.close),
              color: isDone ? currentCode.contrastColor : null,
              onPressed: () async {
                playHapticFeedback();

                if (!isDone && patientContactCard.findings.isNotEmpty) {
                  // confirm dialog
                  final confirmed = await showConfirmDialog(
                    context,
                    title: 'Er du sikker?',
                    content:
                        'Hvis du forlader denne side, vil du miste alle dine valgte symptomer',
                    shake: true,
                  );

                  if (!confirmed) {
                    return;
                  }
                }

                if (context.mounted) {
                  context.router.maybePop();
                }
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          // always
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TriageResult(
                          contactCard: patientContactCard,
                          forPrint: false,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      PrintTriage(
                        contactCard: patientContactCard,
                      ),
                      const SizedBox(height: 32.0),
                    ],
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
          TextTypography.headline('Kontaktårsagskort',
              textStyle: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontSize: 24,
                  )),
          const SizedBox(height: 4.0),
          TextTypography.body(
            '${contactCard.code.description} - ${contactCard.code == codeRed ? 'Kræver omgående behandling' : 'Påbegynd behandling indenfor: ${contactCard.treatmentTime}'}',
          ),
          SizedBox(height: forPrint ? 4 : 8.0),
        ],
        TextTypography.headlineSmall(
          '${contactCard.contactReasonCard.number} - ${contactCard.contactReasonCard.title}',
          textStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontSize: forPrint ? 18 : 20,
              ),
        ),
        const SizedBox(height: 8.0),
        ...contactCard.findingsOrderedByPriority.map(
          (finding) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  finding.category.name,
                  style: categoryHeaderStyle,
                ),
                SizedBox(height: forPrint ? 0 : 8.0),
                Row(
                  children: [
                    Container(
                      width: forPrint ? 8 : 16.0,
                      height: forPrint ? 8 : 16.0,
                      decoration: BoxDecoration(
                        color: finding.code.color,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: contactCard.code == codeOrange
                              ? Colors.white
                              : contactCard.code.contrastColor,
                          width: 1.0,
                        ),
                      ),
                    ),
                    SizedBox(width: forPrint ? 4 : 8.0),
                    Expanded(
                      child: Text(
                        finding.symptoms.isNotEmpty
                            ? finding.symptoms
                                .map((e) => e.description)
                                .join('\n\n')
                            : 'Ingen symptomer valgt',
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

class TriageFinished extends StatelessWidget {
  final PatientContactCard contactCard;

  const TriageFinished({
    super.key,
    required this.contactCard,
  });

  @override
  Widget build(BuildContext context) {
    final code = contactCard.code;

    return DefaultTextStyle(
      style: TextStyle(
        color: code.contrastColor,
      ),
      child: ContentPadding(
        child: Column(
          children: [
            const SizedBox(height: 8.0),
            Text(
              'Patient triageres ${code.name} jf. kontaktårsagskortet',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0),
            // heading
            Text(
              contactCard.treatmentTime,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: code.contrastColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class PrintTriage extends StatefulWidget {
  final PatientContactCard contactCard;

  const PrintTriage({
    super.key,
    required this.contactCard,
  });

  @override
  State<PrintTriage> createState() => _PrintTriageState();
}

class _PrintTriageState extends State<PrintTriage> {
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

  _print() async {
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
  }

  @override
  Widget build(BuildContext context) {
    final code = widget.contactCard.code;

    return DefaultTextStyle(
      style: TextStyle(
        color: code.contrastColor,
      ),
      child: ElevatedButton(
        onPressed: loading
            ? null
            : () async {
                _print();
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
    );
  }
}

class ChooseSymptomsWidget extends StatelessWidget {
  final SymptomCategory category;
  final void Function(List<Symptom> symptom) onChooseSympton;

  const ChooseSymptomsWidget({
    super.key,
    required this.category,
    required this.onChooseSympton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // min height
      constraints: BoxConstraints(
        minHeight: context.sizes.height * 0.8,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: context.sizes.height * 0.05),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                category.name,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      height: 1.5,
                      fontSize: 24,
                    ),
              ),
            ),
          ),
          SizedBox(height: context.sizes.height * 0.05),
          if (category.type == SymptomCategoryType.single) ...[
            ...category.symptoms.map(
              (symptom) => Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: FilledButton(
                  onPressed: () {
                    playHapticFeedback();

                    onChooseSympton([symptom]);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      symptom.code!.color,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      symptom.description,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: symptom.code!.contrastColor,
                          ),
                    ),
                  ),
                ),
              ),
            ),
            FilledButton(
              onPressed: () {
                playHapticFeedback();

                onChooseSympton([]);
              },
              child: const Text('Nej'),
            ),
          ],
          if (category.type == SymptomCategoryType.multiple) ...[
            _MultipleChoiceSymptoms(
              category: category,
              onChooseSymptoms: onChooseSympton,
            ),
          ],
        ],
      ),
    );
  }
}

class _MultipleChoiceSymptoms extends StatefulWidget {
  final void Function(List<Symptom> symptom) onChooseSymptoms;

  const _MultipleChoiceSymptoms({
    required this.category,
    required this.onChooseSymptoms,
  });

  final SymptomCategory category;

  @override
  State<_MultipleChoiceSymptoms> createState() =>
      _MultipleChoiceSymptomsState();
}

class _MultipleChoiceSymptomsState extends State<_MultipleChoiceSymptoms> {
  List<Symptom> checked = [];

  _onChooseSympton(Symptom? symptom) {
    playHapticFeedback();

    if (symptom == null) {
      // onChooseSympton(null);
      return;
    }

    if (checked.contains(symptom)) {
      setState(() {
        checked.remove(symptom);
      });
    } else {
      setState(() {
        checked.add(symptom);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...widget.category.symptoms.map(
          (symptom) => Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                value: checked.contains(symptom),
                onChanged: (checked) {
                  playHapticFeedback();

                  _onChooseSympton(symptom);
                },
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    playHapticFeedback();
                    _onChooseSympton(symptom);
                  },
                  child: Text(
                    symptom.description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 32.0),
          child: FilledButton(
            onPressed: () {
              playHapticFeedback();

              widget.onChooseSymptoms(checked);
            },
            child: const Text('Næste'),
          ),
        ),
      ],
    );
  }
}
