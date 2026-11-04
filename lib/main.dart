import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'pages/contact_page.dart';
import 'pages/search_page.dart';
import 'pages/profile_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('id_ID', null);

  runApp(const MyContactApp());
}

class MyContactApp extends StatelessWidget {
  const MyContactApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Contact',

      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF4F2FA),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6558C3),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF6558C3),
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
        ),
      ),

      supportedLocales: const [
        Locale('id', 'ID'),
        Locale('en', 'US'),
      ],

      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      home: const MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    ContactPage(),
    SearchPage(),
    ProfilePage(),
  ];

  final List<String> titles = [
    'My Contact',
    'Cari Kontak',
    'Profil Saya',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[selectedIndex]),
      ),

      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),

      bottomNavigationBar: ConvexAppBar(
        backgroundColor: const Color(0xFF6558C3),
        activeColor: Colors.white,
        color: Colors.white70,
        style: TabStyle.react,

        initialActiveIndex: 0,

        items: const [
          TabItem(
            icon: Icons.contacts,
            title: 'Kontak',
          ),
          TabItem(
            icon: Icons.search,
            title: 'Cari',
          ),
          TabItem(
            icon: Icons.person,
            title: 'Profil',
          ),
        ],

        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}