import 'package:flutter/material.dart';

import '../../../application/model/top_rated/top_rated.dart';
import '../../../core/colours/colors.dart';
import '../../../core/constants.dart';
import '../../home/widgets/custom_button_widget.dart';
import '../../widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  final Size size;
  final TopRated topRated;
  const ComingSoonWidget({
    super.key,
    required this.size,
    required this.topRated,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: 50,
            height: 450,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'FEB',
                  style: TextStyle(fontSize: 16, color: kgreyColor),
                ),
                Text(
                  '11',
                  style: TextStyle(
                      fontSize: 30,
                      letterSpacing: 4,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 520,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VideoWidget(
                    imagePath: imageBase + topRated.imagePath,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          topRated.title,
                          style: const TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            letterSpacing: -1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 1,
                        ),
                      ),
                      const Spacer(),
                      const Row(
                        children: [
                          CustomButtonWidget(
                            icon: Icons.notifications_none,
                            title: 'Remind me',
                            iconsize: 20,
                            textsize: 10,
                          ),
                          SizedBox(width: 8),
                          CustomButtonWidget(
                            icon: Icons.info,
                            title: 'Info',
                            iconsize: 20,
                            textsize: 10,
                          ),
                          SizedBox(width: 8),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Coming on ${topRated.releaseDate}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: kgreyColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    topRated.title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    topRated.overview,
                    style: const TextStyle(color: kgreyColor),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
