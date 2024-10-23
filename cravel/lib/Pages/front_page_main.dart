import 'package:cravel/Pages/SubPages/density_page.dart';
import 'package:cravel/Pages/SubPages/home_page.dart';
import 'package:cravel/Pages/SubPages/report_page.dart';
import 'package:cravel/Pages/more_page.dart';
import 'package:flutter/material.dart';

class FrontPageMain extends StatefulWidget {
  const FrontPageMain({super.key});

  @override
  State<FrontPageMain> createState() => _FrontPageMainState();
}

class _FrontPageMainState extends State<FrontPageMain> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  // Constant colors for reuse
  static const Color _backgroundColor = Colors.white;
  static const Color _appBarColor = Colors.white;
  static const Color _selectedIconColor = Color.fromARGB(255, 58, 34, 213);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index); // Jump to the selected page
  }

  @override
  void dispose() {
    _pageController.dispose(); // Dispose of the controller when done
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: _buildTitleBar(context),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  // Build the body with PageView
  Widget _buildBody() {
    return PageView(
      controller: _pageController,
      onPageChanged: (index) {
        setState(() {
          _selectedIndex = index; // Update selected index when swiping
        });
      },
      children: const <Widget>[
        HomePage(),
        ReportPage(),
        DensityPage(),
      ],
    );
  }

  // Build the bottom navigation bar
  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: _backgroundColor,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.report_problem),
          label: 'Report',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people_alt),
          label: 'Density',
        ),
      ],
      onTap: _onItemTapped,
      currentIndex: _selectedIndex,
      selectedIconTheme: const IconThemeData(
        color: _selectedIconColor,
        size: 30,
      ),
    );
  }

  // Build the title bar
  PreferredSize _buildTitleBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(50),
      child: AppBar(
        backgroundColor: _appBarColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'Cravel',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.menu,
              color: Color.fromARGB(135, 0, 0, 0),
              size: 30,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MorePage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
