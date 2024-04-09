import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/common/application/router.gr.dart';
import 'package:flutter_starter/common/presentation/widgets/text_typography.dart';

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
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
                  fit: BoxFit.fitHeight,
                ),
              ),
              const SizedBox(height: 8),
              Column(
                children: [
                  TextTypography.bodyLarge(
                    show.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    center: true,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        color: Colors.yellow[600],
                        size: 20,
                      ),
                      const TextTypography.bodySmall(
                        '9.7',
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
