import 'package:uuid/uuid.dart';

class Word {
  static Uuid uuid = const Uuid();

  Word({
    required this.chineseCharacter,
    required this.pinyin,
    required this.category
  }) : id = uuid.v4();

  final String id;
  final String chineseCharacter;
  final String pinyin;
  final String category;
}
