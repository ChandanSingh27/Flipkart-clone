import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flipkartclone/const_value/colors.dart';
import 'package:flipkartclone/models/productmodel.dart';
import 'package:flipkartclone/provider/homepageprovider.dart';
import 'package:flipkartclone/widgets/homepagewidgets.dart';
import 'package:flipkartclone/widgets/homeslider.dart';
import 'package:flipkartclone/widgets/productlist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'footersection.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() {
    pageController = PageController(initialPage: 0);
    Provider.of<HomePageProvider>(context, listen: false)
        .slider(pageController);
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
        ),
      ),
      backgroundColor: const Color(0xffF1F3F6),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Container(
          color: navBarColor,
          child: customAppBar(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          //this widget show items list
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 110,
            color: Colors.white,
            child: customItemsList(context),
          ),

          // // here the slider
          Container(
            color: const Color(0xffF1F3F6),
            width: double.infinity,
            height: 300,
            child: slider(context, pageController),
          ),

          // productLists
          StreamBuilder(
            stream: firestore
                .collection("products")
                .where('itemType', isEqualTo: 'kitchen')
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else {
                List<ProductModel> products = [];

                for (var doc in snapshot.data!.docs) {
                  ProductModel model =
                      ProductModel.fromJson(doc.data() as Map<String, dynamic>);
                  products.add(model);
                }

                return ItemsBannerWithList(
                    models: products,
                    bannerImageUrl:
                        "https://cleangreensimple.com/wp-content/uploads/2019/09/essential-kitchen-tools.jpg",
                    bannerCardDetails: "Home &\n Kitchen\n Essentials");
              }
            },
          ),

          StreamBuilder(
            stream: firestore
                .collection("products")
                .where('itemCategory', isEqualTo: 'Electronics')
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else {
                List<ProductModel> products = [];

                for (var doc in snapshot.data!.docs) {
                  ProductModel model =
                      ProductModel.fromJson(doc.data() as Map<String, dynamic>);
                  products.add(model);
                }

                return ItemsBannerWithList(
                    models: products,
                    bannerImageUrl:
                        "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-card-40-iphone14pro-202209_FMT_WHH?wid=508&hei=472&fmt=p-jpg&qlt=95&.v=1663611329204",
                    bannerCardDetails: "Best of\nElectronics");
              }
            },
          ),
          //footer
          footer(context)
        ]),
      ),
    );
  }
}
