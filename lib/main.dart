import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1_myapi/data/post_response.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String showDualog = "";

  List<PostResponse>? postLists;

  Future<void> loadPosts() async {
    try {
      print("loading");
      var respons =
          await http.get(Uri.parse("https://freefakeapi.io/api/posts?limit=6"));

      // respons

      if (respons.statusCode == 200) {
        List<dynamic> jsonList = jsonDecode(respons.body);
        postLists =
            jsonList.map((item) => PostResponse.fromJson(item)).toList();
        setState(() {});
        print("postLists = $postLists");
      } else if (respons.statusCode == 404) {
        showDualog = "Not found";
        
        print("$showDualog");
      } else if (respons.statusCode == 401) {
        showDualog = "not found url";
        print("$showDualog");
      } else if (respons.statusCode == 400) {
        showDualog = "error found";
        print("$showDualog");
      } else if (respons.statusCode == 500) {
        showDualog = "not internet";
        print("$showDualog");
      }
      
    } catch (e) {
      if (e is TimeoutException || e is SocketException || e is HttpException) {
        showDualog = "not internet";
        setState(() {
          
        });
        print("Error contect");
      }
      print("Error is : $e");
    }
  }

  @override
  void initState() {
    loadPosts();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (showDualog != null)
              Column(
                mainAxisAlignment:MainAxisAlignment.center,
                children: [
                  Padding(
                    
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      showDualog ?? " ERROR In Network",
                      style:
                          TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            Expanded(
              child: ListView.builder(
                itemCount: postLists?.length ?? 0,
                itemBuilder: (c, index) => Column(
                  children: [
                    Image.network(postLists![index].picture ?? " "),
                    Text(postLists![index].title ?? "no title"),
                    Text(postLists![index].content ?? "no content"),
                    // Text("error is => $showDualog"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
