import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/common/application/router.gr.dart';
import 'package:flutter_starter/common/presentation/widgets/text_typography.dart';

import '../../data/graphql/__generated__/show_card_fragment.data.gql.dart';

class ShowCard extends StatelessWidget {
  static const double width = 125;
  static const double height = 200;
  static const double leftMargin = 6;

  final GShowCard show;

  const ShowCard({super.key, required this.show});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: GestureDetector(
        onTap: () => context.router.push(
          ViewShowRoute(
            id: show.id,
            title: show.title,
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Zoom in the image
            Transform.scale(
              scale: 1.1,
              child: Image.network(
                show.posterUrl!,
                errorBuilder: (context, error, stacktrace) {
                  return Text(
                    "error loading image ${show.posterUrl}: $error",
                  );
                },
                fit: BoxFit.cover,
                height: height,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topRight,
                  colors: [
                    Colors.black.withOpacity(0.4),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 4,
              left: 4,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        color: Colors.yellow[600],
                        size: 20,
                      ),
                      const SizedBox(width: 4),
                      const TextTypography.bodySmall(
                        '9.7',
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
