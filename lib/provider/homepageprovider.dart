import 'dart:async';

import 'package:flutter/cupertino.dart';

class HomePageProvider with ChangeNotifier {
  //onhover the image scale change
  bool scaleImage = false;
  //automatic slider move code implement here
  int sliderIndex = 0;

  slider(PageController controller) {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      if (sliderIndex == 2) {
        sliderIndex = 0;
        controller.animateToPage(sliderIndex,
            duration: const Duration(seconds: 2), curve: Curves.linear);
        notifyListeners();
      } else {
        sliderIndex++;
        controller.animateToPage(sliderIndex,
            duration: const Duration(seconds: 2), curve: Curves.linear);
        notifyListeners();
      }
    });
  }

  //change image scale on hover
  changeScale(bool value) {
    if (value) {
      scaleImage = true;
      notifyListeners();
    } else {
      scaleImage = false;
      notifyListeners();
    }
  }
}
