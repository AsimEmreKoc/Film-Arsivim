import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filmarsivim/CustomNavBar.dart';
import 'package:filmarsivim/Filmler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AnaSayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    var Kullanici = FirebaseFirestore.instance
        .collection('Kullanıcılar')
        .where("KullanıcıID", isEqualTo: auth.currentUser!.uid);
    return Scaffold(
      body: SingleChildScrollView(
        child: StreamBuilder<QuerySnapshot>(
            stream: Kullanici.snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot> asyncSnapshot) {
              if (asyncSnapshot.hasError) {
                return Center(
                  child: Text('Hata'),
                );
              }
              if (asyncSnapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Text('Bekleyin'),
                );
              }
              return ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (context, index) {
                  DocumentSnapshot documentSnapshot =
                      asyncSnapshot.data!.docs[index];
                  return SafeArea(
                      child: Column(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 18, horizontal: 10),
                        child: Row(
                          children: [
                            SizedBox(width: 20,),
                            Image.asset('assets/images/logo2.png',scale: 2
                            ,),
                            SizedBox(width: 80,),
                            Column(
                              children: [
                                Text(
                                  "Hoşgeldin " + documentSnapshot['Ad'],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'Ne İzlemeli?',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white54,
                                  ),
                                )
                              ],
                            ),
                            
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      YeniFilmlerWidget(),
                      SizedBox(
                        height: 40,
                      ),
                      AksiyonFilmlerWidget(),
                      SizedBox(
                        height: 40,
                      ),
                      DramFilmlerWidget(),
                      SizedBox(
                        height: 40,
                      ),
                      BilimKurguFilmlerWidget(),
                      SizedBox(
                        height: 40,
                      ),
                      MaceraFilmlerWidget(),
                      SizedBox(
                        height: 40,
                      ),
                      FantastikFilmlerWidget(),
                      SizedBox(
                        height: 40,
                      ),
                      GerilimFilmlerWidget(),
                      SizedBox(
                        height: 40,
                      ),
                      SucFilmlerWidget(),
                      SizedBox(
                        height: 40,
                      ),
                      RomantikFilmlerWidget(),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ));
                },
              );
            }),
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
