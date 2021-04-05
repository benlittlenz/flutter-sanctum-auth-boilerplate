

import 'dart:convert';

import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:flutter_sanctum_boilerplate/models/jobs.dart';

import '../dio.dart';

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {

  Future<List<Job>> getJobs() async {
    Dio.Response response = await dio().get('jobs');

    List jobs = json.decode(response.toString());

    return jobs.map((job) => Job.fromJson(job)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jobs'),
      ),
      body: Center(
        child: FutureBuilder<List<Job>>(
          future: getJobs(),
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  var item = snapshot.data[index];

                  return ListTile(
                    title: Text(item.ref),
                  );
                }
              );
            } else if(snapshot.hasError) {
              return Text('Failed to load jobs');
            }

            return CircularProgressIndicator();
          },
        )
      ),
    );
  }
}