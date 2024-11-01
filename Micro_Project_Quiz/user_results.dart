import 'dart:convert';
import 'dart:io';

class UserResult {
  String firstname;
  String lastname;
  int score;

  UserResult({
    required this.firstname,
    required this.lastname,
    required this.score,
  });

  // Method to convert the UserResult object to a map
  Map<String, dynamic> toJson() {
    return {
      'firstname': firstname,
      'lastname': lastname,
      'score': score,
    };
  }

  // Method to save the UserResult object to a shared JSON file
  void saveToJson() async {
    final file = File('user_results.json');
    List<dynamic> results = [];

    // Check if the file exists and contains valid JSON data
    if (await file.exists()) {
      String existingData = await file.readAsString();
      if (existingData.isNotEmpty) {
        results = jsonDecode(existingData);
      }
    }

    // Add the new result to the list
    results.add(toJson());

    // Write the updated list back to the file
    await file.writeAsString(jsonEncode(results), mode: FileMode.write);
    print('Result has been recorded');
  }
}

