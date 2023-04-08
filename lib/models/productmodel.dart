class ProductModel {
  String itemBrand,
      itemCategory,
      itemCompanyName,
      itemDesc,
      itemImageUrl,
      itemName,
      itemType,
      itemRating;
  int itemPrice;
  bool addToCard = false;

  ProductModel({
    required this.itemBrand,
    required this.itemCategory,
    required this.itemCompanyName,
    required this.itemDesc,
    required this.itemImageUrl,
    required this.itemName,
    required this.itemPrice,
    required this.itemRating,
    required this.itemType,
  });

  Map<String, dynamic> toJson() => {
        "itemBrand": itemBrand,
        "itemCategory": itemCategory,
        "itemCompanyName": itemCompanyName,
        "itemDesc": itemDesc,
        "itemImageUrl": itemImageUrl,
        "itemName": itemName,
        "itemPrice": itemPrice,
        "itemType": itemType,
        "itemRating": itemRating
      };

  ProductModel.fromJson(Map<String, dynamic> product)
      : itemBrand = product['itemBrand'] as String,
        itemCategory = product['itemCategory'] as String,
        itemCompanyName = product['itemCompanyName'] as String,
        itemDesc = product['itemDesc'] as String,
        itemImageUrl = product['itemImageUrl'] as String,
        itemName = product['itemName'] as String,
        itemPrice = product['itemPrice'],
        itemType = product['itemType'] as String,
        itemRating = product['itemRating'] as String;
}
