import 'dart:math';

import 'package:flipkartclone/const_value/colors.dart';
import 'package:flipkartclone/const_value/textstyle.dart';
import 'package:flipkartclone/models/productmodel.dart';
import 'package:flipkartclone/pages/footersection.dart';
import 'package:flipkartclone/provider/searchpageprovider.dart';
import 'package:flipkartclone/widgets/homepagewidgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class BookingPage extends StatefulWidget {
  ProductModel product;
  BookingPage({super.key, required this.product});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    int randomNumber = Random().nextInt(2000) + 100;
    int randomNumberForPercentage = Random().nextInt(70) + 10;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Container(
          color: navBarColor,
          child: customAppBar(context),
        ),
      ),
      body: Column(children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Image.network(widget.product.itemImageUrl),
                  )),
              Expanded(
                  flex: 3,
                  child: SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.product.itemName,
                              style: dialogBoxBlackColorTextStyle,
                            ),
                            Container(
                              width: 40,
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 29, 181, 35),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Row(children: [
                                Text(
                                  widget.product.itemRating,
                                  style: const TextStyle(color: Colors.white),
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
                              "₹${widget.product.itemPrice.toString()}",
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
                              height: 5,
                            ),
                            Text(
                              widget.product.itemDesc,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 6,
                              textAlign: TextAlign.start,
                              style: bannerItemWidgetsTextStyle,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: widget.product.addToCard
                                      ? null
                                      : () {
                                          if (!widget.product.addToCard) {
                                            widget.product.addToCard = true;
                                            Provider.of<SearchPageProvider>(
                                                    context,
                                                    listen: false)
                                                .addToCard(widget.product);
                                          }
                                        },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 100,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.orange,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Text(
                                      widget.product.addToCard
                                          ? "Done"
                                          : "ADD TO CARD",
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.white),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: 100,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.deepOrange,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: const Text(
                                    "BUY NOW",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ]),
                    ),
                  )),
            ],
          ),
        ),
        footer(context),
      ]),
    );
  }
}
