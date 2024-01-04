import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management/layouts/bottom_navigation_layout.dart';
import 'package:student_management/screens/archive_screen/main.dart';
import 'package:student_management/screens/home_screen/main.dart';
import 'package:student_management/screens/profile_screen/main.dart';
import 'package:student_management/screens/setting_screen/main.dart';
import 'package:student_management/services/api/student_api.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => StudentApi()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Studex',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: 'Poppins',
        useMaterial3: true,
      ),
      home: const MyAppHome(),
    );
  }
}

class MyAppHome extends StatefulWidget {
  const MyAppHome({super.key});

  @override
  State<MyAppHome> createState() => _MyAppHomeState();
}

class _MyAppHomeState extends State<MyAppHome> {
  List pages = [const HomeScreen(), const ArchiveScreen(), const SettingScreen(), const ProfileScreen()];

  late int currentIndex;

  @override
  void initState() {
    super.initState();
    initialization();
    currentIndex = 1;
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 1));
    FlutterNativeSplash.remove();
  }

  void onTapNavigatorBar(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationLayout(
        currentIndex: currentIndex,
        onTapNavigatorBar: onTapNavigatorBar,
      ),
    );
  }
}
