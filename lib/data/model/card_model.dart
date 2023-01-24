class CardModel {
  int id;
  String cardType;
  String cardNumber;
  String bankName;
  num moneyAmount;
  String cardCurrency;
  String expireDate;
  String iconImage;
  // Colors colors;

  CardModel(
      {required this.id,
        required this.cardType,
        required this.cardNumber,
        required this.bankName,
        required this.moneyAmount,
        required this.cardCurrency,
        required this.expireDate,
        required this.iconImage,
        // required this.colors,
      });

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      id: json['id'] as int? ?? 0,
      cardType: json['card_type'] as String? ?? "",
      cardNumber: json['card_number'] as String? ?? '',
      bankName: json['bank_name'] as String? ?? '',
      moneyAmount: json['money_amount'] as num? ?? 0,
      cardCurrency: json['card_currency'] as String? ?? '',
      expireDate: json['expire_date'] as String? ?? '',
      iconImage: json['icon_image'] as String? ?? '',
      // colors: Colors.fromJson(
      //   json['colors'],

    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['card_type'] = cardType;
    data['card_number'] = cardNumber;
    data['bank_name'] = bankName;
    data['money_amount'] = moneyAmount;
    data['card_currency'] = cardCurrency;
    data['expire_date'] = expireDate;
    data['icon_image'] = iconImage;
    // data['colors'] = colors.toJson();

    return data;
  }
}