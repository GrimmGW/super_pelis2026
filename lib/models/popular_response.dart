import 'dart:convert';

import 'package:super_pelis2026/models/movie.dart';

class PopularResponse {
    int page;
    List<Movie> movie;
    int totalPages;
    int totalResults;

    PopularResponse({
        required this.page,
        required this.movie,
        required this.totalPages,
        required this.totalResults,
    });

    factory PopularResponse.fromJson(String str) => PopularResponse.fromMap(json.decode(str));

    factory PopularResponse.fromMap(Map<String, dynamic> json) => PopularResponse(
        page: json["page"],
        movie: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

}