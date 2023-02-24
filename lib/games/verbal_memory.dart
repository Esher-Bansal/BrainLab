import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:english_words/english_words.dart';

List dict = [];

void dictRequest() {
  generateWordPairs();
}

String test() {
  return dictRequest()
}

class VerbalMemory extends StatefulWidget {
  @override
  State<VerbalMemory> createState() => _VerbalMemoryState();
}

class _VerbalMemoryState extends State<VerbalMemory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          children: const <Widget>[
            Text(
                test(),
                style: TextStyle(
                  color: Colors.blue,
                  letterSpacing: 2.0,
                )
            ),
          ],
        ),
      ),
    );
  }
}
/*   void initState() {
    super.initState();

    dictRequest();
    super.initState();
  } */
//


// void dictRequest() async {
//   try {
//     final httpPackageUrl = Uri.parse('http://norvig.com/ngrams/enable1.txt');
//     final httpPackageInfo = await http.get(httpPackageUrl);
//     final httpPackageJson = json.decode(httpPackageInfo);
//     //as Map<String, dynamic>
//     print(httpPackageJson);
//   } catch (err) {
//     print(err.toString());
//   }
// }

// Future<List> dictRequest() async {
//   try {
//     final full_list = await http.get(Uri.parse('http://norvig.com/ngrams/enable1.txt'));
//     return List.fromJson(jsonDecode(full_list.body));
//   } catch (err) {
//     print(err.toString());
//   }
// }

/* Future<Album> fetchAlbum() async {
   final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
*/