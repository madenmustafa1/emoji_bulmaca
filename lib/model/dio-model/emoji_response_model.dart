class EmojiResponseModel {
  final String answer;
  final String singer;
  final int index;
  final String contentOwner;
  final int categoryId;
  final String image;
  final int? totalCount;

  const EmojiResponseModel(
    this.totalCount,
    this.answer,
    this.singer,
    this.index,
    this.contentOwner,
    this.categoryId,
    this.image,
  );

  factory EmojiResponseModel.fromMap(Map map) {
    return EmojiResponseModel(
      map['totalCount'],
      map['answer'],
      map['singer'],
      map['index'],
      map['contentOwner'],
      map['categoryId'],
      map['image'],
    );
  }

  Map<String, dynamic> asMap() => {
        'totalCount': totalCount,
        'answer': answer,
        'singer': singer,
        'index': index,
        'contentOwner': contentOwner,
        'categoryId': categoryId,
        'image': image,
      };
}