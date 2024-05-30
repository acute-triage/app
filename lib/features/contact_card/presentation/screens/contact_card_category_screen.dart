import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/features/contact_card/domain/contact_reason_card.dart';

@RoutePage()
class ContactCardCategoryScreen extends ConsumerStatefulWidget {
  final ContactReasonCard contactCard;

  const ContactCardCategoryScreen({
    super.key,
    required this.contactCard,
  });

  @override
  ConsumerState<ContactCardCategoryScreen> createState() =>
      _ContactCardCategoryScreenState();
}

class _ContactCardCategoryScreenState
    extends ConsumerState<ContactCardCategoryScreen> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.contactCard.title),
      ),
      body: Center(
          child: widget.contactCard.symptomCategories.isEmpty
              ? const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('No categories (yet)'),
                  ],
                )
              : GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 3,
                  crossAxisSpacing: 16.0, // Adjust as needed
                  children: widget.contactCard.symptomCategories
                      .map(
                        (symptomCategory) => Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(symptomCategory.name),
                            ...symptomCategory.symptoms.map(
                              (symptom) => Text(symptom.description),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                )),
    );
  }
}
