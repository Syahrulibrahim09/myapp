import 'package:flutter/material.dart';
import 'countries_api_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Countries App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CountriesScreen(),
    );
  }
}

class CountriesScreen extends StatefulWidget {
  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  final CountriesApiService apiService = CountriesApiService();
  List<dynamic>? countries;

  Future<void> getCountries() async {
    try {
      final data = await apiService.fetchAllCountries();
      setState(() {
        countries = data;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    getCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Countries'),
      ),
      body: countries == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: countries!.length,
              itemBuilder: (context, index) {
                final country = countries![index];
                return ListTile(
                  title: Text(country['name']['common']),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Region: ${country['region']}'),
                      Text('Population: ${country['population']}'),
                      Text('Capital: ${country['capital'] != null ? country['capital'][0] : 'N/A'}'),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
