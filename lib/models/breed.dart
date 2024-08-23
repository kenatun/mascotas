class Breed {
  final String id;
  final String name;
  final String origin;
  final String description;
  final String temperament;
  final int intelligence;
  final int adaptability;
  final String lifeSpan;
  final int catFriendly;
  final int dogFriendly;
  final int grooming;

  Breed({
    required this.id,
    required this.name,
    required this.origin,
    required this.description,
    required this.temperament,
    required this.intelligence,
    required this.adaptability,
    required this.lifeSpan,
    required this.catFriendly,
    required this.dogFriendly,
    required this.grooming,
  });

  factory Breed.fromJson(Map<String, dynamic> json) {
    return Breed(
      id: json['id'],
      name: json['name'],
      origin: json['origin'],
      description: json['description'],
      temperament: json['temperament'],
      intelligence: json['intelligence'],
      adaptability: json['intelligence'],
      lifeSpan: json['life_span'],
      catFriendly: json['cat_friendly'],
      dogFriendly: json['dog_friendly'],
      grooming: json['grooming'],
    );
  }
}
