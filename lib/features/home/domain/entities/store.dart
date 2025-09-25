import 'package:oasis_salon_app/features/home/domain/entities/service_data.dart';

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
}
