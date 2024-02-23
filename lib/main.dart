import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:the_m_shop/UI/homeUI/home.dart';
import 'UI/Search/search.dart';
import 'auth/login.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: _buildTheme(Brightness.dark),
      routes: {
        '/Home': (context) => const Home(),
        '/Discover': (context) => const search(),
      },
      home: const login(),
    );
  }
}

ThemeData _buildTheme(brightness) {
  var baseTheme = ThemeData(brightness: brightness);

  return baseTheme.copyWith(
    textTheme: GoogleFonts.soraTextTheme(baseTheme.textTheme),
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.white70)
        .copyWith(background: Colors.white70),
  );
}

class MyScaffold extends StatefulWidget {
  const MyScaffold({Key? key}) : super(key: key);

  @override
  MyScaffoldState createState() => MyScaffoldState();
}

class MyScaffoldState extends State<MyScaffold> {
  int currentPageIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const Home(),
    const search(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            "E V E R Y T H I N G",
            style: TextStyle(
                fontWeight: FontWeight.w600, color: Colors.yellow.shade200),
          )),
      bottomNavigationBar: NavigationBar(
        elevation: 10,
        height: 80,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.blue.shade400,
        backgroundColor: Colors.transparent,
        selectedIndex: currentPageIndex,
        destinations: <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(
              Icons.home,
              color: Colors.yellow[200],
            ),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.search,
              color: Colors.yellow[200],
            ),
            label: '',
          ),
        ],
      ),
      body: _widgetOptions.elementAt(currentPageIndex),
    );
  }
}
