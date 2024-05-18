import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filmarsivim/DetaySayfas%C4%B1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class YeniFilmlerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var film = FirebaseFirestore.instance.collection('Filmler');
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Yeni Filmler',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        SingleChildScrollView(
          child: SizedBox(
              height: 180,
              width: 390,
              child: StreamBuilder<QuerySnapshot>(
                  stream: film.snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> asyncSnapshot) {
                    if (asyncSnapshot.hasError) {
                      return Center(
                        child: Text('Hata'),
                      );
                    }
                    if (asyncSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(
                        child: Text('Bekleyin'),
                      );
                    }

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: asyncSnapshot.data!.docs.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        DocumentSnapshot documentSnapshot =
                            asyncSnapshot.data!.docs[index];
                        return documentSnapshot['Tür'].contains('Yeni')
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => detaySayfasi(
                                                    product: documentSnapshot,
                                                  )));
                                        },
                                        child:
                                         Image(
                                        image: NetworkImage(
                                            documentSnapshot['afiş']),
                                        height: 180,
                                        width: 300,
                                        fit: BoxFit.cover,
                                      ),
                                      )
                                    ),
                                  )
                                ],
                              )
                            : Container();
                      },
                    );
                  })),
        )
      ],
    );
  }
}

class AksiyonFilmlerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var film = FirebaseFirestore.instance.collection('Filmler');
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Aksiyon',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "aksiyonWidget");
                  },
                  child: Text(
                    'Hepsini gör',
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 16,
                    ),
                  )),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        SingleChildScrollView(
          child: SizedBox(
              height: 290,
              width: 390,
              child: StreamBuilder<QuerySnapshot>(
                  stream: film.snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> asyncSnapshot) {
                    if (asyncSnapshot.hasError) {
                      return Center(
                        child: Text('Hata'),
                      );
                    }
                    if (asyncSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(
                        child: Text('Bekleyin'),
                      );
                    }

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: 8,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var aksiyonFilmleri = asyncSnapshot.data!.docs
                            .where((doc) => doc['Tür'].contains('Aksiyon'))
                            .toList();
                        DocumentSnapshot documentSnapshot =
                            aksiyonFilmleri[index];
                        return documentSnapshot['Tür'].contains('Aksiyon')
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  InkWell(
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
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                                height: 186,
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
                                                            MainAxisAlignment
                                                                .start,
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
                                                              color: Colors
                                                                  .white54,
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      StatefulBuilder(
                                                          builder: (context,
                                                                  state) =>
                                                              documentSnapshot['favori']
                                                                      .contains(FirebaseAuth
                                                                          .instance
                                                                          .currentUser!
                                                                          .uid)
                                                                  ? IconButton(
                                                                      onPressed:
                                                                          () {
                                                                        state(
                                                                            () {
                                                                          FirebaseFirestore
                                                                              .instance
                                                                              .collection('Filmler')
                                                                              .doc(documentSnapshot.id)
                                                                              .update({
                                                                            'favori':
                                                                                FieldValue.arrayRemove([
                                                                              FirebaseAuth.instance.currentUser!.uid
                                                                            ])
                                                                          });
                                                                        });
                                                                      },
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .favorite_rounded,
                                                                        color: Colors
                                                                            .red,
                                                                        size:
                                                                            22,
                                                                      ))
                                                                  : IconButton(
                                                                      onPressed:
                                                                          () {
                                                                        state(
                                                                            () {
                                                                          FirebaseFirestore
                                                                              .instance
                                                                              .collection('Filmler')
                                                                              .doc(documentSnapshot.id)
                                                                              .update({
                                                                            'favori':
                                                                                FieldValue.arrayUnion([
                                                                              FirebaseAuth.instance.currentUser!.uid
                                                                            ])
                                                                          });
                                                                        });
                                                                      },
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .favorite_border_rounded,
                                                                        size:
                                                                            22,
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
                                  )
                                ],
                              )
                            : Container();
                      },
                    );
                  })),
        )
      ],
    );
  }
}

class DramFilmlerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var film = FirebaseFirestore.instance.collection('Filmler');
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Dram',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "dramWidget");
                  },
                  child: Text(
                    'Hepsini gör',
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 16,
                    ),
                  ))
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        SingleChildScrollView(
          child: SizedBox(
              height: 290,
              width: 390,
              child: StreamBuilder<QuerySnapshot>(
                  stream: film.snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> asyncSnapshot) {
                    if (asyncSnapshot.hasError) {
                      return Center(
                        child: Text('Hata'),
                      );
                    }
                    if (asyncSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(
                        child: Text('Bekleyin'),
                      );
                    }

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: 8,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var dramFilmleri = asyncSnapshot.data!.docs
                            .where((doc) => doc['Tür'].contains('Dram'))
                            .toList();
                        DocumentSnapshot documentSnapshot = dramFilmleri[index];
                        return documentSnapshot['Tür'].contains('Dram')
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  InkWell(
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
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                                height: 186,
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
                                                            MainAxisAlignment
                                                                .start,
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
                                                              color: Colors
                                                                  .white54,
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      StatefulBuilder(
                                                          builder: (context,
                                                                  state) =>
                                                              documentSnapshot['favori']
                                                                      .contains(FirebaseAuth
                                                                          .instance
                                                                          .currentUser!
                                                                          .uid)
                                                                  ? IconButton(
                                                                      onPressed:
                                                                          () {
                                                                        state(
                                                                            () {
                                                                          FirebaseFirestore
                                                                              .instance
                                                                              .collection('Filmler')
                                                                              .doc(documentSnapshot.id)
                                                                              .update({
                                                                            'favori':
                                                                                FieldValue.arrayRemove([
                                                                              FirebaseAuth.instance.currentUser!.uid
                                                                            ])
                                                                          });
                                                                        });
                                                                      },
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .favorite_rounded,
                                                                        color: Colors
                                                                            .red,
                                                                        size:
                                                                            22,
                                                                      ))
                                                                  : IconButton(
                                                                      onPressed:
                                                                          () {
                                                                        state(
                                                                            () {
                                                                          FirebaseFirestore
                                                                              .instance
                                                                              .collection('Filmler')
                                                                              .doc(documentSnapshot.id)
                                                                              .update({
                                                                            'favori':
                                                                                FieldValue.arrayUnion([
                                                                              FirebaseAuth.instance.currentUser!.uid
                                                                            ])
                                                                          });
                                                                        });
                                                                      },
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .favorite_border_rounded,
                                                                        size:
                                                                            22,
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
                                  )
                                ],
                              )
                            : Container();
                      },
                    );
                  })),
        )
      ],
    );
  }
}

class BilimKurguFilmlerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var film = FirebaseFirestore.instance.collection('Filmler');
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Bilim Kurgu',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "bilimKurguWidget");
                  },
                  child: Text(
                    'Hepsini gör',
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 16,
                    ),
                  )),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        SingleChildScrollView(
          child: SizedBox(
              height: 290,
              width: 390,
              child: StreamBuilder<QuerySnapshot>(
                  stream: film.snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> asyncSnapshot) {
                    if (asyncSnapshot.hasError) {
                      return Center(
                        child: Text('Hata'),
                      );
                    }
                    if (asyncSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(
                        child: Text('Bekleyin'),
                      );
                    }

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: 8,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var bilimKurguFilmleri = asyncSnapshot.data!.docs
                            .where((doc) => doc['Tür'].contains('Bilim Kurgu'))
                            .toList();
                        DocumentSnapshot documentSnapshot =
                            bilimKurguFilmleri[index];
                        return documentSnapshot['Tür'].contains('Bilim Kurgu')
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  InkWell(
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
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                                height: 186,
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
                                                            MainAxisAlignment
                                                                .start,
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
                                                              color: Colors
                                                                  .white54,
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      StatefulBuilder(
                                                          builder: (context,
                                                                  state) =>
                                                              documentSnapshot['favori']
                                                                      .contains(FirebaseAuth
                                                                          .instance
                                                                          .currentUser!
                                                                          .uid)
                                                                  ? IconButton(
                                                                      onPressed:
                                                                          () {
                                                                        state(
                                                                            () {
                                                                          FirebaseFirestore
                                                                              .instance
                                                                              .collection('Filmler')
                                                                              .doc(documentSnapshot.id)
                                                                              .update({
                                                                            'favori':
                                                                                FieldValue.arrayRemove([
                                                                              FirebaseAuth.instance.currentUser!.uid
                                                                            ])
                                                                          });
                                                                        });
                                                                      },
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .favorite_rounded,
                                                                        color: Colors
                                                                            .red,
                                                                        size:
                                                                            22,
                                                                      ))
                                                                  : IconButton(
                                                                      onPressed:
                                                                          () {
                                                                        state(
                                                                            () {
                                                                          FirebaseFirestore
                                                                              .instance
                                                                              .collection('Filmler')
                                                                              .doc(documentSnapshot.id)
                                                                              .update({
                                                                            'favori':
                                                                                FieldValue.arrayUnion([
                                                                              FirebaseAuth.instance.currentUser!.uid
                                                                            ])
                                                                          });
                                                                        });
                                                                      },
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .favorite_border_rounded,
                                                                        size:
                                                                            22,
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
                                  )
                                ],
                              )
                            : Container();
                      },
                    );
                  })),
        )
      ],
    );
  }
}

class SucFilmlerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var film = FirebaseFirestore.instance.collection('Filmler');
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Suç',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "sucWidget");
                  },
                  child: Text(
                    'Hepsini gör',
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 16,
                    ),
                  )),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        SingleChildScrollView(
          child: SizedBox(
              height: 290,
              width: 390,
              child: StreamBuilder<QuerySnapshot>(
                  stream: film.snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> asyncSnapshot) {
                    if (asyncSnapshot.hasError) {
                      return Center(
                        child: Text('Hata'),
                      );
                    }
                    if (asyncSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(
                        child: Text('Bekleyin'),
                      );
                    }

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: 8,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var sucFilmleri = asyncSnapshot.data!.docs
                            .where((doc) => doc['Tür'].contains('Suç'))
                            .toList();
                        DocumentSnapshot documentSnapshot = sucFilmleri[index];
                        return documentSnapshot['Tür'].contains('Suç')
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  InkWell(
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
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                                height: 186,
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
                                                            MainAxisAlignment
                                                                .start,
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
                                                              color: Colors
                                                                  .white54,
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      StatefulBuilder(
                                                          builder: (context,
                                                                  state) =>
                                                              documentSnapshot['favori']
                                                                      .contains(FirebaseAuth
                                                                          .instance
                                                                          .currentUser!
                                                                          .uid)
                                                                  ? IconButton(
                                                                      onPressed:
                                                                          () {
                                                                        state(
                                                                            () {
                                                                          FirebaseFirestore
                                                                              .instance
                                                                              .collection('Filmler')
                                                                              .doc(documentSnapshot.id)
                                                                              .update({
                                                                            'favori':
                                                                                FieldValue.arrayRemove([
                                                                              FirebaseAuth.instance.currentUser!.uid
                                                                            ])
                                                                          });
                                                                        });
                                                                      },
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .favorite_rounded,
                                                                        color: Colors
                                                                            .red,
                                                                        size:
                                                                            22,
                                                                      ))
                                                                  : IconButton(
                                                                      onPressed:
                                                                          () {
                                                                        state(
                                                                            () {
                                                                          FirebaseFirestore
                                                                              .instance
                                                                              .collection('Filmler')
                                                                              .doc(documentSnapshot.id)
                                                                              .update({
                                                                            'favori':
                                                                                FieldValue.arrayUnion([
                                                                              FirebaseAuth.instance.currentUser!.uid
                                                                            ])
                                                                          });
                                                                        });
                                                                      },
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .favorite_border_rounded,
                                                                        size:
                                                                            22,
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
                                  )
                                ],
                              )
                            : Container();
                      },
                    );
                  })),
        )
      ],
    );
  }
}

class FantastikFilmlerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var film = FirebaseFirestore.instance.collection('Filmler');
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Fantastik',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "fantastikWidget");
                  },
                  child: Text(
                    'Hepsini gör',
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 16,
                    ),
                  )),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        SingleChildScrollView(
          child: SizedBox(
              height: 290,
              width: 390,
              child: StreamBuilder<QuerySnapshot>(
                  stream: film.snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> asyncSnapshot) {
                    if (asyncSnapshot.hasError) {
                      return Center(
                        child: Text('Hata'),
                      );
                    }
                    if (asyncSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(
                        child: Text('Bekleyin'),
                      );
                    }

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: 8,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var fantastikFilmleri = asyncSnapshot.data!.docs
                            .where((doc) => doc['Tür'].contains('Fantastik'))
                            .toList();
                        DocumentSnapshot documentSnapshot =
                            fantastikFilmleri[index];
                        return documentSnapshot['Tür'].contains('Fantastik')
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  InkWell(
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
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                                height: 186,
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
                                                            MainAxisAlignment
                                                                .start,
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
                                                              color: Colors
                                                                  .white54,
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      StatefulBuilder(
                                                          builder: (context,
                                                                  state) =>
                                                              documentSnapshot['favori']
                                                                      .contains(FirebaseAuth
                                                                          .instance
                                                                          .currentUser!
                                                                          .uid)
                                                                  ? IconButton(
                                                                      onPressed:
                                                                          () {
                                                                        state(
                                                                            () {
                                                                          FirebaseFirestore
                                                                              .instance
                                                                              .collection('Filmler')
                                                                              .doc(documentSnapshot.id)
                                                                              .update({
                                                                            'favori':
                                                                                FieldValue.arrayRemove([
                                                                              FirebaseAuth.instance.currentUser!.uid
                                                                            ])
                                                                          });
                                                                        });
                                                                      },
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .favorite_rounded,
                                                                        color: Colors
                                                                            .red,
                                                                        size:
                                                                            22,
                                                                      ))
                                                                  : IconButton(
                                                                      onPressed:
                                                                          () {
                                                                        state(
                                                                            () {
                                                                          FirebaseFirestore
                                                                              .instance
                                                                              .collection('Filmler')
                                                                              .doc(documentSnapshot.id)
                                                                              .update({
                                                                            'favori':
                                                                                FieldValue.arrayUnion([
                                                                              FirebaseAuth.instance.currentUser!.uid
                                                                            ])
                                                                          });
                                                                        });
                                                                      },
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .favorite_border_rounded,
                                                                        size:
                                                                            22,
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
                                  )
                                ],
                              )
                            : Container();
                      },
                    );
                  })),
        )
      ],
    );
  }
}

class MaceraFilmlerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var film = FirebaseFirestore.instance.collection('Filmler');
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Macera',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "maceraWidget");
                  },
                  child: Text(
                    'Hepsini gör',
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 16,
                    ),
                  )),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        SingleChildScrollView(
          child: SizedBox(
              height: 290,
              width: 390,
              child: StreamBuilder<QuerySnapshot>(
                  stream: film.snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> asyncSnapshot) {
                    if (asyncSnapshot.hasError) {
                      return Center(
                        child: Text('Hata'),
                      );
                    }
                    if (asyncSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(
                        child: Text('Bekleyin'),
                      );
                    }

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: 8,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var maceraFilmleri = asyncSnapshot.data!.docs
                            .where((doc) => doc['Tür'].contains('Macera'))
                            .toList();
                        DocumentSnapshot documentSnapshot =
                            maceraFilmleri[index];
                        return documentSnapshot['Tür'].contains('Macera')
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  InkWell(
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
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                                height: 186,
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
                                                            MainAxisAlignment
                                                                .start,
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
                                                              color: Colors
                                                                  .white54,
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      StatefulBuilder(
                                                          builder: (context,
                                                                  state) =>
                                                              documentSnapshot['favori']
                                                                      .contains(FirebaseAuth
                                                                          .instance
                                                                          .currentUser!
                                                                          .uid)
                                                                  ? IconButton(
                                                                      onPressed:
                                                                          () {
                                                                        state(
                                                                            () {
                                                                          FirebaseFirestore
                                                                              .instance
                                                                              .collection('Filmler')
                                                                              .doc(documentSnapshot.id)
                                                                              .update({
                                                                            'favori':
                                                                                FieldValue.arrayRemove([
                                                                              FirebaseAuth.instance.currentUser!.uid
                                                                            ])
                                                                          });
                                                                        });
                                                                      },
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .favorite_rounded,
                                                                        color: Colors
                                                                            .red,
                                                                        size:
                                                                            22,
                                                                      ))
                                                                  : IconButton(
                                                                      onPressed:
                                                                          () {
                                                                        state(
                                                                            () {
                                                                          FirebaseFirestore
                                                                              .instance
                                                                              .collection('Filmler')
                                                                              .doc(documentSnapshot.id)
                                                                              .update({
                                                                            'favori':
                                                                                FieldValue.arrayUnion([
                                                                              FirebaseAuth.instance.currentUser!.uid
                                                                            ])
                                                                          });
                                                                        });
                                                                      },
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .favorite_border_rounded,
                                                                        size:
                                                                            22,
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
                                  )
                                ],
                              )
                            : Container();
                      },
                    );
                  })),
        )
      ],
    );
  }
}

class GerilimFilmlerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var film = FirebaseFirestore.instance.collection('Filmler');
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Gerilim',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "gerilimWidget");
                  },
                  child: Text(
                    'Hepsini gör',
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 16,
                    ),
                  )),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        SingleChildScrollView(
          child: SizedBox(
              height: 290,
              width: 390,
              child: StreamBuilder<QuerySnapshot>(
                  stream: film.snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> asyncSnapshot) {
                    if (asyncSnapshot.hasError) {
                      return Center(
                        child: Text('Hata'),
                      );
                    }
                    if (asyncSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(
                        child: Text('Bekleyin'),
                      );
                    }

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: 8,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var gerilimFilmleri = asyncSnapshot.data!.docs
                            .where((doc) => doc['Tür'].contains('Gerilim'))
                            .toList();
                        DocumentSnapshot documentSnapshot =
                            gerilimFilmleri[index];
                        return documentSnapshot['Tür'].contains('Gerilim')
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  InkWell(
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
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                                height: 186,
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
                                                            MainAxisAlignment
                                                                .start,
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
                                                              color: Colors
                                                                  .white54,
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      StatefulBuilder(
                                                          builder: (context,
                                                                  state) =>
                                                              documentSnapshot['favori']
                                                                      .contains(FirebaseAuth
                                                                          .instance
                                                                          .currentUser!
                                                                          .uid)
                                                                  ? IconButton(
                                                                      onPressed:
                                                                          () {
                                                                        state(
                                                                            () {
                                                                          FirebaseFirestore
                                                                              .instance
                                                                              .collection('Filmler')
                                                                              .doc(documentSnapshot.id)
                                                                              .update({
                                                                            'favori':
                                                                                FieldValue.arrayRemove([
                                                                              FirebaseAuth.instance.currentUser!.uid
                                                                            ])
                                                                          });
                                                                        });
                                                                      },
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .favorite_rounded,
                                                                        color: Colors
                                                                            .red,
                                                                        size:
                                                                            22,
                                                                      ))
                                                                  : IconButton(
                                                                      onPressed:
                                                                          () {
                                                                        state(
                                                                            () {
                                                                          FirebaseFirestore
                                                                              .instance
                                                                              .collection('Filmler')
                                                                              .doc(documentSnapshot.id)
                                                                              .update({
                                                                            'favori':
                                                                                FieldValue.arrayUnion([
                                                                              FirebaseAuth.instance.currentUser!.uid
                                                                            ])
                                                                          });
                                                                        });
                                                                      },
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .favorite_border_rounded,
                                                                        size:
                                                                            22,
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
                                  )
                                ],
                              )
                            : Container();
                      },
                    );
                  })),
        )
      ],
    );
  }
}

class RomantikFilmlerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var film = FirebaseFirestore.instance.collection('Filmler');
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Romantik',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "romantikWidget");
                  },
                  child: Text(
                    'Hepsini gör',
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 16,
                    ),
                  )),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        SingleChildScrollView(
          child: SizedBox(
              height: 290,
              width: 390,
              child: StreamBuilder<QuerySnapshot>(
                  stream: film.snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> asyncSnapshot) {
                    if (asyncSnapshot.hasError) {
                      return Center(
                        child: Text('Hata'),
                      );
                    }
                    if (asyncSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(
                        child: Text('Bekleyin'),
                      );
                    }

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: 8,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var romantikFilmleri = asyncSnapshot.data!.docs
                            .where((doc) => doc['Tür'].contains('Romantik'))
                            .toList();
                        DocumentSnapshot documentSnapshot =
                            romantikFilmleri[index];
                        return documentSnapshot['Tür'].contains('Romantik')
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  InkWell(
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
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                                height: 186,
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
                                                            MainAxisAlignment
                                                                .start,
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
                                                              color: Colors
                                                                  .white54,
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      StatefulBuilder(
                                                          builder: (context,
                                                                  state) =>
                                                              documentSnapshot['favori']
                                                                      .contains(FirebaseAuth
                                                                          .instance
                                                                          .currentUser!
                                                                          .uid)
                                                                  ? IconButton(
                                                                      onPressed:
                                                                          () {
                                                                        state(
                                                                            () {
                                                                          FirebaseFirestore
                                                                              .instance
                                                                              .collection('Filmler')
                                                                              .doc(documentSnapshot.id)
                                                                              .update({
                                                                            'favori':
                                                                                FieldValue.arrayRemove([
                                                                              FirebaseAuth.instance.currentUser!.uid
                                                                            ])
                                                                          });
                                                                        });
                                                                      },
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .favorite_rounded,
                                                                        color: Colors
                                                                            .red,
                                                                        size:
                                                                            22,
                                                                      ))
                                                                  : IconButton(
                                                                      onPressed:
                                                                          () {
                                                                        state(
                                                                            () {
                                                                          FirebaseFirestore
                                                                              .instance
                                                                              .collection('Filmler')
                                                                              .doc(documentSnapshot.id)
                                                                              .update({
                                                                            'favori':
                                                                                FieldValue.arrayUnion([
                                                                              FirebaseAuth.instance.currentUser!.uid
                                                                            ])
                                                                          });
                                                                        });
                                                                      },
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .favorite_border_rounded,
                                                                        size:
                                                                            22,
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
                                  )
                                ],
                              )
                            : Container();
                      },
                    );
                  })),
        )
      ],
    );
  }
}
