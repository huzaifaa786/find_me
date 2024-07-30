class EmojiModel {
  int? id;
  String image;
  String? type;
  int? coins;

  EmojiModel({
    this.id,
    required this.image,
    this.type,
    this.coins,
  });

  factory EmojiModel.fromJson(Map<String, dynamic> json) {
    return EmojiModel(
      id: json['id'],
      image: json['image'],
      type: json['type'],
      coins: json['coins'],
    );
  }
}
