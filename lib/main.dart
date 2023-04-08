import 'package:firebase_core/firebase_core.dart';
import 'package:flipkartclone/provider/homepageprovider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'pages/homepage.dart';
import 'provider/searchpageprovider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => HomePageProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => SearchPageProvider(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'flipkart.com',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: GoogleFonts.ubuntu().fontFamily),
      home: const HomePage(),
    );
  }
}
