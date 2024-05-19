class RechargeRequest {
  int? price;
  int? amount;
  int? discount;
  int? totalPrice;
  String? returnUrl;
  String? cardList;
  String? redirect;
  String? lang;
  String? baseUrl;

  RechargeRequest({
    this.price,
    this.amount,
    this.discount,
    this.totalPrice,
    this.returnUrl,
    this.cardList,
    this.redirect,
    this.lang,
    this.baseUrl,
  });

  RechargeRequest.fromJson(Map<String, dynamic> json) {
    price = json['price'] ?? 10000;
    amount = json['amount'];
    discount = json['discount'];
    totalPrice = json['totalPrice'];
    returnUrl = json['returnUrl'];
    cardList = json['cardList'];
    redirect = json['redirect'];
    lang = json['lang'];
    baseUrl = json['baseUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price ?? 0;
    data['amount'] = this.amount ?? 0;
    data['discount'] = this.discount ?? 0;
    data['totalPrice'] = this.totalPrice?? 0;
    data['returnUrl'] = this.returnUrl ;
    // xi may ban chinh xong xoa ?? string ơ may doan ni di hi
    data['cardList'] = this.cardList;
    data['redirect'] = this.redirect ;
    data['lang'] = 'vi_VN';
    data['baseUrl'] = this.baseUrl ;
    return data;
  }
}
