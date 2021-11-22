import 'package:desh_bidesh_app/Screens/country_screen.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';

class AllCountriesScreen extends StatefulWidget {
  const AllCountriesScreen({Key? key}) : super(key: key);

  @override
  State<AllCountriesScreen> createState() => _AllCountriesScreenState();
}

class _AllCountriesScreenState extends State<AllCountriesScreen> {
  bool isSearching = false;
  List countries = [];
  List filteredCountries = [];
  getCountries() async {
    final response = await Dio().get("https://restcountries.com/v3.1/all");
    return response.data;
  }

  @override
  void initState() {
    getCountries().then((data) {
      setState(() {
        countries = filteredCountries = data;
      });
    });

    super.initState();
  }

  void _filteredCountries(value) {
    setState(() {
      filteredCountries = countries
          .where((country) => country['name']['common']
              .toLowerCase()
              .contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: !isSearching
            ? const Text('All Countries')
            : TextField(
                onChanged: (value) {
                  _filteredCountries(value);
                },
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'search countries'),
              ),
        actions: [
          isSearching
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isSearching = false;
                      filteredCountries = countries;
                    });
                  },
                  icon: const Icon(Icons.cancel))
              : IconButton(
                  onPressed: () {
                    setState(() {
                      isSearching = true;
                    });
                  },
                  icon: const Icon(Icons.search),
                ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: filteredCountries.isNotEmpty
            ? ListView.builder(
                itemCount: filteredCountries.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: Card(
                      elevation: 7,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 8),
                        child: Text(
                          filteredCountries[index]['name']['common'],
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              CountryScreen(filteredCountries[index]),
                        ),
                      );
                    },
                  );
                },
              )
            : const Center(child: CircularProgressIndicator()),

        // child: ListView(
        //   children: <Widget>[
        //     GestureDetector(
        //       child: const Card(
        //         elevation: 7,
        //         child: Padding(
        //           padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        //           child: Text(
        //             "Canada",
        //             style: TextStyle(fontSize: 18),
        //           ),
        //         ),
        //       ),
        //       onTap: () {
        //         Navigator.of(context).push(
        //           MaterialPageRoute(
        //             builder: (context) => CountryScreen("Canada"),
        //           ),
        //         );
        //       },
        //     ),
        //     GestureDetector(
        //       child: const Card(
        //         elevation: 7,
        //         child: Padding(
        //           padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        //           child: Text(
        //             "Bangladesh",
        //             style: TextStyle(fontSize: 18),
        //           ),
        //         ),
        //       ),
        //       onTap: () {
        //         Navigator.of(context).push(
        //           MaterialPageRoute(
        //             builder: (context) => CountryScreen("Bangladesh"),
        //           ),
        //         );
        //       },
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
