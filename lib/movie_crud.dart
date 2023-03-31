// ignore_for_file: avoid_print

import 'dart:convert';

// ignore: unused_import
import '../widgets/movie_list/movie_list_widget.dart';
import 'package:http/http.dart' as http;

import 'Movie.dart';

class MovieCrud {
  static Future<List<Movie>> getPopular() async {
    List<Movie> list = [];

    try {
      var headers = {'content-type': 'application/json; charset=utf-8'};
      var request = http.Request(
          'GET',
          Uri.parse(
              'https://api.themoviedb.org/3/movie/popular?api_key=b09a906ff6d2f02f397a77006b645f19'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());

        String result = await response.stream.bytesToString();

//         List<MyModel> myModels;
// var response = await http.get("myUrl");

        //   dynamic rs = json.decode(result);

        list = (json.decode(result)['results'] as List)
            .map((i) => Movie.fromJson(i))
            .toList();
        // print(result);
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e);
    }

    return list;
  }
}
