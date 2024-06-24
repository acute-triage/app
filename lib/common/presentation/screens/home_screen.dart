import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/common/application/router.gr.dart';
import 'package:flutter_starter/common/presentation/widgets/ui/text_typography.dart';
import 'package:flutter_starter/common/util/haptic_feedback.dart';
import 'package:flutter_starter/features/confirm_dialog/util/show_confirm_dialog.dart';
import 'package:flutter_starter/features/contact_card/data/contact_card_list.dart';
import 'package:flutter_starter/features/contact_card/domain/contact_reason_card.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  final inputFocusNode = FocusNode();
  List<ContactReasonCard> filteredContactCards = contactCards;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int sortContactCard(a, b, searchTerm) {
    String lowerSearchTerm = searchTerm.toLowerCase();
    String aTitle = a.title.toLowerCase();
    String bTitle = b.title.toLowerCase();

    if (aTitle.startsWith(lowerSearchTerm) &&
        !bTitle.startsWith(lowerSearchTerm)) {
      return -1;
    } else if (!aTitle.startsWith(lowerSearchTerm) &&
        bTitle.startsWith(lowerSearchTerm)) {
      return 1;
    } else if (a.number.toString().contains(searchTerm) &&
        !b.number.toString().contains(searchTerm)) {
      return -1;
    } else if (!a.number.toString().contains(searchTerm) &&
        b.number.toString().contains(searchTerm)) {
      return 1;
    } else if (aTitle.contains(lowerSearchTerm) &&
        !bTitle.contains(lowerSearchTerm)) {
      return -1;
    } else if (!aTitle.contains(lowerSearchTerm) &&
        bTitle.contains(lowerSearchTerm)) {
      return 1;
    } else {
      return 0;
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (kIsWeb) {
        await showConfirmDialog(
          context,
          title: 'Begrænset funktionalitet',
          content:
              'Vær opmærksom på at appen er optimeret til mobil og tablet. Webudgaven er som konsekvens heraf langsommere og kan have visse begrænsninger. For den bedste oplevelse anbefales det at teste appen på en mobil eller tablet.',
          hideCancel: true,
        );
      }

      /// focus search field and show keyboard on screen load
      inputFocusNode.requestFocus();
    });

    /// Filter list of contact cards based on search term
    _controller.addListener(() {
      final searchTerm = _controller.text.toLowerCase();
      List<ContactReasonCard> results = contactCards

          /// Filter based on search term
          .where(
            (contactCard) =>
                contactCard.title.toLowerCase().contains(
                      searchTerm,
                    ) ||
                contactCard.number.toString().contains(searchTerm) ||
                contactCard.searchTerms.any(
                  (term) => term.contains(
                    searchTerm,
                  ),
                ),
          )
          .toList()

        /// Sort based on relevance
        ..sort(
          (a, b) => sortContactCard(a, b, searchTerm),
        );

      setState(() {
        filteredContactCards = results;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kontaktsårsagskort"),
      ),
      body: Center(
        child: Column(
          children: [
            // search field with clear input button
            TextField(
              controller: _controller,
              focusNode: inputFocusNode,
              onSubmitted: (value) {
                playHapticFeedback();

                // select top result
                if (filteredContactCards.isNotEmpty && value.isNotEmpty) {
                  AutoRouter.of(context).push(
                    ContactCardRoute(
                      id: filteredContactCards.first.number,
                    ),
                  );
                }
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: 'Søg efter navn, nummer eller symptomer',
                fillColor: Theme.of(context).colorScheme.surface,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
                filled: true,
                hintStyle: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(
                        0.5,
                      ),
                ),
                suffixIcon: _controller.text.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            playHapticFeedback();

                            _controller.clear();
                          },
                        ),
                      )
                    : null,
              ),
            ),
            filteredContactCards.isEmpty
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32.0),
                    child: Column(
                      children: [
                        const TextTypography.body(
                          'Ingen resultater fundet for søgning',
                        ),
                        const SizedBox(height: 8.0),
                        const TextTypography.body(
                          'Prøv at søge efter et andet ord, nummer eller symptom',
                          center: true,
                        ),
                        const SizedBox(height: 16.0),
                        // clear results
                        FilledButton(
                          onPressed: () {
                            playHapticFeedback();

                            _controller.clear();
                          },
                          child: const Text(
                            'Nulstil søgning',
                          ),
                        ),
                      ],
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: filteredContactCards.length,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(top: index == 0 ? 8.0 : 0),
                        child: ListTile(
                          // every second is light grey
                          tileColor: index.isEven
                              ? Theme.of(context).colorScheme.surface
                              : Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.15),
                          // arrow right icon
                          trailing: Icon(
                            Icons.chevron_right,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                          title: Row(
                            children: [
                              SizedBox(
                                width: 30,
                                child: Text(
                                  filteredContactCards[index].number.toString(),
                                  // bold
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  filteredContactCards[index].title,
                                ),
                              ),
                            ],
                          ),
                          onTap: filteredContactCards[index]
                                  .symptomCategories
                                  .isNotEmpty
                              ? () {
                                  playHapticFeedback();

                                  AutoRouter.of(context).push(
                                    ContactCardRoute(
                                      id: filteredContactCards[index].number,
                                    ),
                                  );
                                }
                              : null,
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
