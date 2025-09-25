// models/store.dart
import 'dart:convert';

class Service {
  final String id;
  final String title;
  final String description;
  final int price;
  final int durationMins;
  final String gender;
  final String category;
  final bool isPopular;

  Service({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.durationMins,
    required this.gender,
    required this.category,
    required this.isPopular,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      durationMins: json['duration_mins'],
      gender: json['gender'],
      category: json['category'],
      isPopular: json['is_popular'],
    );
  }
}

class Store {
  final String id;
  final String name;
  final String address;
  final double distanceKm;
  final double rating;
  final String image;
  final List<String> offers;
  final List<Service> services;

  Store({
    required this.id,
    required this.name,
    required this.address,
    required this.distanceKm,
    required this.rating,
    required this.image,
    required this.offers,
    required this.services,
  });

  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      distanceKm: (json['distance_km'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      image: json['image'],
      offers:
          (json['offers'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      services: (json['services'] as List)
          .map((s) => Service.fromJson(s))
          .toList(),
    );
  }

  static List<Store> parseStores(String jsonStr) {
    final data = json.decode(jsonStr);
    final stores = data['stores'] as List;
    return stores.map((s) => Store.fromJson(s)).toList();
  }
}
