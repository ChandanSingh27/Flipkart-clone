import 'package:flipkartclone/const_value/bannerlists.dart';
import 'package:flutter/material.dart';

import 'buttons.dart';

Widget slider(BuildContext context, PageController controller) {
  return Stack(
    children: [
      PageView.builder(
        controller: controller,
        itemCount: bannerList.length,
        itemBuilder: (context, index) {
          if (controller.hasClients) {
            return Container(
              margin: const EdgeInsets.all(10),
              height: 200,
              width: double.infinity,
              child: Image.asset(
                bannerList[index],
                fit: BoxFit.fill,
              ),
            );
          } else {
            return const Text("error");
          }
        },
      ),
      Positioned(
        top: MediaQuery.of(context).size.height * 0.13,
        left: 10,
        child: InkWell(child: arrowButton(Icons.arrow_back_ios)),
      ),
      Positioned(
        top: MediaQuery.of(context).size.height * 0.13,
        right: 10,
        child: arrowButton(Icons.arrow_forward_ios),
      )
    ],
  );
}
