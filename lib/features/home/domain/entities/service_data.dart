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
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toInt(),
      durationMins: (json['duration_mins'] as num).toInt(),
      gender: json['gender'] as String,
      category: json['category'] as String,
      isPopular: json['is_popular'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'duration_mins': durationMins,
      'gender': gender,
      'category': category,
      'is_popular': isPopular,
    };
  }
}
