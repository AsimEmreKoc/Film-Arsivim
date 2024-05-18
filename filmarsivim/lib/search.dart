import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filmarsivim/DetaySayfas%C4%B1.dart';
import 'package:flutter/material.dart';

class SearchPage extends SearchDelegate {
  @override
  String? get searchFieldLabel => "Film arayın";
  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        onPressed: () => close(context, null),
        icon: const Icon(Icons.arrow_back),
      );
  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
            onPressed: () {
              if (query.isEmpty) {
                close(context, null);
              }
              query = '';
            },
            icon: const Icon(Icons.clear))
      ];
  @override
  Widget buildResults(BuildContext context) => Center(
          child: Text(
        query,
        style: const TextStyle(
          fontSize: 30,
        ),
      ));
  @override
  Widget buildSuggestions(BuildContext context) {
    var film = FirebaseFirestore.instance.collection('Filmler');
    return FutureBuilder<QuerySnapshot>(
      future: film.get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }
        List<String> suggestions = [];
        snapshot.data!.docs.forEach((filmDoc) {
          String filmAd = filmDoc['FilmAd'];
          if (filmAd.toLowerCase().contains(query.toLowerCase())) {
            suggestions.add(filmAd);
          }
        });

        return ListView.builder(
          itemCount: suggestions.length,
          itemBuilder: (context, index) {
            final suggestion = suggestions[index];
            DocumentSnapshot documentSnapshot = snapshot.data!.docs[index];
            return ListTile(
              title: Text(
                suggestion,
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => detaySayfasi(
                              product: documentSnapshot,
                            )));
              },
            );
          },
        );
      },
    );
  }
}
