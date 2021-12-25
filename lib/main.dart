import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_wordpress_app/common/constants.dart';
import 'package:flutter_wordpress_app/pages/articles.dart';
import 'package:flutter_wordpress_app/pages/local_articles.dart';
import 'package:flutter_wordpress_app/pages/search.dart';
import 'package:flutter_wordpress_app/pages/settings.dart';
import 'package:flutter_wordpress_app/pages/single_article.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a bakcground message");
  print(message.notification!.title);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await requestPermission();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(MyApp());
}

Future<void> requestPermission() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print('User granted provisional permission');
  } else {
    print('User declined or has not accepted permission');
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Campus Times',
      // routes: {
      //   '/pages/single_article': (_) => SingleArticle(article, heroId),
      // },
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xFF385C7B),
        primaryColorLight: Colors.white,
        primaryColorDark: Colors.black,
        textTheme: TextTheme(
            headline1: TextStyle(
              fontSize: 17,
              color: Colors.black,
              height: 1.2,
              fontWeight: FontWeight.w500,
              fontFamily: "Soleil",
            ),
            caption: TextStyle(color: Colors.black45, fontSize: 10),
            bodyText1: TextStyle(
                fontSize: 16,
                height: 1.5,
                color: Colors.black87,
                fontWeight: FontWeight.normal)),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = [
    Articles(),
    LocalArticles(),
    Search(),
    Settings()
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedLabelStyle:
              TextStyle(fontWeight: FontWeight.w500, fontFamily: "Soleil"),
          unselectedLabelStyle: TextStyle(fontFamily: "Soleil"),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
            BottomNavigationBarItem(
                icon: Icon(Icons.flare), label: PAGE2_CATEGORY_NAME),
            BottomNavigationBarItem(
                icon: Icon(Icons.search), label: 'Pencarian'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_rounded), label: 'Biodata'),
          ],
          currentIndex: _selectedIndex,
          fixedColor: Theme.of(context).primaryColor,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
