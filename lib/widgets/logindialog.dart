import 'package:flipkartclone/const_value/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

loginDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.45,
          height: MediaQuery.of(context).size.height * 0.7,
          child: Row(children: [
            Expanded(
                flex: 3,
                child: Container(
                  color: const Color(0xff2874F0),
                  height: double.infinity,
                  padding: const EdgeInsets.only(top: 40, left: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Login",
                          style: dialogBoxTextStyle,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Get access to your\nOrders,Whishlist and\nRecommendations",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xffBEC9DE),
                          ),
                        ),
                        const Spacer(),
                        Align(
                          alignment: Alignment.center,
                          child: Lottie.asset(
                            "assets/images/login.json",
                            
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ]),
                )),
            Expanded(
                flex: 5,
                child: Container(
                  margin: const EdgeInsets.all(40),
                  color: Colors.white,
                  height: double.infinity,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                            width: double.infinity,
                            child: TextField(
                              decoration: InputDecoration(
                                  labelStyle: TextStyle(color: Colors.grey),
                                  labelText: "Enter Email/Mobile number"),
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        RichText(
                          text: const TextSpan(
                            text: 'By continuing, you agree to Flipkart ',
                            style: TextStyle(color: Colors.grey, fontSize: 10),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Terms of Use ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue)),
                              TextSpan(text: 'and'),
                              TextSpan(
                                  text: ' Privacy Policy.',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue)),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          height: 40,
                          color: const Color(0xffFB641B),
                          child: const Text(
                            "Request OTP",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        const Spacer(),
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            "New to Flipkart? Create an account",
                            style: TextStyle(color: Color(0xff2874F0)),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ]),
                ))
          ]),
        ),
      );
    },
  );
}
