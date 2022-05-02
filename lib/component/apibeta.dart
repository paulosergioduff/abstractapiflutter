import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

void exampleHttpRead(server, endpoint) async {
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

void exampleHttpSend(endpoint, data) async{
    var url = Uri.parse(endpoint);
    var response = await http.post(url, body: data);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

  }


class easyAPI {

  readAPI(server, endpoint){
    var result = exampleHttpRead(server, endpoint);
    return result;
  }

  sendAPI(endpoint, data){
    exampleHttpSend(endpoint, data);
    //print("endPoint: {$endpoint} / data: {$data}");
  }
  
}