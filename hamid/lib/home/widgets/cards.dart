import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  const Cards({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/homeCards/repas.png',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/homeCards/shop.png',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/homeCards/services.png',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/homeCards/jibLiya.png',
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/homeCards/carrefour.png',
                  height: 400,
                  fit: BoxFit.fill,
                ),
                Image.asset(
                  'assets/images/homeCards/wallet.png',
                  fit: BoxFit.cover,
                  // height: 300,
                  // width: 400,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
