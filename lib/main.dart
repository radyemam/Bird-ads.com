// main.dart
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;
import 'generated/l10n.dart';
import 'providers/user_provider.dart';
import 'screens/home_page.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/forgot_password_page.dart' as forgot;
import 'screens/verify_code_page.dart' as verify;
import 'screens/reset_password_page.dart';
import 'firebase_options.dart';
import 'widgets/loading_screen.dart';
import 'screens/wallet/add_balance_page.dart';
import 'screens/wallet/add_coupon_page.dart';
import 'screens/wallet/refund_request_page.dart';
import 'screens/wallet/refundable_balance_page.dart';
import 'screens/wallet/suspended_balance_page.dart';
import 'screens/wallet/spent_balance_page.dart';
import 'screens/wallet/added_balance_page.dart';
import 'screens/wallet/wallet_screen.dart';
import 'screens/wallet/vodafone_cash_transfer_page.dart';
import 'screens/settings/support_page.dart';
import 'screens/facebook_login_screen.dart';
import 'screens/settings/change_language_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print('Firebase initialized successfully');
  } catch (e) {
    print('Firebase initialization error: $e');
  }

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? languageCode = prefs.getString('language') ?? 'ar';
  Locale initialLocale = Locale(languageCode, languageCode == 'ar' ? 'EG' : 'US');

  String? userId = prefs.getString('userId');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: MyApp(initialLocale: initialLocale, userId: userId),
    ),
  );
}

class MyApp extends StatefulWidget {
  final Locale initialLocale;
  final String? userId;

  MyApp({required this.initialLocale, this.userId});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  late Locale _locale;

  @override
  void initState() {
    super.initState();
    _locale = widget.initialLocale;

    if (widget.userId != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Provider.of<UserProvider>(context, listen: false).setUserId(widget.userId!);
      });
    }
  }

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  Future<void> _checkForUpdate(BuildContext context) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String currentVersion = packageInfo.version;

    print("Current Version: $currentVersion");

    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('app_updates')
        .doc('9dDsNpXfqhJ8UJNeueZw')
        .get();

    if (documentSnapshot.exists) {
      String latestVersion = documentSnapshot['latest_version'];
      String updateUrl = documentSnapshot['update_url'];

      print("Latest Version: $latestVersion");
      print("Update URL: $updateUrl");

      List<String> currentVersionParts = currentVersion.split('.');
      List<String> latestVersionParts = latestVersion.split('.');

      bool needUpdate = false;
      for (int i = 0; i < currentVersionParts.length; i++) {
        if (int.parse(currentVersionParts[i]) < int.parse(latestVersionParts[i])) {
          needUpdate = true;
          break;
        } else if (int.parse(currentVersionParts[i]) > int.parse(latestVersionParts[i])) {
          needUpdate = false;
          break;
        }
      }

      if (needUpdate) {
        _showUpdateDialog(context, updateUrl);
      }
    } else {
      print("Document does not exist");
    }
  }

  void _showUpdateDialog(BuildContext context, String updateUrl) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(S.of(context).update_available_title),
        content: Text(S.of(context).update_available_message),
        actions: [
          TextButton(
            child: Text(S.of(context).later_button),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              foregroundColor: Colors.white,
            ),
            child: Text(S.of(context).update_button),
            onPressed: () {
              _launchURL(updateUrl);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bird ads',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue.shade900,
        ),
      ),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: _locale,
      builder: (context, widget) {
        return Directionality(
          textDirection: _locale.languageCode == 'ar' ? ui.TextDirection.rtl : ui.TextDirection.ltr,
          child: widget!,
        );
      },
      initialRoute: '/',
      routes: {
        '/': (context) => FutureBuilder(
          future: _checkLoginStatus(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (snapshot.hasData) {
              return HomePageWrapper(checkForUpdate: _checkForUpdate);
            } else {
              return LoginScreen();
            }
          },
        ),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => HomePageWrapper(checkForUpdate: _checkForUpdate),
        '/login': (context) => LoginScreen(),
        '/forgot-password': (context) => forgot.ForgotPasswordPage(),
        '/verify-code': (context) => verify.VerifyCodePage(email: '', verificationCode: ''),
        '/reset-password': (context) => ResetPasswordPage(email: ''),
        '/add-balance': (context) => AddBalancePage(),
        '/add-coupon': (context) => AddCouponPage(),
        '/refund-request': (context) => RefundRequestPage(),
        '/refundable-balance': (context) => RefundableBalancePage(),
        '/suspended-balance': (context) => SuspendedBalancePage(),
        '/spent-balance': (context) => SpentBalancePage(),
        '/added-balance': (context) => AddedBalancePage(),
        '/wallet': (context) => WalletScreen(),
        '/vodafone-cash-transfer': (context) => VodafoneCashTransferPage(amount: '', originalAmount: ''),
        '/facebook-login': (context) => FacebookLoginScreen(),
        '/settings/support_page': (context) => SupportPage(),
        '/settings/change_language': (context) => ChangeLanguagePage(setLocale: setLocale),
      },
    );
  }

  Widget _getPageByRouteName(String route) {
    switch (route) {
      case '/home':
        return HomePageWrapper(checkForUpdate: _checkForUpdate);
      case '/login':
        return LoginScreen();
      default:
        return LoginScreen();
    }
  }

  Future<String?> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('email');
    String? password = prefs.getString('password');

    if (email != null && password != null) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        if (userCredential.user != null) {
          Provider.of<UserProvider>(context, listen: false).setUserId(userCredential.user!.uid);
          return '/home';
        }
      } catch (e) {
        print('Login failed: $e');
        return null;
      }
    }
    return null;
  }

  void showLoadingScreen(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return LoadingScreen();
      },
    );
  }

  void hideLoadingScreen(BuildContext context) {
    Navigator.of(context).pop();
  }
}

class HomePageWrapper extends StatelessWidget {
  final Future<void> Function(BuildContext) checkForUpdate;

  HomePageWrapper({required this.checkForUpdate});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: checkForUpdate(context),
      builder: (context, snapshot) {
        return HomePage();
      },
    );
  }
}
