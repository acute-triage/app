import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/common/application/router.gr.dart';

import '../../data/graphql/__generated__/show_card_fragment.data.gql.dart';

class ShowCard extends StatelessWidget {
  final GShowCard show;

  const ShowCard({super.key, required this.show});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => context.router.push(
          ViewShowRoute(
            id: show.id,
            title: show.title,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 200,
                width: 200,
                child: Image.network(
                  show.posterUrl!,
                  errorBuilder: (context, error, stacktrace) {
                    return Text(
                      "error loading image ${show.posterUrl}: $error",
                    );
                  },
                ),
              ),
              Text(
                show.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
