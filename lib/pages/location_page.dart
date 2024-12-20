import 'package:flutter/material.dart';
import 'package:tareeq/const.dart';
import 'package:tareeq/widgets/check_box.dart';
import 'package:tareeq/widgets/second_text_field.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
        ),
        backgroundColor: kprimaryColor,
        title: const Text(
          'Winch Service',
          style:
              TextStyle(color: Colors.white, fontFamily: kFont, fontSize: 20),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: ListView(
            children: [
              const SizedBox(height: 12),
              SecondTextField(
                hintText: 'Enter your name',
                labalText: 'car owner name',
              ),
              const SizedBox(
                height: 35,
              ),
              SecondTextField(
                hintText: 'Enter your car number',
                labalText: 'car number',
              ),
              const SizedBox(
                height: 40,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '     What you need?',
                    style: TextStyle(
                        color: Color(0xff3C4B63),
                        fontFamily: kFont,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              checkBox(),
              const SizedBox(height: 1),
              SecondTextField(
                  hintText: 'Write Other needs', labalText: 'Other needs:'),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '      Location',
                    style: TextStyle(
                        color: Color(0xff3C4B63),
                        fontFamily: kFont,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '          from',
                    style: TextStyle(
                        color: kprimaryColor,
                        fontFamily: kFont,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              GestureDetector(
                  onTap: () {
                  //  canLaunchUrl(Uri.parse('https://www.google.com/maps/'));
                  },
                  child: const Image(
                    image: AssetImage('assets/images/map.jpg'),
                  )),
              const SizedBox(height: 8),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '          to',
                    style: TextStyle(
                        color: kprimaryColor,
                        fontFamily: kFont,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              const Image(
                image: AssetImage(
                  'assets/images/map.jpg',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
