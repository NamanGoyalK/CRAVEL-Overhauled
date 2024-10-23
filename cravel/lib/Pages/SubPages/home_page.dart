import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:cravel/Pages/Database/database.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageMainState createState() => HomePageMainState();
}

class HomePageMainState extends State<HomePage> {
  String selectedState = 'All';
  bool isDropdownVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: false,
            snap: true,
            elevation: 0,
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            title: const Text('Our Suggestions !',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                )),
            actions: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: isDropdownVisible
                    ? Container(
                        key: const ValueKey('dropdown'),
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              color: Color(0xFF333333),
                            ),
                            iconSize: 24,
                            style: const TextStyle(
                              color: Color(0xFF333333),
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                            dropdownColor: const Color(0xFFFFFFFF),
                            value: selectedState,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedState = newValue!;
                                isDropdownVisible = false;
                              });
                            },
                            items: [
                              'All',
                              'Himachal Pradesh',
                              'Uttarakhand',
                              'Ladakh',
                              'Jammu & Kashmir',
                              'Uttar Pradesh',
                              'Rajasthan',
                              'Gujarat',
                              'Maharashtra',
                              'Madhya Pradesh',
                              'Chhattisgarh',
                              'Odisha',
                              'Arunachal Pradesh',
                              'Nagaland',
                              'Assam',
                              'Tripura',
                              'West Bengal',
                              'Tamil Nadu',
                              'Andhra Pradesh',
                              'Kerala',
                              'Punjab',
                              'Haryana',
                              'Bihar',
                              'Sikkim',
                              'Manipur',
                              'Mizoram',
                              'Meghalaya',
                              'Telangana',
                              'Karnataka'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4, vertical: 2),
                                  child: Text(
                                    value,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      )
                    : IconButton(
                        key: const ValueKey('filter_icon'),
                        icon: const Icon(Icons.filter_alt_outlined,
                            color: Color(0xFF333333)),
                        onPressed: () {
                          setState(() {
                            isDropdownVisible = true;
                          });
                        },
                      ),
              ),
              if (isDropdownVisible) const SizedBox(width: 12),
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                List<Location> filteredLocations = selectedState == 'All'
                    ? locations
                    : locations
                        .where((location) =>
                            location.place.contains(selectedState))
                        .toList();
                if (index < filteredLocations.length) {
                  final location = filteredLocations[index];
                  return LocationListItem(
                    imageUrl: location.imageUrl,
                    name: location.name,
                    city: location.place,
                  );
                } else {
                  return null;
                }
              },
              childCount: selectedState == 'All'
                  ? locations.length
                  : locations
                      .where(
                          (location) => location.place.contains(selectedState))
                      .length,
            ),
          ),
        ],
      ),
    );
  }
}

class LocationListItem extends StatelessWidget {
  LocationListItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.city,
  });

  final String imageUrl;
  final String name;
  final String city;
  final GlobalKey backgroundImageKey0 = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              buildParallaxBackground(context),
              buildGradient(),
              buildTitleAndSubtitle(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildParallaxBackground(BuildContext context) {
    return Flow(
      delegate: ParallaxFlowDelegate(
        scrollable: Scrollable.of(context),
        listItemContext: context,
        backgroundImageKey: backgroundImageKey0,
      ),
      children: [
        FadeInImage.assetNetwork(
          placeholder: 'assets/images/output.jpg',
          image: imageUrl,
          key: backgroundImageKey0,
          fit: BoxFit.cover,
        ),
      ],
    );
  }

  Widget buildGradient() {
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

  Widget buildTitleAndSubtitle() {
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
            city,
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
  void updateRenderObject(BuildContext context, RenderParallax renderObject) {
    renderObject.scrollable = Scrollable.of(context);
  }
}

class ParallaxParentData extends ContainerBoxParentData<RenderBox> {}

class RenderParallax extends RenderBox
    with RenderObjectWithChildMixin<RenderBox>, RenderProxyBoxMixin {
  RenderParallax({
    required ScrollableState scrollable,
  }) : scrollable0 = scrollable;

  ScrollableState scrollable0;

  ScrollableState get scrollable => scrollable0;

  set scrollable(ScrollableState value) {
    if (value != scrollable0) {
      if (attached) {
        scrollable0.position.removeListener(markNeedsLayout);
      }
      scrollable0 = value;
      if (attached) {
        scrollable0.position.addListener(markNeedsLayout);
      }
    }
  }

  @override
  void attach(PipelineOwner owner) {
    super.attach(owner);
    scrollable0.position.addListener(markNeedsLayout);
  }

  @override
  void detach() {
    scrollable0.position.removeListener(markNeedsLayout);
    super.detach();
  }

  @override
  void setupParentData(RenderObject child) {
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
