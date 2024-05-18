import 'dart:io';
import 'package:filmarsivim/AnaSayfas.dart';
import 'package:filmarsivim/Kategori.dart';
import 'package:filmarsivim/auth.dart';
import 'package:filmarsivim/fav.dart';
import 'package:filmarsivim/profil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:connectivity/connectivity.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase'in başlatılması
  Platform.isAndroid ?
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyC3FNcBDebrn5oOiV7S6mWF_ZeytQ_hvIg',
        appId: '1:1010480131675:android:e8ebf9e9e6d52f30ee997e',
        messagingSenderId: '1010480131675',
        projectId: 'film-arsivim-d9c09',
      ),
    )
   
    : await Firebase.initializeApp();
  

  runApp(MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    super.initState();
  }

  // İnternet bağlantısını kontrol eden fonksiyon
  Future<bool> checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false; // Bağlantı yok
    } else {
      return true; // Bağlantı var
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: Utils.messengerKey,
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF0F111D),
        useMaterial3: true,
      ),
      routes: {
        "AnaSayfa": (context) => AnaSayfa(),
        "Kategori": (context) => kategori(),
        "aksiyonWidget": (context) => aksiyonKategoriWidget(),
        "dramWidget": (context) => DramKategoriWidget(),
        "bilimKurguWidget": (context) => bilimKurguKategoriWidget(),
        "maceraWidget": (context) => maceraKategoriWidget(),
        "fantastikWidget": (context) => fantastikKategoriWidget(),
        "gerilimWidget": (context) => gerilimKategoriWidget(),
        "sucWidget": (context) => sucKategoriWidget(),
        "romantikWidget": (context) => romantikKategoriWidget(),
        "profilWidget": (context) => profilWidget(),
        "favoriWidget": (context) => favoriWidget(),
      },
      // Ana Ekran oluşturulurken internet bağlantısı kontrol ediliyor
      home: FutureBuilder<bool>(
        future: checkInternetConnection(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else {
            if (snapshot.data == false) {
              // Eğer internet bağlantısı yoksa hata mesajı göster
              return Scaffold(
                body: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 300,),
                      Text('İnternet bağlantısı yok, lütfen internete bağlanın.',style: TextStyle(color: Colors.white,fontSize: 25),),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size.fromHeight(50),
                        ),
                        child: Text('Tamam'),
                        onPressed: () {
                          SystemNavigator.pop();
                        }

                      )
                    ],
                  ),
                ),
              );
            } else {
              // Ana ekranı göster
              return AnaEkran();
            }
          }
        },
      ),
    );
  }
}