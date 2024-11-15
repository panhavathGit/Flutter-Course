import 'package:flutter/material.dart';
import '../model/profile_tile_model.dart';

ProfileData vathProfile = ProfileData(
    name: "Panhvath Chan",
    position: "Web Developer",
    avatarUrl: 'assets/W6/boy.png',
    tiles: [
      TileData(
          icon: Icons.phone, title: "Phone Number", value: "+123 456 7890"),
      TileData(
          icon: Icons.location_on, title: "Address", value: "123 Cambodia"),
      TileData(icon: Icons.email, title: "Mail", value: "panhavath@student.cadt.edu.kh"),
      TileData(
          icon: Icons.translate, title: "Language", value: "English - Chinese"),
      TileData(
          icon: Icons.wechat_sharp, title: "Social Media", value: "Instagram PV"),
    ]);
