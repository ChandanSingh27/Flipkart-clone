import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flipkartclone/models/productmodel.dart';
import 'package:flutter/material.dart';

class SearchPageProvider with ChangeNotifier {
  List<ProductModel> productsCard = [];
  TextEditingController searchController = TextEditingController();
  // Checkbox values
  bool categoriesElectronics = false;
  bool categoriesHomeKitchen = false;

  bool price5to50 = false;
  bool price50to500 = false;
  bool price50to5000 = false;

  bool typePhone = false;
  bool typeKitchen = false;
  bool typeLaptop = false;

  addToCard(ProductModel model) {
    productsCard.add(model);
    notifyListeners();
  }

  removeFromCard(ProductModel model) {
    productsCard.remove(model);
    notifyListeners();
  }

  changeCheckBoxValues(bool value, String type) {
    if (type == "categoriesElectronics") {
      categoriesElectronics = value;
    } else if (type == "categoriesHomeKitchen") {
      categoriesHomeKitchen = value;
    } else if (type == "price5to50") {
      price5to50 = value;
    } else if (type == "price50to500") {
      price50to500 = value;
    } else if (type == "price50to5000") {
      price50to5000 = value;
    } else if (type == "typePhone") {
      typePhone = value;
    } else if (type == "typeKitchen") {
      typeKitchen = value;
    } else if (type == "typeLaptop") {
      typeLaptop = value;
    }
    // fetchSearchFilterProducts();
    notifyListeners();
  }

  Stream<QuerySnapshot> fetchSearchFilterProducts() {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    Query query = firestore.collection("products");

    if (searchController.text.trim().toString().isNotEmpty && typeKitchen) {
      return query.where('itemType', isEqualTo: 'kitchen').snapshots();
    }

    if (searchController.text.trim().toString().isNotEmpty && typeLaptop) {
      return query.where('itemType', isEqualTo: 'laptop').snapshots();
    }

    if (searchController.text.trim().toString().isNotEmpty && typePhone) {
      return query.where('itemType', isEqualTo: 'phone').snapshots();
    }

    if (searchController.text.trim().toString().isNotEmpty &&
        categoriesElectronics) {
      return query.where('itemCategory', isEqualTo: 'Electronics').snapshots();
    }

    if (searchController.text.trim().toString().isNotEmpty &&
        categoriesHomeKitchen) {
      return query.where('itemCategory', isEqualTo: 'home&kitchen').snapshots();
    }

    if (searchController.text.trim().toString().isNotEmpty) {
      if (searchController.text.trim().toLowerCase() == "all") {
        return query.snapshots();
      } else {
        return query
            .where('itemBrand', isEqualTo: searchController.text.trim())
            .snapshots();
      }
    }

    return query.snapshots();
  }
}
