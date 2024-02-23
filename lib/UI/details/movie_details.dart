import 'package:flutter/material.dart';
import '../../model/moives.dart';


class InforScreen extends StatelessWidget {
  const InforScreen({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ClipRRect(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.white70, width: 1),
                      image: DecorationImage(
                        opacity: 0.5,
                        image: NetworkImage(
                          'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_ios_new,
                                    color: Colors.yellow[200],
                                  ),
                                ),
                                Expanded(
                                  child: Text(movie.title,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.yellow.shade200,
                                          fontSize: 25)),
                                )
                              ],
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: 10,
                          left: 10,
                          child: ElevatedButton(
                            onPressed: () {
                              // Handle watch trailer button press
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              backgroundColor:
                                  Colors.transparent, // Background color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                  side: const BorderSide(color: Colors.white70, width: 1)
                              ),
                            ),
                            child: const Row(
                              children: [
                                Text('Watch Trailer',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                        fontSize: 20)),
                                SizedBox(
                                  width: 5,
                                ),
                                 Icon(Icons.play_circle_outline_rounded,
                                color: Colors.white,),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: ElevatedButton(
                            onPressed: () {
                              // Handle watch now button press
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              backgroundColor:
                                  Colors.transparent, // Background color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                  side: BorderSide(color: Colors.yellow.shade200, width: 1)
                              ),
                            ),
                            child: Row(
                              children: [
                                Text('Watch Now',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.yellow.shade200,
                                        fontSize: 20)),
                                const SizedBox(
                                  width: 5,
                                ),
                                Icon(Icons.play_circle_outline_rounded,
                                color: Colors.yellow[200],),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(movie.overview),
                const SizedBox(
                  height: 15,
                ),
                Text("year of Release: ${movie.releaseDate}",
                    style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
