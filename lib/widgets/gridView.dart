import 'package:flutter/material.dart';
import 'package:tareeq/widgets/custom_card_yellow.dart';

class OtherServicesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> services = [
   {
      'title': 'Consultation',
      'description': 'Quick client access',
      'image':'assets/images/services/consultation.png', 
    },
    {
      'title': 'Gasoline',
      'description': 'Arriving at the nearest gas station',
      'image': 'assets/images/services/Gasoline.png'
    },
    {
      'title': 'instructions',
       'description': 'instructions,proactive steps and traffic instruction',
        'image': 'assets/images/services/Instructions.png'
       },
    {
      'title': 'Crashes',
       'description': 'Reaching the nearest branch maintence',
        'image': 'assets/images/services/Crashes.png'
       },
    {
      'title': 'First aid', 
      'description': 'Basic instructions in first aid',
      'image': 'assets/images/services/First aid.png'
      },
    {
      'title': 'Distress',
       'description': 'Reaching the nearest rescue squad',
       'image': 'assets/images/services/Distress.png'
       },
    
  ];
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height:280,
      width:340,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 1,
            crossAxisSpacing: 0,
            childAspectRatio: 2.2,
          ),
          itemCount: services.length,
          itemBuilder: (context, index) {
            final service = services[index];
            return CustomCardY(image: service['image'], title: service['title'], subtitle: service['description']);
          },
        ),
    );
  }
}