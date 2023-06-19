import 'package:flutter/material.dart';

class SupportViewModel extends ChangeNotifier {
  SupportViewModel() {
    noOfFAQ = faqLengthAdjustment();
  }
  int? noOfFAQ;
  bool seeMoreFlag = false;

  // FAQ dummy data
  List<String> faq = [
    "How does warranty work on Ecomerc?",
    "How long is my order delivery time?",
    "How to become a tokoto seller?",
    "How does warranty work on app?",
    "Why I don't accept otp on my phone?",
    "How to rate my order products?",
    "How does warranty work on Ecomerc?",
    "How long is my order delivery time?",
    "How to become a tokoto seller?",
    "How does warranty work on app?",
    "Why I don't accept otp on my phone?",
    "How to rate my order products?"
  ];

  seeMoreFAQ() {
    (seeMoreFlag == false) ? noOfFAQ = faq.length : faqLengthAdjustment();
    seeMoreFlag = !seeMoreFlag;
    notifyListeners();
  }

  // Input: NO input as an argument
  // Output: Return the ajusted length when See More button is pressed.
  int faqLengthAdjustment() {
    return (faq.length < 6) ? noOfFAQ = faq.length : noOfFAQ = faq.length ~/ 2;
  }
}
