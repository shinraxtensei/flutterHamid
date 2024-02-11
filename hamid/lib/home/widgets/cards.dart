import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

class Card {
  const Card({
    required this.name,
    required this.image,
    required this.backgroundColor,
    required this.crossAxisCellCount,
    required this.mainAxisCellCount,
    this.icon,
  });

  final String name;
  final String image;
  final String backgroundColor;
  final Icon? icon;
  final int crossAxisCellCount;
  final double mainAxisCellCount;
}

var cards = const [
  Card(
    name: 'Repas',
    image: 'assets/images/homeCards/repas.svg',
    backgroundColor: "#FFA361",
    crossAxisCellCount: 1,
    mainAxisCellCount: 0.9,
  ),
  Card(
    name: 'Carrefour',
    image: 'assets/images/homeCards/carrefour.svg',
    backgroundColor: "#FFFFFF",
    crossAxisCellCount: 1,
    mainAxisCellCount: 1.2,
  ),
  Card(
    name: 'Shop',
    image: 'assets/images/homeCards/shop.svg',
    backgroundColor: "#4BABF1",
    crossAxisCellCount: 1,
    mainAxisCellCount: 0.9,
  ),
  Card(
    name: 'Wallet',
    image: 'assets/images/homeCards/wallet.svg',
    backgroundColor: "#ffffff",
    crossAxisCellCount: 1,
    mainAxisCellCount: 0.9,
  ),
  Card(
    name: 'Services',
    image: 'assets/images/homeCards/services.svg',
    backgroundColor: "#20B37C",
    crossAxisCellCount: 1,
    mainAxisCellCount: 0.9,
  ),
  Card(
    name: 'HamidGroup',
    image: 'assets/images/homeCards/jibLiya.svg',
    backgroundColor: "#FFBA15",
    crossAxisCellCount: 1,
    mainAxisCellCount: 1.5,
  ),
  Card(
    name: 'Jib Liya',
    image: 'assets/images/homeCards/jibLiya.svg',
    backgroundColor: "#FFBA15",
    crossAxisCellCount: 1,
    mainAxisCellCount: 0.9,
  ),
];

class Cards extends StatefulWidget {
  const Cards({super.key});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  bool shake = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: StaggeredGrid.count(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        children: [
          for (int index = 0; index < cards.length; index++)
            StaggeredGridTile.count(
              crossAxisCellCount: cards[index].crossAxisCellCount,
              mainAxisCellCount: cards[index].mainAxisCellCount,
              child: GestureDetector(
                onLongPress: () {
                  setState(() {
                    shake = true;
                  });
                  debugPrint('long press');
                },
                onLongPressEnd: (details) {
                  setState(() {
                    shake = false;
                  });
                  debugPrint('long press end');
                },
                child: ShakeWidget(
                  shakeConstant: ShakeVerticalConstant1(),
                  duration: Duration(milliseconds: 15000 + (index * 1000)),
                  autoPlay: shake,
                  enableWebMouseHover: true,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: InkWell(
                        onTap: () {
                          debugPrint('card tapped');
                        },
                        child: cardBuilder(cards[index])),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

Widget cardBuilder(Card card) {
  switch (card.name) {
    case 'Wallet':
      return Container(
        decoration: BoxDecoration(
          color: HexColor(card.backgroundColor),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Transform.scale(
            scale: 2,
            child: FittedBox(
              fit: BoxFit.cover,
              child: SvgPicture.asset(
                card.image,
                width: 100,
                height: 100,
                semanticsLabel: card.name,
              ),
            ),
          ),
        ),
      );
    case 'HamidGroup':
      return const OraTools();

    default:
      return Container(
        decoration: BoxDecoration(
          color: HexColor(card.backgroundColor),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              card.image,
              width: 100,
              height: 100,
              semanticsLabel: card.name,
            ),
            Text(
              card.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      );
  }
}

class OraTools extends StatefulWidget {
  const OraTools({super.key});

  @override
  State<OraTools> createState() => _OraToolsState();
}

class _OraToolsState extends State<OraTools> {
  var shake = false;

  var oraTools = const [
    Card(
      name: 'store',
      image: 'assets/images/homeCards/store.svg',
      backgroundColor: "#FFFFFF",
      icon: Icon(
        Icons.store,
        color: Colors.black,
      ),
      crossAxisCellCount: 0,
      mainAxisCellCount: 0,
    ),
    Card(
      name: 'cart',
      image: 'assets/images/homeCards/cart.svg',
      icon: Icon(
        Icons.shopping_cart,
        color: Colors.black,
      ),
      backgroundColor: "#FFFFFF",
      crossAxisCellCount: 0,
      mainAxisCellCount: 0,
    ),
    Card(
      name: 'heart',
      image: 'assets/images/homeCards/heart.svg',
      backgroundColor: "#FFFFFF",
      icon: Icon(
        Icons.favorite,
        color: Colors.black,
      ),
      crossAxisCellCount: 0,
      mainAxisCellCount: 0,
    ),
    Card(
      name: 'chat',
      image: 'assets/images/homeCards/chat.svg',
      backgroundColor: "#FFFFFF",
      icon: Icon(
        Icons.chat,
        color: Colors.black,
      ),
      crossAxisCellCount: 0,
      mainAxisCellCount: 0,
    ),
    Card(
      name: 'communities',
      image: 'assets/images/homeCards/communities.svg',
      backgroundColor: "#FFFFFF",
      icon: Icon(
        Icons.people,
        color: Colors.black,
      ),
      crossAxisCellCount: 0,
      mainAxisCellCount: 0,
    ),
    Card(
      name: 'plus',
      image: 'assets/images/homeCards/plus.svg',
      backgroundColor: "#20B37C",
      icon: Icon(
        Icons.add,
        size: 40,
        color: Colors.white,
      ),
      crossAxisCellCount: 0,
      mainAxisCellCount: 0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
      itemCount: oraTools.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onLongPress: () {
            setState(() {
              shake = true;
            });
            debugPrint('long press');
          },
          onLongPressEnd: (details) {
            setState(() {
              shake = false;
            });
            debugPrint('long press end');
          },
          child: ShakeWidget(
            shakeConstant: ShakeVerticalConstant1(),
            duration: Duration(milliseconds: 15000 + (index * 1000)),
            autoPlay: shake,
            enableWebMouseHover: true,
            child: InkWell(
              onTap: () {
                debugPrint('card tapped');
              },
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: oraTools[index].backgroundColor == "#FFFFFF"
                          ? Colors.white
                          : HexColor(oraTools[index].backgroundColor),
                      // color: HexColor(oraTools[index].backgroundColor),
                    ),
                    child: Center(
                        child: badges.Badge(
                            showBadge: false,
                            badgeContent: const Text('1',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: oraTools[index].icon,
                            ))),
                  )),
            ),
          ),
        );

        // return OraToolCard(tool: oraTools[index]);
      },
    );
  }
}
