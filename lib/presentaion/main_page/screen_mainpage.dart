import 'package:flutter/material.dart';
import 'package:netflix_clone/presentaion/main_page/widgets/botton_nav.dart';

import '../downloads/screen_downloads.dart';
import '../fast_laugh/screen_fast_laugh.dart';
import '../home/screen_home.dart';
import '../new_and_hot/screen_new_and_hot.dart';
import '../search/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});
  final _pages = [
    const ScreenHome(),
    const ScreenNewAndHot(),
    const ScreenFastLaugh(),
    const ScreenSearch(),
    ScreenDownloads()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (context, index, child) {
            return _pages[index];
          },
        ),
      ),
      bottomNavigationBar: const BottomNavwidget(),
    );
  }
}
