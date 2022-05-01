 import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
 
 class Nada{
    
  }

void ExampleHttpPack(server, endpoint) async {
  // This example uses the Google Books API to search for books about http.
  // https://developers.google.com/books/docs/overview
  var url =
      //Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});
      Uri.https(server, endpoint, {'q': '{http}'});
  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    var itemCount = jsonResponse['totalItems'];
    //print('Number of books about http: $itemCount.');
    var body  = response.body;
    print('Number of books about http: $body.');
  } else {
    print('Request failed with status: ${response.statusCode}');
  }
}


class Heranca extends Nada{
  String server;
  String endpoint;

  Heranca(this.server, this.endpoint){
    ExampleHttpPack(this.server, this.endpoint);
    print("Heranca sendo chamada");
  }
}