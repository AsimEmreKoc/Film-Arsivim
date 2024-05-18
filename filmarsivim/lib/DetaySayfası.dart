import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filmarsivim/CustomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class detaySayfasi extends StatefulWidget {
  final DocumentSnapshot product;

  const detaySayfasi({Key? key, required this.product}) : super(key: key);

  @override
  State<detaySayfasi> createState() => _detaySayfasiState();
}

class _detaySayfasiState extends State<detaySayfasi> {
  var film = FirebaseFirestore.instance.collection('Filmler');
 
  late YoutubePlayerController _controller;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final videoUrl = widget.product['fragman'];
    final videoID = YoutubePlayer.convertUrlToId(videoUrl);
    _controller = YoutubePlayerController(
        initialVideoId: videoID!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
        ));
  }

  Widget build(BuildContext context) {

    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
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
            return ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Opacity(
                        opacity: 0.4,
                        child: Image(
                          image: NetworkImage(
                            widget.product['afiş'],
                          ),
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SingleChildScrollView(
                        child: SafeArea(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 25),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Icon(
                                        Icons.arrow_back,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 100,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: FittedBox(
                                    fit: BoxFit.fill,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Image(
                                              image: NetworkImage(
                                                  widget.product['afiş']),
                                              height: 250,
                                              width: 180,
                                            ),
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              widget.product['FilmAd'],
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            SizedBox(height: 10,),
                                            Row(
                                              children: [
                                                Text(
                                              widget.product['yıl'],
                                              style: TextStyle(
                                                color: Colors.white70,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                                SizedBox(width: 20,),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  widget.product['imdb'],
                                                  style: TextStyle(
                                                    color: Colors.white54,
                                                    fontSize: 16,
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 10,),
                                                Text(
                                              widget.product['Tür'][0] + ' / ' +widget.product['Tür'][1],
                                              style: TextStyle(
                                                color: Colors.white70,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            
                                            
                                          ],
                                        ),
                                      ],
                                    )),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 30, right: 30),
                                child: Text(
                                  widget.product['konu'],
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              SizedBox(height: 50,),
                              Padding(
                                padding: EdgeInsets.only(left: 30,right: 30,bottom: 20),
                              child: YoutubePlayer(
                              controller: _controller,
                              showVideoProgressIndicator: true,
                              ),
                              )
                              
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                });
          }),
      bottomNavigationBar: CustomNavBar(),
    );
  }
  @override
  void dispose (){
    super.dispose();
    _controller.dispose();
  }
}
