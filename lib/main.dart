import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tareeq/firebase_options.dart';
import 'package:tareeq/pages/chat_page.dart';
import 'package:tareeq/pages/home_page.dart';
import 'package:tareeq/pages/services_page.dart';


void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
 // Gemini.init(
   // apiKey: geminiApiKey
  //);
   runApp( MyApp());
}

class MyApp extends StatelessWidget {
const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
       routes: {
          ChatPage.id :(context) => ChatPage(),
          ServicesPage.id :(context) => ServicesPage()
      },
      debugShowCheckedModeBanner: false,
      home:HomePage(),
    );
  }
}
