import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medshop/screens/BottomBar_Screens/Accounts.dart';
import 'package:medshop/screens/BottomBar_Screens/HomeScreen.dart';
import 'package:medshop/screens/BottomBar_Screens/categories.dart';
import 'package:medshop/screens/BottomBar_Screens/notification.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class AnimatedBarExample extends StatefulWidget {
  const AnimatedBarExample({super.key});

  @override
  State<AnimatedBarExample> createState() => _AnimatedBarExampleState();
}

class _AnimatedBarExampleState extends State<AnimatedBarExample> {
  dynamic selected;
  var heart = false;
  PageController controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: StylishBottomBar(
        option: AnimatedBarOptions(
          barAnimation: BarAnimation.fade,
          iconStyle: IconStyle.animated,
        ),
        items: [
          BottomBarItem(
            icon: const Icon(
              Icons.house_outlined,
            ),
            title: const Text(
              'Home',
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
            selectedColor: const Color.fromARGB(255, 69, 161, 218),
          ),
          BottomBarItem(
            icon: const Icon(
              Icons.category_outlined,
            ),
            selectedColor: const Color.fromARGB(255, 69, 161, 218),
            title: const Text('Categories',
                style: TextStyle(fontWeight: FontWeight.w400)),
          ),
          BottomBarItem(
              icon: const Icon(
                Icons.notifications_outlined,
              ),
              selectedIcon: const Icon(
                Icons.style,
              ),
              selectedColor: const Color.fromARGB(255, 69, 161, 218),
              title: const Text('Notification',
                  style: TextStyle(fontWeight: FontWeight.w400))),
          BottomBarItem(
              icon: const Icon(
                Icons.person_outline,
              ),
              selectedIcon: const Icon(
                Icons.broadcast_on_personal_sharp,
                color: Color.fromARGB(255, 69, 161, 218),
              ),
              selectedColor: const Color.fromARGB(255, 69, 161, 218),
              title: const Text('Account',
                  style: TextStyle(fontWeight: FontWeight.w400))),
        ],
        hasNotch: true,
        fabLocation: StylishBarFabLocation.center,
        currentIndex: selected ?? 0,
        onTap: (index) {
          controller.jumpToPage(index);
          setState(() {
            selected = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => const PostYourproperty()));
        },
        backgroundColor: Colors.white,
        child: const Icon(
          CupertinoIcons.phone,
          size: 30,
          color: Color.fromARGB(255, 69, 161, 218),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: PageView(
          controller: controller,
          children: const [
            HomeScreen(),
            CategoryScreen(),
            NotificationScreen(),
            AccountScreen()
          ],
        ),
      ),
    );
  }
}
