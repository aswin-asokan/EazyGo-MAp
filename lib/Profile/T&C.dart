// ignore_for_file: unused_import, camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:eazygo_map/variables.dart';
import 'package:flutter/material.dart';

class termsAndConditions extends StatelessWidget {
  const termsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffd9e9e6),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: double.infinity,
            height: 210,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff1C6758),
                  Color(0xff04AC8B),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            height: double.infinity,
            margin:
                const EdgeInsets.only(top: 80, left: 15, right: 15, bottom: 35),
            decoration: BoxDecoration(
                color: c1,
                borderRadius: BorderRadius.circular(7),
                // ignore: prefer_const_constructors
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 7.0,
                  ),
                ]),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    "images/shield.png",
                    height: 36,
                    width: 36,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Privacy Policy",
                    style: TextStyle(
                      color: Color(0xff00A861),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "At EazyGo, we take the privacy of our users seriously. This privacy policy outlines how we collect, use, and protect the personal information of our users.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff7B7B7B),
                      fontSize: 12,
                      //fontWeight: FontWeight.bold ,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Collection of Personal Information",
                    style: TextStyle(
                      color: Color(0xff00A861),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "When using our app, we may collect the following personal information:",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff7B7B7B),
                      fontSize: 12,
                      //fontWeight: FontWeight.bold ,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Location data: We use location data to provide location-based services, such as providing directions or finding nearby points of interest. This data is collected through the use of GPS, Wi-Fi, and cellular data.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff7B7B7B),
                      fontSize: 12,
                      // fontWeight: FontWeight.bold ,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Camera data: We may use the camera on your device to take photos or videos for use within our app.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff7B7B7B),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "User-provided information: We may collect information that you provide to us, such as your name, email address, and other contact information.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff7B7B7B),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Use of Personal Information",
                    style: TextStyle(
                      color: Color(0xff00A861),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "We use the personal information we collect to provide our users with location-based services, such as providing directions or finding nearby points of interest. We may also use this information to improve our app and to provide personalized content and recommendations.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff7B7B7B),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "We may also use the personal information we collect to contact you with promotional offers or to provide you with information about new features or updates to our app.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff7B7B7B),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Protection of Personal Information",
                    style: TextStyle(
                      color: Color(0xff00A861),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "We take steps to protect the personal information we collect from unauthorized access, use, or disclosure. We use a variety of security measures, including encryption and firewalls, to protect your personal information.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff7B7B7B),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "We also limit access to personal information to our employees and contractors who need it to perform their job duties.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff7B7B7B),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "We will not share your personal information with third parties for their own marketing purposes without your consent.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff7B7B7B),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Your Choices",
                    style: TextStyle(
                      color: Color(0xff00A861),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "You have the right to access and correct your personal information. You can also request that we delete your personal information or stop collecting it.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff7B7B7B),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "You can also choose to opt-out of receiving promotional emails or marketing messages from us by following the instructions in the emails or messages.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff7B7B7B),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Changes to this Privacy Policy",
                    style: TextStyle(
                      color: Color(0xff00A861),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "We may update this privacy policy from time to time. We will notify you of any changes by posting the new privacy policy on our app or website.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff7B7B7B),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
              bottom: 6.0,
              child: Text(
                "2022-2023",
                style: TextStyle(color: Colors.grey, fontSize: 10),
              ))
        ],
      ),
    );
  }
}
