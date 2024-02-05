import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(
      const MaterialApp(
        title: 'Hamid App',
        home: CustomScrollViewHamid(),
        debugShowCheckedModeBanner: false,
      ),
    );

class CustomScrollViewHamid extends StatefulWidget {
  const CustomScrollViewHamid({Key? key}) : super(key: key);

  @override
  State<CustomScrollViewHamid> createState() => _CustomScrollViewHamidState();
}

class _CustomScrollViewHamidState extends State<CustomScrollViewHamid> {

Future<void> _handleRefresh() async {

    await Future.delayed(const Duration(seconds: 1));
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        displacement: 90.0,
        onRefresh: _handleRefresh,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: const Center(
                
              ),
              backgroundColor: Colors.red.shade900,
        
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add, 
                  color: Colors.white,),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.airplanemode_on_rounded , 
                  color: Colors.white,),
                ),
              ],
              stretch: true,
              // floating: true,
              elevation: 10,
              pinned: true,
              expandedHeight: 250.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'assets/images/darkhamid.jpeg',
                  fit: BoxFit.cover,
                ),
                stretchModes: const [
                  StretchMode.zoomBackground,
                  StretchMode.fadeTitle
                ],
                collapseMode: CollapseMode.parallax,
              ),
            ),
            SliverFixedExtentList(
              itemExtent: 100.0,
              delegate: SliverChildListDelegate(
                [
                  Container(color: Colors.red.shade900),
                  Container(color: Colors.purple.shade900),
                  Container(color: Colors.green.shade900),
                  Container(color: Colors.orange.shade900),
                  Container(color: Colors.yellow.shade900),
                  Container(color: Colors.pink.shade900),
                ],
              ),
            ),
            SliverAppBar(
              title: const Text('Hamid le ouf',
                  style: TextStyle(color: Colors.white, fontSize: 25)),
              backgroundColor: Colors.red.shade900,
              stretch: true,
              // floating: true,
              elevation: 10,
              pinned: true,
              // expandedHeight: 100.0,
              flexibleSpace: FlexibleSpaceBar(
                background: SizedBox(
                  width: double.infinity,
                  // height: 200.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Image.asset(
                        'assets/images/darkhamid.jpeg',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/images/darkhamid.jpeg',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/images/darkhamid.jpeg',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/images/darkhamid.jpeg',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/images/darkhamid.jpeg',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/images/darkhamid.jpeg',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/images/darkhamid.jpeg',
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
                stretchModes: const [
                  StretchMode.zoomBackground,
                  StretchMode.fadeTitle
                ],
                collapseMode: CollapseMode.parallax,
              ),
            ),
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    color: randomColor(),
                    // height: 30.0,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Color randomColor() {
  return Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0)
      .withOpacity(1.0);
}

class HamidApp extends StatelessWidget {
  const HamidApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hamid '),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            ImageSection(image: 'assets/images/darkhamid.jpeg'),
            // GridView.count(
            //   shrinkWrap: true,
            //   crossAxisCount: 5,
            //   children: List.generate(10, (index) {
            //     return const Padding(
            //       padding: EdgeInsets.all(10),
            //       child: Column(
            //         children: [
            //           Icon(Icons.star, color: Colors.blue),
            //           Text('hamid '),
            //         ],
            //       ),
            //     );
            //   }),
            // ),
            CardExample(),
            Cardtouchable(),
            TitleSection(name: "Hamid", location: "Ifrane"),
            ButtonSection(),
            TextSection(
                description:
                    "the Black Swordsman: A formidable warrior marked by a tragic past, he wields a massive sword named Dragon Slayer."
                    " Battling demonic forces and inner demons, Guts seeks purpose and redemption."),
          ],
        ),
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
    required this.name,
    required this.location,
  });

  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  location,
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          const Icon(Icons.account_balance, color: Colors.blueAccent),
          const Text('41'),
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ButtonWithText(
          color: Colors.teal,
          icon: Icons.call,
          label: 'CALL',
        ),
        ButtonWithText(
          color: Colors.teal,
          icon: Icons.near_me,
          label: 'ROUTE',
        ),
        ButtonWithText(
          color: Colors.teal,
          icon: Icons.share,
          label: 'SHARE',
        ),
      ],
    );
  }
}

class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
  });

  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class TextSection extends StatelessWidget {
  const TextSection({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Text(
        description,
        softWrap: true,
      ),
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: 600,
      height: 240,
      fit: BoxFit.cover,
    );
  }
}

class CardExample extends StatelessWidget {
  const CardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              title: Center(child: Text('hamid jkgkjubvbjv')),
              subtitle: Center(child: Text('wach hamid wa3r')),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Center(
                  child: TextButton(
                    child: const Text('oui'),
                    onPressed: () {/* ... */},
                  ),
                ),
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('oui'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Cardtouchable extends StatelessWidget {
  const Cardtouchable({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 10,
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          splashColor: Colors.blue[200],
          onTap: () {
            debugPrint('Card tapped.');
          },
          child: const InheritedWidgetExample(
            data: 'Hamid le ouf',
            child: SizedBox(
                width: 200,
                height: 80,
                child: Center(child: Text('Hamid le ouf '))),
          ),
        ),
      ),
    );
  }
}

class InheritedWidgetExample extends InheritedWidget {
  const InheritedWidgetExample({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  final String data;

  static InheritedWidgetExample of(BuildContext context) {
    final InheritedWidgetExample? result =
        context.dependOnInheritedWidgetOfExactType<InheritedWidgetExample>();
    assert(result != null, 'No InheritedWidgetExample found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(InheritedWidgetExample oldWidget) =>
      data != oldWidget.data;
}
