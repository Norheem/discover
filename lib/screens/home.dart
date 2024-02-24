// import 'package:discover/screens/dashboard.dart';
// import 'package:discover/screens/favourite.dart';
// import 'package:discover/screens/profile.dart';
// import 'package:discover/screens/search.dart';
// import 'package:flutter/material.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   final homeNavKey = GlobalKey<NavigatorState>();
//   final boardNavKey = GlobalKey<NavigatorState>();
//   final messageNavKey = GlobalKey<NavigatorState>();
//   final profileNavKey = GlobalKey<NavigatorState>();
//   int selectedTab = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // bottomSheet: ,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(8),
//           child: IndexedStack(
//             index: selectedTab,
//             children: const [
//               Dashboard(),
//               Search(),
//               Favourite(),
//               Profile(),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: selectedTab,
//         selectedItemColor: Colors.green,
//         unselectedItemColor: Colors.grey,
//         showUnselectedLabels: true,
//         onTap: (index) {
//           setState(() {
//             selectedTab = index;
//           });
//         },
//         items: [
//           BottomNavigationBarItem(
//             icon: selectedTab == 0
//                 ? const Icon(Icons.home)
//                 : const Icon(Icons.home_outlined),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: selectedTab == 1
//                 ? const Icon(Icons.search)
//                 : const Icon(Icons.search_outlined),
//             label: 'Search',
//           ),
//           BottomNavigationBarItem(
//             icon: selectedTab == 2
//                 ? const Icon(Icons.favorite)
//                 : const Icon(Icons.favorite_border_outlined),
//             label: 'Favourites',
//           ),
//           BottomNavigationBarItem(
//             icon: selectedTab == 1
//                 ? const Icon(Icons.person)
//                 : const Icon(Icons.person_outline),
//             label: 'Profile',
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:discover/screens/dashboard.dart';
import 'package:discover/screens/favourite.dart';
import 'package:discover/screens/profile.dart';
import 'package:discover/screens/search.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    PageController _controller = PageController(
      initialPage: currentPage,
    );
    void onTapIcon(int index) {
      _controller.animateToPage(
        index,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeIn,
      );
    }

    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _controller,
          onPageChanged: (value) {
            setState(() {
              currentPage = value;
            });
          },
          children: const [
            Dashboard(),
            Search(),
            Favourite(),
            Profile(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        //You can wrap the BottomNavigationBar into a container to set height of the BottomNavigationBar
        //You can also set background color of the BottomNavigationBar
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        currentIndex: currentPage,
        // selectedFontSize: 20,
        // unselectedFontSize: 18,
        onTap: onTapIcon,
        items: [
          BottomNavigationBarItem(
            icon: currentPage == 0
                ? const Icon(Icons.home)
                : const Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: currentPage == 1
                ? const Icon(Icons.search)
                : const Icon(Icons.search_outlined),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: currentPage == 2
                ? const Icon(Icons.favorite)
                : const Icon(Icons.favorite_border_outlined),
            label: 'Favourites',
          ),
          BottomNavigationBarItem(
            icon: currentPage == 1
                ? const Icon(Icons.person)
                : const Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
