import 'package:flutter/material.dart';
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
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            snap: true,
            elevation: 0,
            backgroundColor: Colors.white,
            title: const Text(
              'Our Suggestions!',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            actions: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                transitionBuilder: (child, animation) {
                  return FadeTransition(opacity: animation, child: child);
                },
                child:
                    isDropdownVisible ? _buildDropdown() : _buildFilterIcon(),
              ),
              if (isDropdownVisible) const SizedBox(width: 12),
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final filteredLocations = _getFilteredLocations();
                if (index < filteredLocations.length) {
                  final location = filteredLocations[index];
                  return LocationListItem(
                    imageUrl: location.imageUrl,
                    name: location.name,
                    city: location.place,
                  );
                }
                return null;
              },
              childCount: _getFilteredLocations().length,
            ),
          ),
        ],
      ),
    );
  }

  List<Location> _getFilteredLocations() {
    return selectedState == 'All'
        ? locations
        : locations
            .where((location) => location.place.contains(selectedState))
            .toList();
  }

  Widget _buildDropdown() {
    return Container(
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
          icon: const Icon(Icons.keyboard_arrow_down, color: Color(0xFF333333)),
          iconSize: 24,
          style: const TextStyle(
            color: Color(0xFF333333),
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
          dropdownColor: Colors.white,
          value: selectedState,
          onChanged: (newValue) {
            setState(() {
              selectedState = newValue!;
              isDropdownVisible = false;
            });
          },
          items: _buildDropdownMenuItems(),
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> _buildDropdownMenuItems() {
    final states = [
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
      'Jharkhand',
      'Sikkim',
      'Manipur',
      'Mizoram',
      'Meghalaya',
      'Telangana',
      'Karnataka'
    ];

    return states.map((value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(
          value,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      );
    }).toList();
  }

  Widget _buildFilterIcon() {
    return IconButton(
      key: const ValueKey('filter_icon'),
      icon: const Icon(Icons.filter_alt_outlined, color: Color(0xFF333333)),
      onPressed: () {
        setState(() {
          isDropdownVisible = true;
        });
      },
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
          imageErrorBuilder: (context, error, stackTrace) {
            return Image.asset(
              'assets/images/output.jpg',
              fit: BoxFit.cover,
            );
          },
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
    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
    final listItemBox = listItemContext.findRenderObject() as RenderBox;
    final listItemOffset = listItemBox.localToGlobal(
        listItemBox.size.centerLeft(Offset.zero),
        ancestor: scrollableBox);

    final viewportDimension = scrollable.position.viewportDimension;
    final scrollFraction =
        (listItemOffset.dy / viewportDimension).clamp(0.0, 1.0);

    final verticalAlignment = Alignment(0.0, scrollFraction * 2 - 1);

    final backgroundSize =
        (backgroundImageKey.currentContext!.findRenderObject() as RenderBox)
            .size;

    final zoomFactor = 1 + (scrollFraction * 0.1);
    final listItemSize = context.size;
    final childRect = verticalAlignment.inscribe(
        backgroundSize * zoomFactor, Offset.zero & listItemSize);

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
