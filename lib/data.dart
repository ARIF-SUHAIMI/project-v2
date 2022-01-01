import 'package:flutter/material.dart';

class NavigationItem {
  IconData iconData;

  NavigationItem(this.iconData);
}

List<NavigationItem> getNavigationItemList() {
  return <NavigationItem>[
    NavigationItem(Icons.home),
    NavigationItem(Icons.calendar_today),
    NavigationItem(Icons.notifications),
    NavigationItem(Icons.person),
  ];
}

class Car {
  String brand;
  String model;
  double price;
  String condition;
  List<String> images;

  Car(this.brand, this.model, this.price, this.condition, this.images);
}

List<Car> getCarList() {
  return <Car>[
    Car(
      "Perodua",
      "Kancil",
      2580,
      "Hourly",
      [
        "assets/images/kancil_front.jpg",
        "assets/images/kancil_back.jpg",
      ],
    ),
    Car(
      "Perodua",
      "Myvi",
      3580,
      "Hourly",
      [
        "assets/images/myvi_front.png",
        "assets/images/myvi_side.png",
      ],
    ),
    Car(
      "Perodua",
      "Kelisa",
      1100,
      "Hourly",
      [
        "assets/images/kelisa_front.jpg",
        "assets/images/kelisa_back.jpg",
      ],
    ),
    Car(
      "Perodua",
      "Bezza",
      2200,
      "Monthly",
      [
        "assets/images/bezza_front.png",
        "assets/images/bezza_side.png",
        "assets/images/bezza_back.png",
      ],
    ),
    Car(
      "Chevrolet",
      "Camaro",
      3400,
      "Weekly",
      [
        "assets/images/camaro_0.png",
        "assets/images/camaro_1.png",
        "assets/images/camaro_2.png",
      ],
    ),
    Car(
      "Ferrari",
      "Spider 488",
      4200,
      "Weekly",
      [
        "assets/images/ferrari_spider_488_0.png",
        "assets/images/ferrari_spider_488_1.png",
        "assets/images/ferrari_spider_488_2.png",
        "assets/images/ferrari_spider_488_3.png",
        "assets/images/ferrari_spider_488_4.png",
      ],
    ),
    Car(
      "Ford",
      "Focus",
      2300,
      "Weekly",
      [
        "assets/images/ford_0.png",
        "assets/images/ford_1.png",
      ],
    ),
    Car(
      "Fiat",
      "500x",
      1450,
      "Weekly",
      [
        "assets/images/fiat_0.png",
        "assets/images/fiat_1.png",
      ],
    ),
    Car(
      "Honda",
      "Civic",
      900,
      "Daily",
      [
        "assets/images/honda_0.png",
      ],
    ),
    Car(
      "Citroen",
      "Picasso",
      1200,
      "Monthly",
      [
        "assets/images/citroen_0.png",
        "assets/images/citroen_1.png",
        "assets/images/citroen_2.png",
      ],
    ),
  ];
}

class Dealer {
  String name;
  int offers;
  String image;

  Dealer(this.name, this.offers, this.image);
}

List<Dealer> getDealerList() {
  return <Dealer>[
    Dealer(
      "Hertz",
      174,
      "assets/images/hertz.png",
    ),
    Dealer(
      "Avis",
      126,
      "assets/images/avis.png",
    ),
    Dealer(
      "Tesla",
      89,
      "assets/images/tesla.jpg",
    ),
  ];
}

class Filter {
  String name;

  Filter(this.name);
}

List<Filter> getFilterList() {
  return <Filter>[
    Filter("Best Match"),
    Filter("High Price"),
    Filter("Low Price"),
  ];
}
