import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:api_app1/models/postmodel.dart';

Future<List<Product>> getpost() async {
  Uri url = Uri.parse("https://dummyjson.com/products");
  var response = await http.get(url);

  if (response.statusCode == 200) {
    // Parse the response and map to List<Product>
    var data = json.decode(response.body);
    Postmodel postmodel = Postmodel.fromJson(data);
    return postmodel.products; // Returning the list of products
  } else {
    throw Exception('Failed to load data');
  }
}
