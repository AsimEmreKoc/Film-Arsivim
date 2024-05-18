import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filmarsivim/CustomNavBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class profilWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    var Kullanici = FirebaseFirestore.instance
        .collection('Kullanıcılar')
        .where("KullanıcıID", isEqualTo: auth.currentUser!.uid);
        final user = FirebaseAuth.instance.currentUser!;
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
                  return Padding(padding: EdgeInsets.all(20),
                  child:
                     Column(
                      children: [
                        SizedBox(height: 80,),
                        Image.asset('assets/images/logo2.png'),
                        SizedBox(height: 80,),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(40),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0,5),
                                color: Color.fromARGB(255, 53, 248, 248).withOpacity(.4),
                                spreadRadius: 2,
                                blurRadius: 10,
                              )
                            ]
                          ),
                          child:  ListTile(
                          title: Text('Kullanıcı Adı',style: TextStyle(fontSize: 15),),
                          subtitle: Text(documentSnapshot['Ad'],style: TextStyle(fontSize: 25),),
                          leading: Icon(CupertinoIcons.person),
                          trailing: Icon(Icons.badge_outlined,color: Colors.grey,),
                          tileColor: Color(0xFF0F111D),
                        ),
                        ),
                        SizedBox(height: 40,),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(40),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0,5),
                                color: Color.fromARGB(255, 53, 248, 248).withOpacity(.4),
                                spreadRadius: 2,
                                blurRadius: 10,
                              )
                            ]
                          ),
                          child:  ListTile(
                          title: Text('Kullanıcı Soyadı',style: TextStyle(fontSize: 15),),
                          subtitle: Text(documentSnapshot['Soyad'],style: TextStyle(fontSize: 25),),
                          leading: Icon(CupertinoIcons.person),
                          trailing: Icon(Icons.badge_outlined,color: Colors.grey,),
                          tileColor: Color(0xFF0F111D),
                        ),
                        ),
                        SizedBox(height: 40,),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(40),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0,5),
                                color: Color.fromARGB(255, 53, 248, 248).withOpacity(.4),
                                spreadRadius: 2,
                                blurRadius: 10,
                              )
                            ]
                          ),
                          child:  ListTile(
                          title: Text('Kullanıcı Email',style: TextStyle(fontSize: 15),),
                          subtitle: FittedBox(fit: BoxFit.fill,child: Text(user.email!,style: TextStyle(fontSize: 25),),),
                          leading: Icon(CupertinoIcons.person),
                          trailing: Icon(Icons.email,color: Colors.grey,),
                          tileColor: Color(0xFF0F111D),
                        ),
                        ),
                       SizedBox(height: 40,),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size.fromHeight(50),
                        ),
                        icon: Icon(Icons.arrow_back, size: 32,),
                        label: Text('Çıkış Yap',
                        style: TextStyle(fontSize: 24),),
                        onPressed: () {
                          FirebaseAuth.instance.signOut();
                          Navigator.of(context).popUntil((route) => route.isFirst);
                        }

                      )
                      ],
                    )
                  );
                },
              );
            }),
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
