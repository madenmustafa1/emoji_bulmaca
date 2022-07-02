class AddEmojiModel {
  final String emojiName;

  AddEmojiModel(this.emojiName);

  Map<String, dynamic> toJson() {
    return {
      'emojiName': emojiName,
    };
  }

  Map<String, dynamic> asMap() => {'emojiName': emojiName};
}
