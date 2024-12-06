import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tareeq/pages/chat_page.dart';
import 'package:tareeq/pages/location_page.dart';
import 'package:tareeq/pages/profile_page.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  State<BottomNavigationBarWidget> createState() => _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16,right: 35,left: 35),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Container(
            height: 60, // Adjust height to avoid overflow
            decoration: BoxDecoration(
              color: const Color(0xffE8C872),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent, // Avoid double background colors
              elevation: 0, // Avoid shadow overflow
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: [
                _buildNavItem(FontAwesomeIcons.house, () {}),
                _buildNavItem(FontAwesomeIcons.commentDots, () {
                  Navigator.pushNamed(context, ChatPage.id);
                }),
                _buildNavItem(FontAwesomeIcons.magnifyingGlass, () {}),
                _buildNavItem(FontAwesomeIcons.locationDot, () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LocationPage()),
                  );
                }),
                _buildNavItem(FontAwesomeIcons.user, () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(IconData icon, VoidCallback onTap) {
    return BottomNavigationBarItem(
      icon: GestureDetector(
        onTap: onTap,
        child: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
      ),
      label: '',
    );
  }
}
