import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/common/application/router.gr.dart';
import 'package:flutter_starter/features/contact_card/data/contact_card_10.dart';
import 'package:flutter_starter/features/contact_card/data/contact_card_23.dart';
import 'package:flutter_starter/features/contact_card/domain/contact_reason_card.dart';

const List<ContactReasonCard> contactCards = [
  ContactReasonCard(
    title: 'Allergisk reaktion',
    number: 1,
    symptomCategories: [],
  ),
  ContactReasonCard(
    title: 'Træthed og bleghed (anæmi)',
    number: 2,
    symptomCategories: [],
  ),
  ContactReasonCard(
    title: 'Bevægeapparatsymptomer',
    number: 3,
    symptomCategories: [],
  ),
  ContactReasonCard(
    title: 'Besvimelse',
    number: 4,
    symptomCategories: [],
  ),
  ContactReasonCard(
    title: 'Bevidsthedspåvirkning',
    number: 5,
    symptomCategories: [],
  ),
  ContactReasonCard(
    title: 'Brystsmerter',
    number: 6,
    symptomCategories: [],
  ),
  ContactReasonCard(
    title: 'Cyanose i sygehistorie',
    number: 7,
    symptomCategories: [],
  ),
  ContactReasonCard(
    title: 'Dehydrering',
    number: 8,
    symptomCategories: [],
  ),
  ContactReasonCard(
    title: 'Diabetes mellitus',
    number: 9,
    symptomCategories: [],
  ),
  contactCard10,
  ContactReasonCard(
    title: 'Feber',
    number: 11,
    symptomCategories: [],
  ),
  ContactReasonCard(
    title: 'Forgiftning',
    number: 12,
    symptomCategories: [],
  ),
  ContactReasonCard(
    title: 'Gastrointestinal blødning',
    number: 13,
    symptomCategories: [],
  ),
  ContactReasonCard(
    title: 'Hovedpine',
    number: 14,
    symptomCategories: [],
  ),
  ContactReasonCard(
    title: 'Hovedtraume',
    number: 15,
    symptomCategories: [],
  ),
  ContactReasonCard(
    title: 'Hudsymptomer (udslæt)',
    number: 16,
    symptomCategories: [],
  ),
  ContactReasonCard(
    title: 'Kramper nu ophørt',
    number: 17,
    symptomCategories: [],
  ),
  ContactReasonCard(
    title: 'Mavesmerter (skrigeture)',
    number: 18,
    symptomCategories: [],
  ),
  ContactReasonCard(
    title: 'Mistanke om overgreb',
    number: 19,
    symptomCategories: [],
  ),
  ContactReasonCard(
    title: 'Spiseproblemer, vægttab',
    number: 20,
    symptomCategories: [],
  ),
  ContactReasonCard(
    title: 'Underlivssmerter',
    number: 21,
    symptomCategories: [],
  ),
  ContactReasonCard(
    title: 'Urinvejssymptomer',
    number: 22,
    symptomCategories: [],
  ),
  vaertraekningsbesvaer,
  ContactReasonCard(
    title: 'Frakturer',
    number: 24,
    symptomCategories: [],
  ),
  ContactReasonCard(
    title: 'Passer ikke til noget',
    number: 25,
    symptomCategories: [],
  ),
];

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kontaktsårsagskort"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 3,
            crossAxisSpacing: 16.0, // Adjust as needed
            children: contactCards.reversed
                .map(
                  (contactReasonCard) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                // 5px rounded borders
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            textStyle: MaterialStateProperty.all(
                              const TextStyle(
                                // fontSize: 16.0,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          onPressed:
                              contactReasonCard.symptomCategories.isNotEmpty
                                  ? () {
                                      AutoRouter.of(context).push(
                                        ContactCardRoute(
                                          contactCard: contactReasonCard,
                                        ),
                                      );
                                    }
                                  : null,
                          child: Text(
                            '${contactReasonCard.number} ${contactReasonCard.title}',
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
