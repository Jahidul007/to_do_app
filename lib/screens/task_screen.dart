import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/model/MovieSearchModel.dart';
import 'package:to_do_app/provider%20/task_data.dart';
import 'package:to_do_app/screens/add_task_screen.dart';
import 'package:to_do_app/widget/tasks_list.dart';

import 'package:http/http.dart' as http;

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          getSearchMovie();
          showModalBottomSheet(
            context: context,
            builder: (context) => AddScreenTask(),
          );
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  child: Icon(
                    Icons.list,
                    size: 30.0,
                    color: Colors.lightBlueAccent,
                  ),
                  backgroundColor: Colors.white,
                  radius: 30.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Todoey',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '${Provider.of<TaskData>(context).taskCount} task',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: TasksList(),
            ),
          ),
        ],
      ),
    );
  }
moviesearch ms;
  getSearchMovie() async {
    var movie_url = await http.get("https://api.themoviedb.org/3/search/movie?api_key=3dc04d323aba0eb54d3cf909fd3d7a37&language=en-US&query=avengers");
    ms = moviesearch.fromJson(json.decode(movie_url.body));


    final par= json.decode(movie_url.body);

    print(par);

    for(int i = 0; i<ms.results.length;i++){
      print(ms.results[i].id);
    }
    /* var movie = Movie(
            id: temp['id'],
            title: temp["original_title"] ?? "This movie is not valid",
            image: "${URL.movie_base_poster_path}${temp["poster_path"]}" ?? "",
            description: temp["overview"] ?? "No overview available",
            rating: (temp['vote_average']) / 2) ??
        0;
    return movie;*/
  }

}
