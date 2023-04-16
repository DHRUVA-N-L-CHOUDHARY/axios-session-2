import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movies_search_app/widgets/Custom_app_bar.dart';

class MovieScreen extends StatelessWidget {
  final String title;
  final String plot;
  final String poster;
  final String year;
  final String runtime;
  final String imdb;
  final String lang;
  final List<String> genre;
  final String director;
  final String actors;
  const MovieScreen(
      {super.key,
      required this.title,
      required this.plot,
      required this.poster,
      required this.year,
      required this.runtime,
      required this.imdb,
      required this.lang,
      required this.genre,
      required this.director,
      required this.actors});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(
        active: true,
      ),
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color.fromARGB(255, 18, 18, 18),
              Color.fromARGB(255, 18, 18, 18),
              Color.fromARGB(255, 18, 18, 18),
              Color.fromARGB(255, 18, 18, 18),
              Color.fromARGB(255, 255, 68, 191)
            ])),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.underline,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth / 10),
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  plot,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: screenHeight / 500,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 255, 152, 220)),
                ),
              ),
            ),
            Row(
              children: [
                Image.network(
                  poster,
                  height: screenHeight / 4,
                  width: 4 * screenWidth / 9,
                ),
                Container(
                  width: screenWidth / 2,
                  height: screenHeight / 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      details("Year", year),
                      details("Runtime", runtime),
                      details("IMDB", imdb),
                      details("Language", lang),
                    ],
                  ),
                )
              ],
            ),
            Container(
              height: screenHeight / 20,
              // child:
              // Flexible(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: genre.length,
                  itemBuilder: ((context, index) {
                    return typecard(genre[index]);
                  })),
              // ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth / 40, vertical: screenHeight / 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 2 * screenWidth / 8,
                    child: Text(
                      "Director",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    width: 5 * screenWidth / 8,
                    child: Text(
                      director,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(255, 152, 220, 1),
                          fontSize: 17,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth / 40, vertical: screenHeight / 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 2 * screenWidth / 8,
                    child: Text(
                      "Actors",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    width: 5 * screenWidth / 8,
                    child: Text(
                      actors,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(255, 152, 220, 1),
                          fontSize: 17,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget typecard(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 109, 206, 1),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            text,
            style: TextStyle(
                letterSpacing: 2.0,
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16),
          ),
        ),
      ),
    );
  }

  Widget details(String field, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          field,
          style: TextStyle(
              color: Colors.white, fontSize: 17, fontWeight: FontWeight.w600),
        ),
        Text(
          value,
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 152, 220, 1),
              fontSize: 17,
              fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
