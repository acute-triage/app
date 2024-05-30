import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/common/application/router.gr.dart';
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
  List<ContactReasonCard> filteredContactCards = contactCards;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      setState(() {
        filteredContactCards = contactCards
            .where(
              (contactCard) =>
                  contactCard.title.toLowerCase().contains(
                        _controller.text.toLowerCase(),
                      ) ||
                  contactCard.number.toString().contains(_controller.text) ||
                  contactCard.searchTerms.any(
                    (searchTerm) => searchTerm.contains(
                      _controller.text.toLowerCase(),
                    ),
                  ),
            )
            .toList();
      });
    });
  }

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
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              // search field with clear input button
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Søg',
                  hintStyle: TextStyle(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.5),
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _controller.clear();
                    },
                  ),
                ),
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 1,
                  childAspectRatio: 7,
                  crossAxisSpacing: 16.0, // Adjust as needed
                  children: filteredContactCards
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
                                onPressed: contactReasonCard
                                        .symptomCategories.isNotEmpty
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
            ],
          ),
        ),
      ),
    );
  }
}
