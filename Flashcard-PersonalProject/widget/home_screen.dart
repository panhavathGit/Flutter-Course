import 'package:flutter/material.dart';
import 'package:my_app/Flashcard-PersonalProject/model/word_category.dart';
import 'package:my_app/Flashcard-PersonalProject/widget/create_category.dart';
import 'package:my_app/Flashcard-PersonalProject/widget/list_tile_of_word.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryManager categoryManager = CategoryManager();

  @override
  Widget build(BuildContext context) {
    // Fetch all categories from CategoryManager
    List<String> categories = categoryManager.getAllCategories();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flash Cards'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Image Section
            Image.asset(
              'assets/FlashCardProject/flash-card.png', // Path to the image
              width: double.infinity,
              height: 350,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 24),
            // Flash Card Category Title
            const Text(
              'Flash Card Categories',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            const SizedBox(height: 16),
            // Flash Card Grid
            Expanded(
              child: categories.isNotEmpty
                  ? GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 1,
                      ),
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ListTileOfWordScreen(
                                    category: category), // Pass data if needed
                              ),
                            );
                          },
                          child: CategoryCard(title: category),
                        );
                      },
                    )
                  : const Center(
                      child: Text(
                        'No Categories Found',
                        style: TextStyle(
                            fontSize: 35,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
            ),
          ],
        ),
      ),
      // Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddCategory,
        backgroundColor: const Color.fromARGB(255, 255, 218, 30),
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }

  // Navigate to add category screen
  Future<void> _navigateToAddCategory() async {
    final newCategory = await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const CreateNewCategory()),
    );

    if (newCategory != null && newCategory != null) {
      setState(() {
        categoryManager.addCategory(newCategory);
      });
    }
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  const CategoryCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red[600],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Color.fromARGB(255, 255, 255, 255), fontSize: 25),
        ),
      ),
    );
  }
}
