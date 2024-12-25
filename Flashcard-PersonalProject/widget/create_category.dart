import 'package:flutter/material.dart';
class CreateNewCategory extends StatefulWidget {
  const CreateNewCategory({super.key});

  @override
  State<CreateNewCategory> createState() => _CreateNewCategoryState();
}

class _CreateNewCategoryState extends State<CreateNewCategory> {
  final TextEditingController categoryController = TextEditingController();

  void addNewCategory() {
    String newCategory = categoryController.text.trim();
    if (newCategory.isNotEmpty) {
      Navigator.of(context).pop(newCategory);
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
      appBar: AppBar(
        title: const Text("Categories"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Input field and button to add new category
            Row(
              children: [
                SizedBox(height: 100),
                Expanded(
                  child: TextField(
                    controller: categoryController,
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      labelText: 'Add New Category',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: addNewCategory,
                  child: const Text('Add'),
                ),
              ],
            ),
            SizedBox(height: 100),
            Padding(padding: EdgeInsets.only(left: 60),
            child: Image.asset("assets/FlashCardProject/menu.png"),)
            
          ],
        ),
      ),
    );
  }
}

