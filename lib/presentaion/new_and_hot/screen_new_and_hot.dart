import 'package:flutter/material.dart';
import 'package:netflix_clone/presentaion/new_and_hot/widgets/coming_soon_widget.dart';
import 'package:netflix_clone/presentaion/new_and_hot/widgets/everyones_watching_widget.dart';

import '../../application/controller/top_rated/top_rated.dart';
import '../../application/controller/upcoming/upcoming.dart';
import '../../application/model/top_rated/top_rated.dart';
import '../../application/model/upcoming/upcoming.dart';
import '../../core/colours/colors.dart';
import '../../core/constants.dart';

class ScreenNewAndHot extends StatefulWidget {
  const ScreenNewAndHot({super.key});

  @override
  State<ScreenNewAndHot> createState() => _ScreenNewAndHotState();
}

class _ScreenNewAndHotState extends State<ScreenNewAndHot> {
  List<TopRated> comingMovies = [];
  List<Upcoming> everyOne = [];

  late Future<void> _moviesFuture;

  @override
  void initState() {
    _moviesFuture = getAllMovies();
    super.initState();
  }

  Future<void> getAllMovies() async {
    comingMovies = await getTopRatedMovies();
    everyOne = await getAllUpcoming();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black, // Dark background for a sleek look
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text(
              'New & Hot',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: kwhiteColor,
              ),
            ),
            actions: [
              const Icon(
                Icons.cast,
                color: Colors.white,
                size: 30,
              ),
              kwidth,
              Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
              ),
              kwidth,
            ],
            bottom: TabBar(
              isScrollable: true,
              labelColor: kblackColor,
              labelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              // unselectedLabelColor: kwhiteColor,
              indicator: BoxDecoration(
                color: kwhiteColor,
                borderRadius: kradius30,
              ),
              tabs: const [
                Tab(
                  text: '🍿 Coming Soon',
                ),
                Tab(
                  text: '👀 Everyone\'s Watching',
                ),
              ],
            ),
          ),
        ),
        body: FutureBuilder(
          future: _moviesFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.redAccent,
                ), // Customized loading indicator
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text(
                  'Error loading movies',
                  style: TextStyle(color: Colors.redAccent),
                ), // Error message with styling
              );
            } else {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: TabBarView(
                  children: [
                    ComingSoon(
                      comingMovies: comingMovies,
                    ),
                    EveryonesWatching(everyone: everyOne),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ComingSoon extends StatelessWidget {
  ComingSoon({super.key, required this.comingMovies});
  List<TopRated> comingMovies = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      padding:
          const EdgeInsets.only(top: 8.0), // Added padding for better spacing
      itemCount: comingMovies.length,
      itemBuilder: (context, index) {
        return ComingSoonWidget(
          size: size,
          topRated: comingMovies[index],
        );
      },
    );
  }
}

class EveryonesWatching extends StatelessWidget {
  const EveryonesWatching({super.key, required this.everyone});
  final List<Upcoming> everyone;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding:
          const EdgeInsets.only(top: 8.0), // Added padding for better spacing
      itemCount: everyone.length,
      itemBuilder: (BuildContext context, index) {
        return EveryOnesWatching(upcoming: everyone[index]);
      },
    );
  }
}
