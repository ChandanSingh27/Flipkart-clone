import 'package:flipkartclone/const_value/colors.dart';
import 'package:flipkartclone/pages/footersection.dart';
import 'package:flipkartclone/responsive.dart';
import 'package:flipkartclone/widgets/filtersbox.dart';
import 'package:flipkartclone/widgets/homepagewidgets.dart';
import 'package:flipkartclone/widgets/searchproductlist.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // late List<ProductModel> products;

  @override
  void initState() {
    super.initState();
    // getProduct();
  }

  // getProduct() async {
  //   QuerySnapshot querySnapshot =
  //       await FirebaseFirestore.instance.collection("products").get();
  //   for (var doc in querySnapshot.docs) {
  //     ProductModel model =
  //         ProductModel.fromJson(doc.data() as Map<String, dynamic>);
  //     products.add(model);
  //     print(doc.data());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF1F3F6),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          color: navBarColor,
          child: customAppBar(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!Responsive.isMoblie(context))
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width * 0.20,
                      color: Colors.white,
                      height: 250,
                      child: const FilterBox(),
                    ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.01,
                  ),
                  const Flexible(
                    child: SearchProductLists(),
                  ),
                ],
              ),
            ),
            footer(context),
          ],
        ),
      ),
      floatingActionButton: Responsive.isMoblie(context)
          ? FloatingActionButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const AlertDialog(
                      content: FilterBox(),
                    );
                  },
                );
              },
              child: const Icon(Icons.filter_list))
          : null,
    );
  }
}
