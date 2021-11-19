class Country {
  late String name;
  Country(this.name);

  Country.fromjson(parsedJson) {
    name = parsedJson['name'];
  }
}
