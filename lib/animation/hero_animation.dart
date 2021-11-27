import 'package:flutter/material.dart';

class HeroAnimation extends StatelessWidget {
  String imageUrl = 'images/nature.png';
  //HeroAnimation({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => NextPageUi(
              nextImageUrl: imageUrl,
            ),
          ));
        },
        child: Card(
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Hero(
                tag: 'rrr',
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text("Nature image"),
          ),
        ),
      ),
    );
  }
}

class NextPageUi extends StatelessWidget {
  String nextImageUrl;
  NextPageUi({Key? key, required this.nextImageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
              color: Colors.amberAccent,
              child: Hero(tag: 'rrr', child: Image.asset(nextImageUrl))),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}
