import 'package:flutter/material.dart';

import '../../../application/model/now_playing/now_playing.dart';
import '../../../core/constants.dart';
import '../../widgets/main_title.dart';
import 'number_card.dart';

class NumberTitleCard extends StatelessWidget {
  final List<NowPlaying> upcoming;
  const NumberTitleCard({
    super.key,
    required this.upcoming,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(title: 'Top 10 TV shows in India Today'),
        kheight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            // shrinkWrap: true,
            scrollDirection: Axis.horizontal,

            children: List.generate(
                10,
                (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1),
                      child: Numbercard(
                          index: index, image: upcoming[index].imagePath),
                    )),
          ),
        )
      ],
    );
  }
}
