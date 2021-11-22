import 'package:desh_bidesh_app/Screens/country_map.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountryScreen extends StatelessWidget {
  final Map country;
  CountryScreen(
    this.country,
  );

  String getCurrency(Map<String, dynamic> data) {
    //var currency =(country['currencies']!.forEach((k, v) => v?['name']));
    //print(data.runtimeType);
    for (var k in data.keys) {
      return (data[k]['name']);
    }

    return "string";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(country["name"]['common']),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          children: [
            FlipCard(
              front: const CountryCard(title: "Capital"),
              back: CountryFlipCard(
                title: country['capital'][0],
              ),
              direction: FlipDirection.VERTICAL,
            ),
            FlipCard(
              front: const CountryCard(title: "Population"),
              back: CountryFlipCard(title: country['population'].toString()),
              direction: FlipDirection.VERTICAL,
            ),
            FlipCard(
              front: const CountryCard(title: "Flag"),
              back: Card(
                color: Colors.green,
                elevation: 10,
                child: Center(
                  child: SvgPicture.network(
                    country['flags']['svg'],
                    width: 200,
                  ),
                ),
              ),
              direction: FlipDirection.VERTICAL,
            ),
            FlipCard(
              front: const CountryCard(title: "Currency"),
              back: CountryFlipCard(
                title: getCurrency(country['currencies']),
              ),
              direction: FlipDirection.VERTICAL,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CountryMap(
                        countryName: country['name']['common'],
                        latlang: country['latlng']),
                  ));
                },
                child: const CountryCard(title: "Show On Map")),
          ],
        ),
      ),
    );
  }
}

class CountryCard extends StatelessWidget {
  final String title;
  const CountryCard({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.deepOrange,
      elevation: 10,
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class CountryFlipCard extends StatelessWidget {
  final String title;
  const CountryFlipCard({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
