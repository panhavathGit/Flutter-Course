enum WordCategory {
  HSK1('HSK1'),
  HSK2('HSK2'),
  HSK3('HSK3');

  const WordCategory(this.label);
  final String label;
}

class CategoryManager {
  final List<String> userCategories = [];

  // Get all categories (both default and user-added)
  List<String> getAllCategories() {
    // Combine default (enum) categories and user-added categories
    return [
      ...WordCategory.values.map((e) => e.label),
      ...userCategories,
    ];
  }

  // Add a new user category
  void addCategory(String category) {
    if (!userCategories.contains(category)) {
      userCategories.add(category);
    }
  }
}
