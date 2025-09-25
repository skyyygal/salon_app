import 'package:oasis_salon_app/features/home/domain/entities/store.dart';

import 'service_model.dart';

class StoreModel {
  final String id;
  final String name;
  final String address;
  final double distanceKm;
  final double rating;
  final String image;
  final List<String> offers;
  final List<ServiceModel> services;

  StoreModel({
    required this.id,
    required this.name,
    required this.address,
    required this.distanceKm,
    required this.rating,
    required this.image,
    required this.offers,
    required this.services,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) {
    return StoreModel(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      distanceKm: (json['distance_km'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      image: json['image'] as String,
      offers: List<String>.from(json['offers'] as List),
      services: (json['services'] as List)
          .map((s) => ServiceModel.fromJson(s as Map<String, dynamic>))
          .toList(),
    );
  }

  Store toEntity() {
    return Store(
      id: id,
      name: name,
      address: address,
      distanceKm: distanceKm,
      rating: rating,
      image: image,
      offers: offers,
      services: services.map((s) => s.toEntity()).toList(),
    );
  }
}
