/* import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;

List dict = [];

Future<List> dictRequest() async {
  try {
    final full_list = await http.get(Uri.parse('http://norvig.com/ngrams/enable1.txt'));
    return List.fromJson(jsonDecode(full_list.body));
  } catch (err) {
    print(err.toString());
  }
}


class VerbalMemory extends StatefulWidget {
  @override
  State<VerbalMemory> createState() => _VerbalMemoryState();
}

class _VerbalMemoryState extends State<VerbalMemory> {
  late Future<>
  @override
  void initState() {
    super.initState();

    dictRequest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

/* Future<Album> fetchAlbum() async {
/*   final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')); */

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
} */ */