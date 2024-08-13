import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Offers',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Inter',
            color: Color(0xFF344054),
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
            children: [
              BackgroundImageWidget(),
              Card2(),
            ],
          ),
        ),
      ),
    );
  }
}

class BackgroundImageWidget extends StatelessWidget {
  const BackgroundImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        height: 250.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          image: const DecorationImage(
            image: AssetImage('assets/images/Offer_card1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 120,
              height: 50,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                border: Border.all(width: 2.0, color: Colors.white),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: SvgPicture.asset(
                      'assets/images/tag_Icon.svg',
                      height: 24.0,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    '50% off',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Inter',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0, bottom: 10),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Enjoy your Cleaning ',
                    style: TextStyle(
                        fontSize: 25.0,
                        fontFamily: 'Inter',
                        color: Colors.white),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    'Essentials',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Inter',
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            Container(
              width: 150,
              height: 50,
              padding: const EdgeInsets.all(9),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: Colors.white,
              ),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      color: Color(0xFF7F56D9),
                      size: 30,
                    ),
                  ),
                  Text(
                    'Visit now',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Inter',
                      color: Color(0xFF7F56D9),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Card2 extends StatelessWidget {
  const Card2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        height: 250.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          image: const DecorationImage(
            image: AssetImage('assets/images/Offer_card2.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 150,
              height: 50,
              padding: const EdgeInsets.all(8),
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(4.0),
              //   border: Border.all(width: 2.0, color: Colors.white),
              // ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: SvgPicture.asset(
                      'assets/images/tag_Icon.svg',
                      height: 24.0,
                      color: Colors.red,
                    ),
                  ),
                  const Text(
                    'flat 60% off',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Inter',
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0, bottom: 10),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Buy the Groceries',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontFamily: 'Inter',
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    'you need',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Inter',
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            Container(
              width: 150,
              height: 50,
              padding: const EdgeInsets.all(9),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: const Color(0xFF7F56D9),
              ),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      color: Color(0xFFFFFFFF),
                      size: 30,
                    ),
                  ),
                  Text(
                    'Visit now',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Inter',
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
