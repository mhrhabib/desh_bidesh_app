import 'package:desh_bidesh_app/Screens/country_screen.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';

class AllCountriesScreen extends StatefulWidget {
  const AllCountriesScreen({Key? key}) : super(key: key);

  @override
  State<AllCountriesScreen> createState() => _AllCountriesScreenState();
}

class _AllCountriesScreenState extends State<AllCountriesScreen> {
  late Future<List> countries;
  Future<List> getCountries() async {
    final response = await Dio().get("https://restcountries.com/v3.1/all");
    return response.data;
  }

  @override
  void initState() {
    countries = getCountries();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text('All Countries'),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: FutureBuilder<List>(
          future: countries,
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: Card(
                      elevation: 7,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 8),
                        child: Text(
                          snapshot.data?[index]['name']['common'],
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CountryScreen(
                              snapshot.data?[index]['name']['common']),
                        ),
                      );
                    },
                  );
                },
              );
            }
            return const CircularProgressIndicator();
          },
        ),
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
