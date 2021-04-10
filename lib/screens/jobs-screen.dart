

import 'dart:convert';

import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:flutter_sanctum_boilerplate/models/jobs.dart';
import 'package:flutter_sanctum_boilerplate/providers/auth.dart';
//import 'package:flutter_sanctum_boilerplate/providers/auth.dart';

import '../dio.dart';

class JobScreen extends StatefulWidget {
  @override
  _JobScreenState createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {
  var token = Auth().fetchtoken();
  Future<List<Job>> getJobs () async {
    Dio.Response response = await dio().get('http://10.0.2.2:8000/api/jobs',
    options: Dio.Options(
      headers: { 'Authorization': 'Bearer 24|Kw5nev1ExzNYrNlXuuEzeCiX3tSbh2pVdzMeJEgZ' }
    )
    );
  // Future<List<Job>> getJobs() async {
  //   Dio.Response response = await dio().get(
  //     'jobs',
  //     options: Dio.Options(
  //       //headers: { 'Authorization': 'Bearer $token' }
  //       headers: { 'auth': true }
  //     )
  //   );

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