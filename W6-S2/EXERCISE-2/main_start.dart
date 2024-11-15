import 'package:flutter/material.dart';
import 'package:my_app/W6-S2/EXERCISE-2/data/profile_data.dart';
import 'package:my_app/W6-S2/EXERCISE-2/model/profile_tile_model.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfileApp(
      profileData: vathProfile,
    ),
  ));
}

const Color mainColor = Color(0xff5E9FCD);

class ProfileApp extends StatelessWidget {
  final ProfileData profileData;
  const ProfileApp({super.key, required this.profileData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor.withAlpha(100),
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text(
          'CADT student Profile',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(profileData.avatarUrl),
            ),
            SizedBox(height: 20),
            Text(
              profileData.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: mainColor,
              ),
            ),
            Text(
              profileData.position,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: ListView.builder(
                  itemCount: profileData.tiles.length,
                  itemBuilder: (context, index) {
                    final tile = profileData.tiles[index];
                    return ProfileTile(
                      icon: tile.icon,
                      title: tile.title,
                      data: tile.value,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
    required this.icon,
    required this.title,
    required this.data,
  });

  final IconData icon;
  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: ListTile(
          leading: Icon(icon, color: mainColor),
          title: Text(title),
          subtitle: Text(data),
        ),
      ),
    );
  }
}
