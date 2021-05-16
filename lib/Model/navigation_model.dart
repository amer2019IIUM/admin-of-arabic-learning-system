import 'package:flutter/material.dart';

class NavigationModel {
  String title;
  IconData icon;

  NavigationModel({this.title, this.icon});
}

List<NavigationModel> navigationItems = [
  NavigationModel(
    title: "PROFILE",
    icon: Icons.person,
  ),
  NavigationModel(title: "Tutors", icon: Icons.school),
  NavigationModel(title: "Chat", icon: Icons.chat),
  NavigationModel(title: "Material", icon: Icons.book),
  NavigationModel(title: "Packages", icon: Icons.wallet_giftcard_sharp),
];
