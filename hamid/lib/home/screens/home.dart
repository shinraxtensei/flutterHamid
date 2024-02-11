import 'package:flutter/material.dart';
import 'package:hamid/home/widgets/cards.dart';

void main(List<String> args) {
  runApp(const MaterialApp(
    title: 'hamid',
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const Center(
        child: Column(
          children: [
            Cards(),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// /// Flutter code sample for [Table].

// void main() => runApp(const TableExampleApp());

// class TableExampleApp extends StatelessWidget {
//   const TableExampleApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: const Text('Table Sample')),
//         body: const TableExample(),
//       ),
//     );
//   }
// }

// class TableExample extends StatefulWidget {
//   const TableExample({super.key});

//   @override
//   TableExampleState createState() => TableExampleState();
// }

// class TableExampleState extends State<TableExample> {
//   List<String> items = ['AH', 'ML', 'HM', 'JL', 'GW', 'JB'];

//   @override
//   Widget build(BuildContext context) {
//     return ReorderableGridView(
//       crossAxisCount: 3,
//       mainAxisSpacing: 8.0,
//       crossAxisSpacing: 8.0,
//       children: items
//           .map((item) => Card(
//                 key: Key(item),
//                 color: getColorForItem(item),
//                 child: buildItem(item),
//               ))
//           .toList(),
//       onReorder: (int oldIndex, int newIndex) {
//         setState(() {
//           if (oldIndex < newIndex) {
//             newIndex -= 1;
//           }
//           final String movedItem = items.removeAt(oldIndex);
//           items.insert(newIndex, movedItem);
//         });
//       },
//     );
//   }

//   Widget buildItem(String item) {
//     return InkWell(
//       onTap: () {
//         // Handle tap if needed
//       },
//       child: Container(
//         width: 100,
//         height: 90,
//         alignment: Alignment.center,
//         child: Text(item),
//       ),
//     );
//   }

//   Color getColorForItem(String item) {
//     switch (item) {
//       case 'AH':
//         return Colors.blue.shade900;
//       case 'ML':
//         return Colors.blue.shade900;
//       case 'HM':
//         return Colors.blue.shade900;
//       case 'JL':
//         return Colors.blue.shade900;
//       case 'GW':
//         return Colors.red.shade900;
//       case 'JB':
//         return Colors.green.shade900;
//       default:
//         return Colors.grey;
//     }
//   }
// }









