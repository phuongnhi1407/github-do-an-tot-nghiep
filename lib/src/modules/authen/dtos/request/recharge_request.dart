
class RechargeRequest{
  int price;
  int amount;
  int discount;
  int totalPrice;
  String returnUrl;
  String cardList;
  String redirect;
  String lang;
  String baseUrl;

  RechargeRequest({
    required this.price,
    required this.amount,
    required this.discount,
    required this.totalPrice,
    required this.returnUrl,
    required this.cardList,
    required this.redirect,
    required this.lang,
    required this.baseUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'price': price,
      'amount': amount,
      'discount': discount,
      'totalPrice': totalPrice,
      'returnUrl': returnUrl,
      'cardList': cardList,
      'redirect': redirect,
      'lang': lang,
      'baseUrl': baseUrl,
    };
  }
}
