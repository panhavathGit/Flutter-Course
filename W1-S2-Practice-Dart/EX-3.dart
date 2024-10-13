void main() {
  // List of student scores
  List<int> scores = [45, 67, 82, 49, 51, 78, 92, 30];

  // You code
  var result = scores.where((num) => num > 50);
  result.toList();

  var count = result.length;

  print('${result} Number of Pass : ${count}');
 
}