import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flipkartclone/const_value/textstyle.dart';
import 'package:flipkartclone/models/productmodel.dart';
import 'package:flipkartclone/pages/bookingpage.dart';
import 'package:flipkartclone/provider/searchpageprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchProductLists extends StatefulWidget {
  const SearchProductLists({
    super.key,
  });

  @override
  State<SearchProductLists> createState() => _SearchProductListsState();
}

class _SearchProductListsState extends State<SearchProductLists> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SearchPageProvider>(context);
    return StreamBuilder(
      stream: provider.fetchSearchFilterProducts(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          List<ProductModel> products = [];
          for (var doc in snapshot.data!.docs) {
            ProductModel model =
                ProductModel.fromJson(doc.data() as Map<String, dynamic>);
            products.add(model);
          }
          return products.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    int randomNumber = Random().nextInt(2000) + 100;
                    int randomNumberForPercentage = Random().nextInt(70) + 10;
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookingPage(
                                product: products[index],
                              ),
                            ));
                      },
                      child: Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.all(10),
                              // color: Colors.black,
                              width: 300,
                              height: 200,
                              child: Image.network(
                                products[index].itemImageUrl,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                // mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    products[index].itemName.length > 30
                                        ? '${products[index].itemName.substring(0, 30)}...'
                                        : products[index].itemName,
                                    style: dialogBoxBlackColorTextStyle,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 29, 181, 35),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Row(children: [
                                      Text(
                                        products[index].itemRating,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                      const Icon(
                                        Icons.star,
                                        color: Colors.white,
                                        size: 15,
                                      )
                                    ]),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    products[index].itemDesc.length > 50
                                        ? '${products[index].itemDesc.substring(0, 50)}...'
                                        : products[index].itemDesc,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: bannerItemWidgetsTextStyle,
                                  )
                                ]),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "₹${products[index].itemPrice.toString()}",
                                  style: const TextStyle(
                                      fontSize: 25,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '₹ $randomNumber',
                                      style: const TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    Text(
                                      ' $randomNumberForPercentage% off',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green[600],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'Free delivery',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                RichText(
                                    text: TextSpan(
                                        text: "Upto",
                                        style: const TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                        children: [
                                      TextSpan(
                                          text: " ₹$randomNumber",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)),
                                      const TextSpan(text: " Off on Exchange")
                                    ])),
                                const SizedBox(
                                  height: 2,
                                ),
                                const Text(
                                  'Bank Offer',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                )
              : const Text("No data found");
        }
      },
    );
  }
}
