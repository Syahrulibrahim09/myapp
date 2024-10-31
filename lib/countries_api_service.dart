import 'dart:convert';
import 'package:http/http.dart' as http;

class CountriesApiService {
  final String baseUrl = 'https://restcountries.com/v3.1';

  Future<List<dynamic>> fetchAllCountries() async {
    final response = await http.get(Uri.parse('$baseUrl/all'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load countries');
    }
  }
}
