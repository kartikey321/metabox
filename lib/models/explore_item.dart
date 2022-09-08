// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ExploreItemModel {
  String name;
  String url;
  int price;
  String? description;
  String? packageName;
  int rating;
  int reviewCount;
  ExploreItemModel({
    required this.name,
    required this.url,
    required this.price,
    this.description,
    this.packageName,
    required this.rating,
    required this.reviewCount,
  });

  ExploreItemModel copyWith({
    String? name,
    String? url,
    int? price,
    String? description,
    String? packageName,
    int? rating,
    int? reviewCount,
  }) {
    return ExploreItemModel(
      name: name ?? this.name,
      url: url ?? this.url,
      price: price ?? this.price,
      description: description ?? this.description,
      packageName: packageName ?? this.packageName,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'url': url,
      'price': price,
      'description': description,
      'packageName': packageName,
      'rating': rating,
      'reviewCount': reviewCount,
    };
  }

  String toJson() => json.encode(toMap());

  factory ExploreItemModel.fromJson(String source) =>
      ExploreItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ExploreItemModel(name: $name, url: $url, price: $price, description: $description, packageName: $packageName, rating: $rating, reviewCount: $reviewCount)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ExploreItemModel &&
        other.name == name &&
        other.url == url &&
        other.price == price &&
        other.description == description &&
        other.packageName == packageName &&
        other.rating == rating &&
        other.reviewCount == reviewCount;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        url.hashCode ^
        price.hashCode ^
        description.hashCode ^
        packageName.hashCode ^
        rating.hashCode ^
        reviewCount.hashCode;
  }

  factory ExploreItemModel.fromMap(Map<String, dynamic> map) {
    return ExploreItemModel(
      name: map['name'] as String,
      url: map['url'] as String,
      price: map['price'] as int,
      description:
          map['description'] != null ? map['description'] as String : null,
      packageName:
          map['packageName'] != null ? map['packageName'] as String : null,
      rating: map['rating'] as int,
      reviewCount: map['reviewCount'] as int,
    );
  }
}
