// import 'package:flutter/material.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';

// class Refrech extends StatelessWidget {
//   const Refrech({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Home();
//     // return MaterialApp(title: 'refrech hamid', home: Home());
//   }
// }

// class RefreshBackground extends StatelessWidget {
//   const RefreshBackground({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SliverAppBar(
//       expandedHeight: 200.0,
//       flexibleSpace: FlexibleSpaceBar(
//         background: Image.asset(
//           'assets/images/darkhamid.jpeg',
//           fit: BoxFit.cover,
//         ),
//       ),
//     );
//   }
// }

// class Home extends StatelessWidget {
//   final RefreshController _refreshController = RefreshController(
//     initialRefresh: false,
//   );

//   Home({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//         backgroundColor: Colors.grey[700],
//         body: SmartRefresher(
//           controller: _refreshController,
//           header: const WaterDropHeader(),
//             enablePullDown: false,
//           enablePullUp: false,
//           enableTwoLevel: false,
//           // header: defaultHeader,
//           onRefresh: () async {
//             await Future.delayed(const Duration(seconds: 1));
//             _refreshController.refreshCompleted();
//           },
//           child: CustomScrollView(
//             slivers: [
//               const RefreshBackground(),
//               SliverList(delegate: SliverChildListDelegate(buildList()))
//             ],
//           ),
//         ));
//   }
// }

// List<Widget> buildList() {
//   return List.generate(
//       15,
//       (index) => Container(
//             height: 100,
//             margin: const EdgeInsets.symmetric(
//               vertical: 10,
//               horizontal: 15,
//             ),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(15),
//             ),
//           ));
// }





import 'package:flutter/cupertino.dart';


class RefreshControlApp extends StatelessWidget {
  const RefreshControlApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      theme: CupertinoThemeData(brightness: Brightness.light),
      home: RefreshControlExample(),
    );
  }
}

class RefreshControlExample extends StatefulWidget {
  const RefreshControlExample({super.key});

  @override
  State<RefreshControlExample> createState() => _RefreshControlExampleState();
}

class _RefreshControlExampleState extends State<RefreshControlExample> {
  List<Color> colors = <Color>[
    CupertinoColors.systemYellow,
    CupertinoColors.systemOrange,
    CupertinoColors.systemPink,
  ];
  List<Widget> items = <Widget>[
    Container(color: CupertinoColors.systemPink, height: 100.0),
    Container(color: CupertinoColors.systemOrange, height: 100.0),
    Container(color: CupertinoColors.systemYellow, height: 100.0),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('CupertinoSliverRefreshControl Sample'),
      ),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: <Widget>[
          const CupertinoSliverNavigationBar(
            largeTitle: Text('Scroll down'),
          ),
          CupertinoSliverRefreshControl(
            onRefresh: () async {
              await Future<void>.delayed(
                const Duration(milliseconds: 1000),
              );
              setState(() {
                items.insert(
                  0,
                  Container(color: colors[items.length % 3], height: 100.0),
                );
              });
            },
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) => items[index],
              childCount: items.length,
            ),
          ),
        ],
      ),
    );
  }
}
