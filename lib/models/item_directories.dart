// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:metabox/models/explore_item.dart';
import 'package:metabox/screens/dashboard.dart';

class ItemDirectories {
  String name;
  List<ExploreItemModel> itemList;
  ItemDirectories({
    required this.name,
    required this.itemList,
  });

  ItemDirectories copyWith({
    String? name,
    List<ExploreItemModel>? itemList,
  }) {
    return ItemDirectories(
      name: name ?? this.name,
      itemList: itemList ?? this.itemList,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'itemList': itemList.map((x) => x.toMap()).toList(),
    };
  }

  factory ItemDirectories.fromMap(Map<String, dynamic> map) {
    return ItemDirectories(
      name: map['name'] as String,
      itemList: List<ExploreItemModel>.from(
        (map['itemList'] as List<int>).map<ExploreItemModel>(
          (x) => ExploreItemModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemDirectories.fromJson(String source) =>
      ItemDirectories.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ItemDirectories(name: $name, itemList: $itemList)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ItemDirectories &&
        other.name == name &&
        listEquals(other.itemList, itemList);
  }

  @override
  int get hashCode => name.hashCode ^ itemList.hashCode;
}
