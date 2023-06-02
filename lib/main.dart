import 'package:flutter/material.dart';
import 'package:note_app/pages/splash_screen.dart';
import 'package:note_app/providers/note_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

SharedPreferences? prefs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider <ServicesProvider> (
      create: (context) => ServicesProvider(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
       // routes: {'NotePage': (context) => NotePage()
       // },
      ),
      
    );
  }
}
