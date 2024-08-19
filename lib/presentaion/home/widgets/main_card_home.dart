import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../widgets/main_title.dart';
import 'main_card.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({
    super.key,
    required this.titletext,
    required this.movies,
  });

  final String titletext;
  final List movies;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      kheight,
      MainTitle(title: titletext),
      kheight,
      LimitedBox(
        maxHeight: 200,
        child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
                movies.length,
                (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: MainCardHome(
                        image: imageBase + movies[index].imagePath)))),
      ),
    ]);
  }
}
