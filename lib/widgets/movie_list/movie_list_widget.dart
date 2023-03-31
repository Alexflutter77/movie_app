import 'package:flutter/material.dart';
import 'package:flutter_application_3/Movie.dart';
import 'package:flutter_application_3/constants.dart';
import 'package:flutter_application_3/movie_crud.dart';

class MovieListWidget extends StatefulWidget {
  const MovieListWidget({Key? key}) : super(key: key);

  @override
  State<MovieListWidget> createState() => MovieListWidgetState();
}

class MovieListWidgetState extends State<MovieListWidget> {
  List<Movie> list = [];

  @override
  Widget build(BuildContext context) {
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          labelText: 'Поиск',
          filled: true,
          fillColor: Colors.white.withAlpha(235),
          border: OutlineInputBorder(),
        ),
      ),
    );
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () => _onMovieTap(index),
            child: Stack(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border:
                              Border.all(color: Colors.black.withOpacity(0.2)),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Row(
                          children: [
                            // Placeholder(),
                            // Image(image: AssetImage(AppImages.moviePlacholder)),
                            Image.network(
                              image200url + list[index].posterPath,
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 20),
                                  Text(
                                    list[index].id.toString(),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    list[index].title,
                                    style: TextStyle(color: Colors.grey),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    list[index].overview,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 10),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ));
      },
    );
  }

  var _filteredMovies = <Movie>[];

  final _searchController = TextEditingController();

  void _searchMovies() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      var _movies;
      _filteredMovies = _movies.where((Movie movie) {
        return movie.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      List<Movie> _movies;
      _filteredMovies = _filteredMovies;
    }
    setState(() {});
  }

  void onChange() {
    setState(() {});
  }

  void _onMovieTap(int index) {
    final id = list[index].id;
    Navigator.of(context).pushNamed(
      '/main_screen/movie_details',
      arguments: id,
    );
    print(id);
  }

  @override
  void initState() {
    super.initState();
    MovieCrud.getPopular().then((value) {
      list = value;
      print(list);
    });
  }
}
