// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:movies_search_app/screens/movie_screen.dart';
import 'package:movies_search_app/widgets/Custom_app_bar.dart';
import 'package:http/http.dart' as http;

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _controller = TextEditingController();
  late String character;

  Future<dynamic> getCharacter(String character) async {
    String baseUrl = 'https://www.omdbapi.com/?t=$character&apikey=d7617849';

    var url = Uri.parse(baseUrl);

    var response = await http.get(url);

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        var responseBody = jsonDecode(response.body);
        if (responseBody["Response"] == "False") {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Error:- Not found!"),
             
            ),
          );
        } else {
          List<String> genrelist = responseBody["Genre"].split(",");
          List<String> lang = responseBody["Language"].split(",");
          print(responseBody["Poster"].runtimeType);
          print(responseBody);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return MovieScreen(
                  title: responseBody["Title"],
                  plot: responseBody["Plot"],
                  poster: responseBody["Poster"],
                  year: responseBody["Year"],
                  runtime: responseBody["Runtime"],
                  imdb: responseBody["imdbRating"],
                  lang: lang[0],
                  genre: genrelist,
                  director: responseBody["Director"],
                  actors: responseBody["Actors"],
                );
              },
            ),
          );
        }
      } else {
        print("Failed");
        //throw exception and catch it in UI
      }
    }
  }

  void clear() {
    _controller.clear();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const CustomAppBar(
        active: false,
      ),
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color.fromARGB(255, 18, 18, 18),
              Color.fromARGB(255, 18, 18, 18),
              Color.fromARGB(255, 255, 68, 191)
            ])),
        child: Column(
          children: [
            SizedBox(
              height: screenHeight / 4,
            ),
            const Text(
              "Enter a movie/web-series name",
              style: TextStyle(
                color: Colors.white,
                fontSize: 21,
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(screenHeight / 18),
              child: Container(
                height: screenHeight / 17,
                child: TextFormField(
                  style: const TextStyle(
                    fontFamily: "BentonSans",
                  ),
                  controller: _controller,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 255, 68, 191),
                        width: 0.50,
                      ),
                    ),
                    hintStyle: TextStyle(
                      fontFamily: "BentonSans",
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 255, 68, 191),
                        width: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth / 4,
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 68, 191),
                ),
                onPressed: () async {
                  character = _controller.text.trim();
                  clear();
                  FocusManager.instance.primaryFocus?.unfocus();
                  getCharacter(character);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: screenHeight / 200),
                  child: const Center(
                    child: Text(
                      "Search",
                      style: TextStyle(
                          letterSpacing: 2,
                          color: Colors.white,
                          fontFamily: "BentonSans",
                          fontSize: 21,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
