import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filmarsivim/CustomNavBar.dart';
import 'package:filmarsivim/DetaySayfas%C4%B1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class favoriWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var film = FirebaseFirestore.instance.collection('Filmler');
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFF0F111D),
        title: Row(
          children: [
            Text(
              'Beğendiğim Filmler',
              style: TextStyle(
                fontSize: 24,
              ),
            )
          ],
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: StreamBuilder<QuerySnapshot>(
              stream: film.snapshots(),
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
                return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 7,
                      mainAxisSpacing: 7,
                      childAspectRatio: 9 / 14,
                    ),
                    itemCount: asyncSnapshot.data!.docs
                        .where((doc) => doc['favori']
                            .contains(FirebaseAuth.instance.currentUser!.uid))
                        .length,
                    itemBuilder: (context, index) {
                      var favoriFilmler = asyncSnapshot.data!.docs
                          .where((doc) => doc['favori']
                              .contains(FirebaseAuth.instance.currentUser!.uid))
                          .toList();
                      DocumentSnapshot documentSnapshot = favoriFilmler[index];
                      return documentSnapshot['favori']
                              .contains(FirebaseAuth.instance.currentUser!.uid)
                          ? Container(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => detaySayfasi(
                                                product: documentSnapshot,
                                              )));
                                },
                                child: Container(
                                  width: 190,
                                  height: 300,
                                  margin: EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                      color: Color(0xFF292B37),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.transparent,
                                          spreadRadius: 2,
                                          blurRadius: 6,
                                        )
                                      ]),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                          ),
                                          child: Image(
                                            image: NetworkImage(
                                                documentSnapshot['afiş']),
                                            height: 185,
                                            width: 190,
                                            fit: BoxFit.cover,
                                          )),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 5),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                documentSnapshot['FilmAd'],
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Icon(
                                                        Icons.star,
                                                        color: Colors.amber,
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        documentSnapshot[
                                                            'imdb'],
                                                        style: TextStyle(
                                                          color: Colors.white54,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  StatefulBuilder(
                                                      builder: (context,
                                                              state) =>
                                                          documentSnapshot[
                                                                      'favori']
                                                                  .contains(FirebaseAuth
                                                                      .instance
                                                                      .currentUser!
                                                                      .uid)
                                                              ? IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    state(() {
                                                                      FirebaseFirestore
                                                                          .instance
                                                                          .collection(
                                                                              'Filmler')
                                                                          .doc(documentSnapshot
                                                                              .id)
                                                                          .update({
                                                                        'favori':
                                                                            FieldValue.arrayRemove([
                                                                          FirebaseAuth
                                                                              .instance
                                                                              .currentUser!
                                                                              .uid
                                                                        ])
                                                                      });
                                                                    });
                                                                  },
                                                                  icon: Icon(
                                                                    Icons
                                                                        .favorite_rounded,
                                                                    color: Colors
                                                                        .red,
                                                                    size: 22,
                                                                  ))
                                                              : IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    state(() {
                                                                      FirebaseFirestore
                                                                          .instance
                                                                          .collection(
                                                                              'Filmler')
                                                                          .doc(documentSnapshot
                                                                              .id)
                                                                          .update({
                                                                        'favori':
                                                                            FieldValue.arrayUnion([
                                                                          FirebaseAuth
                                                                              .instance
                                                                              .currentUser!
                                                                              .uid
                                                                        ])
                                                                      });
                                                                    });
                                                                  },
                                                                  icon: Icon(
                                                                    Icons
                                                                        .favorite_border_rounded,
                                                                    size: 22,
                                                                    color: Colors
                                                                        .white,
                                                                  ))),
                                                ],
                                              ),
                                            ],
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : Container();
                    });
              })),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
