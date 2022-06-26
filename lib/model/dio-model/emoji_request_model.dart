class EmojiRequestModel {
  final int index;
  final int categoryId;

  const EmojiRequestModel(
    this.index,
    this.categoryId,
  );

  factory EmojiRequestModel.fromMap(Map map) {
    return EmojiRequestModel(
      map['index'],
      map['categoryId'],
    );
  }

  Map<String, dynamic> asMap() => {
        'index': index,
        'categoryId': categoryId,
      };
}