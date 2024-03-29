import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  debugPaintSizeEnabled = false;
  runApp(const Paralax());
}

class Paralax extends StatelessWidget {
  const Paralax({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
        debugShowCheckedModeBanner: false,
        home: const Scaffold(
          body: ExampleParallax(),
        ),
      ),
    );
  }
}

class ExampleParallax extends StatelessWidget {
  const ExampleParallax({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 200.0,
          elevation: 10,
          stretch: true,
          floating: true,
          pinned: true,
          //if stretch is true, the title will be shown only when the appbar is expanded

          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: const Padding(
              padding: EdgeInsets.only(right: 50),
              child: Text('Gallery Hamid'),
            ),
            stretchModes: const [
              StretchMode.zoomBackground,
              StretchMode.fadeTitle
            ],
            collapseMode: CollapseMode.parallax,
            background: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/images/gradiant.jpg', // Replace with your background image
                  fit: BoxFit.cover,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/darkhamid.jpeg'),
                        radius: 60,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          '',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(8.0),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'What do people call you?',
                    labelText: 'Name *',
                  ),
                  onSaved: (String? value) {},
                  onChanged: (String? value) {
                    // debugPrint(debugDescribeFocusTree());
                    // print('On change $value');
                  },
                  validator: (String? value) {
                    return (value != null && value.contains('@'))
                        ? 'Do not use the @ char.'
                        : null;
                  },
                ),
                for (final location in locations)
                  //if the location.available is false wrap the LocationListItem with ColorFiltered
                  location.available
                      ? LocationListItem(
                          imageUrl: location.imageUrl,
                          name: location.name,
                          country: location.place,
                        )
                      : ColorFiltered(
                          colorFilter: const ColorFilter.mode(
                            Colors.grey,
                            BlendMode.saturation,
                          ),
                          child: Stack(
                            children: [
                              LocationListItem(
                                imageUrl: location.imageUrl,
                                name: location.name,
                                country: location.place,
                              ),
                              const Positioned(
                                top: 100,
                                left: 100,
                                child: Text(
                                  'UNAVAILABLE',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class LocationListItem extends StatelessWidget {
  LocationListItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.country,
  });

  final String imageUrl;
  final String name;
  final String country;
  final GlobalKey _backgroundImageKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(name),
                  content: InteractiveViewer(
                    maxScale: 5,
                    child: Image.asset(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return Details(imageUrl: imageUrl);
                            },
                          ),
                        );
                      },
                      child: const Text('Details'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Close'),
                    ),
                  ],
                );
              },
            );

            //? - to apply the hero animation
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (context) {
            //       return Details(imageUrl: imageUrl);
            //     },
            //   ),
            // );
          },
          child: Hero(
            tag: imageUrl,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                children: [
                  _buildParallaxBackground(context),
                  _buildGradient(),
                  _buildTitleAndSubtitle(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildParallaxBackground(BuildContext context) {
    return Flow(
      delegate: ParallaxFlowDelegate(
        scrollable: Scrollable.of(context),
        listItemContext: context,
        backgroundImageKey: _backgroundImageKey,
      ),
      children: [
        Image.asset(
          imageUrl,
          key: _backgroundImageKey,
          fit: BoxFit.cover,
        ),
      ],
    );
  }

  Widget _buildGradient() {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.6, 0.95],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleAndSubtitle() {
    return Positioned(
      left: 20,
      bottom: 20,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            country,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class ParallaxFlowDelegate extends FlowDelegate {
  ParallaxFlowDelegate({
    required this.scrollable,
    required this.listItemContext,
    required this.backgroundImageKey,
  }) : super(repaint: scrollable.position);

  final ScrollableState scrollable;
  final BuildContext listItemContext;
  final GlobalKey backgroundImageKey;

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return BoxConstraints.tightFor(
      width: constraints.maxWidth,
    );
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    // Calculate the position of this list item within the viewport.
    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
    final listItemBox = listItemContext.findRenderObject() as RenderBox;
    final listItemOffset = listItemBox.localToGlobal(
        listItemBox.size.centerLeft(Offset.zero),
        ancestor: scrollableBox);

    // Determine the percent position of this list item within the
    // scrollable area.
    final viewportDimension = scrollable.position.viewportDimension;
    final scrollFraction =
        (listItemOffset.dy / viewportDimension).clamp(0.0, 1.0);

    // Calculate the vertical alignment of the background
    // based on the scroll percent.
    final verticalAlignment = Alignment(0.0, scrollFraction * 2 - 1);

    // Convert the background alignment into a pixel offset for
    // painting purposes.
    final backgroundSize =
        (backgroundImageKey.currentContext!.findRenderObject() as RenderBox)
            .size;
    final listItemSize = context.size;
    final childRect =
        verticalAlignment.inscribe(backgroundSize, Offset.zero & listItemSize);

    // Paint the background.
    context.paintChild(
      0,
      transform:
          Transform.translate(offset: Offset(0.0, childRect.top)).transform,
    );
  }

  @override
  bool shouldRepaint(ParallaxFlowDelegate oldDelegate) {
    return scrollable != oldDelegate.scrollable ||
        listItemContext != oldDelegate.listItemContext ||
        backgroundImageKey != oldDelegate.backgroundImageKey;
  }
}

class Parallax extends SingleChildRenderObjectWidget {
  const Parallax({
    super.key,
    required Widget background,
  }) : super(child: background);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderParallax(scrollable: Scrollable.of(context));
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant RenderParallax renderObject) {
    renderObject.scrollable = Scrollable.of(context);
  }
}

class ParallaxParentData extends ContainerBoxParentData<RenderBox> {}

class RenderParallax extends RenderBox
    with RenderObjectWithChildMixin<RenderBox>, RenderProxyBoxMixin {
  RenderParallax({
    required ScrollableState scrollable,
  }) : _scrollable = scrollable;

  ScrollableState _scrollable;

  ScrollableState get scrollable => _scrollable;

  set scrollable(ScrollableState value) {
    if (value != _scrollable) {
      if (attached) {
        _scrollable.position.removeListener(markNeedsLayout);
      }
      _scrollable = value;
      if (attached) {
        _scrollable.position.addListener(markNeedsLayout);
      }
    }
  }

  @override
  void attach(covariant PipelineOwner owner) {
    super.attach(owner);
    _scrollable.position.addListener(markNeedsLayout);
  }

  @override
  void detach() {
    _scrollable.position.removeListener(markNeedsLayout);
    super.detach();
  }

  @override
  void setupParentData(covariant RenderObject child) {
    if (child.parentData is! ParallaxParentData) {
      child.parentData = ParallaxParentData();
    }
  }

  @override
  void performLayout() {
    size = constraints.biggest;

    // Force the background to take up all available width
    // and then scale its height based on the image's aspect ratio.
    final background = child!;
    final backgroundImageConstraints =
        BoxConstraints.tightFor(width: size.width);
    background.layout(backgroundImageConstraints, parentUsesSize: true);

    // Set the background's local offset, which is zero.
    (background.parentData as ParallaxParentData).offset = Offset.zero;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    // Get the size of the scrollable area.
    final viewportDimension = scrollable.position.viewportDimension;

    // Calculate the global position of this list item.
    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
    final backgroundOffset =
        localToGlobal(size.centerLeft(Offset.zero), ancestor: scrollableBox);

    // Determine the percent position of this list item within the
    // scrollable area.
    final scrollFraction =
        (backgroundOffset.dy / viewportDimension).clamp(0.0, 1.0);

    // Calculate the vertical alignment of the background
    // based on the scroll percent.
    final verticalAlignment = Alignment(0.0, scrollFraction * 2 - 1);

    // Convert the background alignment into a pixel offset for
    // painting purposes.
    final background = child!;
    final backgroundSize = background.size;
    final listItemSize = size;
    final childRect =
        verticalAlignment.inscribe(backgroundSize, Offset.zero & listItemSize);

    // Paint the background.
    context.paintChild(
        background,
        (background.parentData as ParallaxParentData).offset +
            offset +
            Offset(0.0, childRect.top));
  }
}

bool isImageUrlInLocations(String imageUrl) {
  for (var location in locations) {
    if (location.imageUrl == imageUrl) {
      return true;
    }
  }
  return false;
}

class Details extends StatelessWidget {
  const Details({super.key, required this.imageUrl});

  final String imageUrl;

  Location? getLocation() {
    for (var location in locations) {
      if (location.imageUrl == imageUrl) {
        return location;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getLocation()!.name),
      ),
      body: InteractiveViewer(
        boundaryMargin: const EdgeInsets.all(20.0),
        maxScale: 5,
        child: Center(
          child: Hero(
            tag: getLocation()!.imageUrl,
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class Location {
  const Location({
    required this.name,
    required this.place,
    required this.available,
    required this.imageUrl,
  });

  final String name;
  final String place;
  final bool available;
  final String imageUrl;
}

const locations = [
  Location(
    name: 'Mount Rushmore',
    place: 'U.S.A',
    available: true,
    imageUrl: 'assets/images/awesomO.jpg',
  ),
  Location(
    name: 'Gardens By The Bay',
    place: 'Singapore',
    available: false,
    imageUrl: 'assets/images/berserk.png',
  ),
  Location(
    name: 'Mexico City',
    place: 'Mexico',
    available: true,
    imageUrl: 'assets/images/darkhamid.jpeg',
  ),
  Location(
    name: 'Machu Picchu',
    place: 'Peru',
    available: true,
    imageUrl: 'assets/images/retards.jpg',
  ),
  Location(
    name: 'Vitznau',
    place: 'Switzerland',
    available: false,
    imageUrl: 'assets/images/djaj.jpeg',
  ),
];
