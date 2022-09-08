import 'package:flutter/material.dart';
import 'package:metabox/models/explore_item.dart';
import 'package:metabox/screens/dashboard.dart';
import 'package:metabox/screens/profile.dart';

List<ExploreItemModel> fridges = [
  ExploreItemModel(
      packageName: 'com.DefaultCompany.fridge',
      name: 'Fridge',
      url: 'assets/images/apple_watch.png',
      price: 100000,
      rating: 4,
      reviewCount: 3500)
];
List<ExploreItemModel> watches = [
  ExploreItemModel(
      packageName: 'com.DefaultCompany.ArWatch',
      name: 'Apple watches series 5/7',
      url: 'assets/images/apple_watch1.png',
      price: 15000,
      rating: 4,
      reviewCount: 3600),
  ExploreItemModel(
      packageName: 'com.DefaultCompany.ArWatch',
      name: 'Apple watches series 5/7',
      url: 'assets/images/apple_watch1.png',
      price: 15000,
      rating: 4,
      reviewCount: 3600),
  ExploreItemModel(
      packageName: 'com.DefaultCompany.ArWatch',
      name: 'Apple watches series 5/7',
      url: 'assets/images/apple_watch1.png',
      price: 15000,
      rating: 4,
      reviewCount: 3600),
  ExploreItemModel(
      packageName: 'com.DefaultCompany.ArWatch',
      name: 'Apple watches series 5/7',
      url: 'assets/images/apple_watch1.png',
      price: 15000,
      rating: 4,
      reviewCount: 3600),
  ExploreItemModel(
      packageName: 'com.DefaultCompany.ArWatch',
      name: 'Apple watches series 5/7',
      url: 'assets/images/apple_watch1.png',
      price: 15000,
      rating: 4,
      reviewCount: 3600),
  ExploreItemModel(
      packageName: 'com.DefaultCompany.ArWatch',
      name: 'Apple watches series 5/7',
      url: 'assets/images/apple_watch1.png',
      price: 15000,
      rating: 4,
      reviewCount: 3600),
];
List<ExploreItemModel> expItems = [
  ExploreItemModel(
      packageName: 'com.DefaultCompany.ArWatch',
      name: 'Apple watches series 5/7',
      url: 'assets/images/apple_watch1.png',
      price: 15000,
      rating: 4,
      reviewCount: 3600),
  ExploreItemModel(
      packageName: 'com.DefaultCompany.ArWatch',
      name: 'Samsung watch',
      url: 'assets/images/iphone.png',
      price: 15000,
      rating: 4,
      reviewCount: 3600),
  ExploreItemModel(
      packageName: 'com.DefaultCompany.MetaBoxARTV',
      name: 'Apple watches series 5/7',
      url: 'assets/images/tv2.png',
      price: 15000,
      rating: 4,
      reviewCount: 3600),
  ExploreItemModel(
      packageName: 'com.DefaultCompany.fridge',
      name: 'Fridge',
      url: 'assets/images/fridge.png',
      price: 15000,
      rating: 4,
      reviewCount: 3600),
  ExploreItemModel(
      packageName: 'com.DefaultCompany.ArWatch',
      name: 'Apple watches series 5/7',
      url: 'assets/images/apple_watch1.png',
      price: 15000,
      rating: 4,
      reviewCount: 3600),
  ExploreItemModel(
      packageName: 'com.DefaultCompany.ArWatch',
      name: 'Samsung watch',
      url: 'assets/images/apple_watch1.png',
      price: 15000,
      rating: 4,
      reviewCount: 3600),
];

List<ExploreItemModel> jwellery = [
  ExploreItemModel(
      name: 'Earing',
      url: 'assets/images/jwellery.png',
      price: 15000,
      rating: 4,
      reviewCount: 3600),
  ExploreItemModel(
      name: 'Necklace',
      url: 'assets/images/jwellery.png',
      price: 15000,
      rating: 4,
      reviewCount: 3600),
];

List<ExploreItemModel> shoes = [
  ExploreItemModel(
      name: 'Woodland',
      url: 'assets/images/shoes.png',
      price: 10000,
      rating: 4,
      reviewCount: 5000),
  ExploreItemModel(
      name: 'Woodland',
      url: 'assets/images/shoes.png',
      price: 10000,
      rating: 4,
      reviewCount: 5000),
  ExploreItemModel(
      name: 'Woodland',
      url: 'assets/images/shoes.png',
      price: 10000,
      rating: 4,
      reviewCount: 5000),
  ExploreItemModel(
      name: 'Woodland',
      url: 'assets/images/shoes.png',
      price: 10000,
      rating: 4,
      reviewCount: 5000)
];

List<ExploreItemModel> electronics = [
  ExploreItemModel(
      packageName: 'com.DefaultCompany.MetaBoxARTV',
      name: 'SkyNet',
      url: 'assets/images/tv2.png',
      price: 15000,
      rating: 4,
      reviewCount: 2000,
      description: 'Fusion LT'),
  ExploreItemModel(
      name: 'SkyNet',
      url: 'assets/images/laptop.png',
      price: 15000,
      rating: 4,
      reviewCount: 2000,
      description: 'Fusion LT'),
  ExploreItemModel(
      packageName: 'com.DefaultCompany.fridge',
      name: 'SkyNet',
      url: 'assets/images/fridge.png',
      price: 15000,
      rating: 4,
      reviewCount: 2000,
      description: 'Fusion LT'),
  ExploreItemModel(
      packageName: 'com.DefaultCompany.MetaBoxARTV',
      name: 'SkyNet',
      url: 'assets/images/tv2.png',
      price: 15000,
      rating: 4,
      reviewCount: 2000,
      description: 'Fusion LT'),
];

int selectedIndex = 0;
List<Widget> _widgets = [Dashboard(), Profile()];
