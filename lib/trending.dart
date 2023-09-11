// ignore_for_file: unused_import, camel_case_types, prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_interpolation_to_compose_strings, prefer_if_null_operators, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:tmdb_api_movie_app/description.dart';

class trending_Movies extends StatelessWidget {
  final List trending;

  trending_Movies({Key? key, required this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Trending Movies",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.white),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trending.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Description(
                                  name: trending[index]["title"],
                                  description: trending[index]["overview"],
                                  bannerUrl: "https://image.tmdb.org/t/p/w500" +
                                      trending[index]["backdrop_path"],
                                  vote: trending[index]["vote_average"]
                                      .toString(),
                                  launchOn: trending[index]["release_date"],
                                  posterURl: "https://image.tmdb.org/t/p/w500" +
                                      trending[index]["poster_path"],
                                )));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.height * 0.2,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(5),
                          height: MediaQuery.of(context).size.height * 0.35,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://image.tmdb.org/t/p/w500" +
                                          trending[index]["poster_path"]))),
                        ),
                        Container(
                          child: Text(
                            trending[index]["title"] != null
                                ? trending[index]["title"]
                                : "Loading",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
