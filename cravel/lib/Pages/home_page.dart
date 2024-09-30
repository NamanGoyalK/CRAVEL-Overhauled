import 'package:cravel/Pages/SubPages/density_page.dart';
import 'package:cravel/Pages/SubPages/front_page.dart';
import 'package:cravel/Pages/SubPages/report_page.dart';
import 'package:cravel/Pages/more_page.dart';
import 'package:flutter/material.dart';

int _selectedIndex = 0;

class HomePageMain extends StatefulWidget {
  const HomePageMain({super.key});

  @override
  State<HomePageMain> createState() => _HomePageMainState();
}

class _HomePageMainState extends State<HomePageMain> {
  set selectedIndex(int selectedIndex) {}

  void _onItemTapped(int index) {
    setState(
      () {
        _selectedIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: titleBar(context),
      body: Center(
        child: _selectedIndex == 0
            ? frontPage()
            : _selectedIndex == 1
                ? reportPage(context)
                : densityPage(),
      ),
      bottomNavigationBar: statusBar(),
    );
  }

  BottomNavigationBar statusBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
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
        color: Color.fromARGB(255, 58, 34, 213),
        size: 30,
      ),
    );
  }

  PreferredSize titleBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(50),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: AppBar(
          backgroundColor: const Color(0xffffffff),
          elevation: 0,
          automaticallyImplyLeading: false,
          // centerTitle: true,
          title: const Text(
            'Cravel',
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 30,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
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
      ),
    );
  }
}
