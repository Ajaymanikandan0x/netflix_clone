import 'package:flutter/material.dart';

import '../../../application/model/upcoming/upcoming.dart';
import '../../../core/colours/colors.dart';
import '../../../core/constants.dart';
import '../../home/widgets/custom_button_widget.dart';
import '../../widgets/video_widget.dart';

class EveryOnesWatching extends StatelessWidget {
  final Upcoming upcoming;
  const EveryOnesWatching({
    super.key,
    required this.upcoming,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Text(
            upcoming.title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            upcoming.overview,
            style: const TextStyle(color: kgreyColor),
          ),
          const SizedBox(height: 20),
          VideoWidget(
            imagePath: imageBase + upcoming.imagePath,
          ),
          const SizedBox(height: 16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomButtonWidget(
                icon: Icons.share,
                title: 'Share',
                iconsize: 25,
                textsize: 16,
              ),
              SizedBox(width: 12),
              CustomButtonWidget(
                icon: Icons.add,
                title: 'My List',
                iconsize: 25,
                textsize: 16,
              ),
              SizedBox(width: 12),
              CustomButtonWidget(
                icon: Icons.play_arrow,
                title: 'Play',
                iconsize: 25,
                textsize: 16,
              ),
              SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }
}
