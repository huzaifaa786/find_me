class CoinPackageModel {
  int id;
  int? price;
  int? coins;

  CoinPackageModel({
    required this.id,
    this.price,
    this.coins,
  });

  factory CoinPackageModel.fromJson(Map<String, dynamic> json) {
    return CoinPackageModel(
      id: json['id'],
      price: json['price'],
      coins: json['coins'],
    );
  }
}
