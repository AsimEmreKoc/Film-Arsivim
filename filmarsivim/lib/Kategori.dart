import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filmarsivim/CustomNavBar.dart';
import 'package:filmarsivim/DetaySayfas%C4%B1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class kategori extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Keşfet",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "aksiyonWidget");
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Text(
                                "Aksiyon Filmleri",
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 23,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "dramWidget");
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Text(
                                "Dram Filmleri",
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 23,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "bilimKurguWidget");
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Text(
                                "Bilim Kurgu Filmleri",
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 23,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "maceraWidget");
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Text(
                                "Macera Filmleri",
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 23,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "fantastikWidget");
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Text(
                                "Fantastik Filmler",
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 23,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "gerilimWidget");
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Text(
                                "Gerilim Filmleri",
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 23,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "sucWidget");
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Text(
                                "Suç Filmleri",
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 23,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "romantikWidget");
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Text(
                                "Romantik Filmler",
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 23,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}

class aksiyonKategoriWidget extends StatelessWidget {
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
              'Aksiyon Filmleri',
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
                        .where((doc) => doc['Tür'].contains('Aksiyon'))
                        .length,
                    itemBuilder: (context, index) {
                      var aksiyonFilmleri = asyncSnapshot.data!.docs
                          .where((doc) => doc['Tür'].contains('Aksiyon'))
                          .toList();
                      DocumentSnapshot documentSnapshot =
                          aksiyonFilmleri[index];
                      return documentSnapshot['Tür'].contains('Aksiyon')
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

class DramKategoriWidget extends StatelessWidget {
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
              'Dram Filmleri',
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
                        .where((doc) => doc['Tür'].contains('Dram'))
                        .length,
                    itemBuilder: (context, index) {
                      var aksiyonFilmleri = asyncSnapshot.data!.docs
                          .where((doc) => doc['Tür'].contains('Dram'))
                          .toList();
                      DocumentSnapshot documentSnapshot =
                          aksiyonFilmleri[index];
                      return documentSnapshot['Tür'].contains('Dram')
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

class bilimKurguKategoriWidget extends StatelessWidget {
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
              'Bilim Kurgu Filmleri',
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
                        .where((doc) => doc['Tür'].contains('Bilim Kurgu'))
                        .length,
                    itemBuilder: (context, index) {
                      var aksiyonFilmleri = asyncSnapshot.data!.docs
                          .where((doc) => doc['Tür'].contains('Bilim Kurgu'))
                          .toList();
                      DocumentSnapshot documentSnapshot =
                          aksiyonFilmleri[index];
                      return documentSnapshot['Tür'].contains('Bilim Kurgu')
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

class maceraKategoriWidget extends StatelessWidget {
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
              'Macera Filmleri',
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
                        .where((doc) => doc['Tür'].contains('Macera'))
                        .length,
                    itemBuilder: (context, index) {
                      var aksiyonFilmleri = asyncSnapshot.data!.docs
                          .where((doc) => doc['Tür'].contains('Macera'))
                          .toList();
                      DocumentSnapshot documentSnapshot =
                          aksiyonFilmleri[index];
                      return documentSnapshot['Tür'].contains('Macera')
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

class fantastikKategoriWidget extends StatelessWidget {
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
              'Fantastik Filmler',
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
                        .where((doc) => doc['Tür'].contains('Fantastik'))
                        .length,
                    itemBuilder: (context, index) {
                      var aksiyonFilmleri = asyncSnapshot.data!.docs
                          .where((doc) => doc['Tür'].contains('Fantastik'))
                          .toList();
                      DocumentSnapshot documentSnapshot =
                          aksiyonFilmleri[index];
                      return documentSnapshot['Tür'].contains('Fantastik')
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

class gerilimKategoriWidget extends StatelessWidget {
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
              'Gerilim Filmleri',
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
                        .where((doc) => doc['Tür'].contains('Gerilim'))
                        .length,
                    itemBuilder: (context, index) {
                      var aksiyonFilmleri = asyncSnapshot.data!.docs
                          .where((doc) => doc['Tür'].contains('Gerilim'))
                          .toList();
                      DocumentSnapshot documentSnapshot =
                          aksiyonFilmleri[index];
                      return documentSnapshot['Tür'].contains('Gerilim')
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

class sucKategoriWidget extends StatelessWidget {
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
              'Suç Filmleri',
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
                        .where((doc) => doc['Tür'].contains('Suç'))
                        .length,
                    itemBuilder: (context, index) {
                      var aksiyonFilmleri = asyncSnapshot.data!.docs
                          .where((doc) => doc['Tür'].contains('Suç'))
                          .toList();
                      DocumentSnapshot documentSnapshot =
                          aksiyonFilmleri[index];
                      return documentSnapshot['Tür'].contains('Suç')
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

class romantikKategoriWidget extends StatelessWidget {
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
              'Romantik Filmler',
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
                        .where((doc) => doc['Tür'].contains('Romantik'))
                        .length,
                    itemBuilder: (context, index) {
                      var aksiyonFilmleri = asyncSnapshot.data!.docs
                          .where((doc) => doc['Tür'].contains('Romantik'))
                          .toList();
                      DocumentSnapshot documentSnapshot =
                          aksiyonFilmleri[index];
                      return documentSnapshot['Tür'].contains('Romantik')
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
