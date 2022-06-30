
import 'package:flutter/material.dart';
import 'package:haber_uygulamasi/genelHaber/model/artikel_model.dart';
import 'package:haber_uygulamasi/genelHaber/servis/haber_api.dart';

import 'package:url_launcher/url_launcher.dart';


class GenelHaberSayfa extends StatefulWidget {
  const GenelHaberSayfa({Key? key}) : super(key: key);

  @override
  State<GenelHaberSayfa> createState() => _GenelHaberSayfaState();
}

class _GenelHaberSayfaState extends State<GenelHaberSayfa> {
  List<GenelArticles> articles = [];
  @override
  void initState() {
    GenelHaberServis.getNews().then((value) {
      setState(() {
        articles = value!;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: GenelHaberServis.getNews(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                  
                   ListView.builder(
                                itemCount: articles.length,
                                itemBuilder: ((context, index) {
                                  return Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(35),
                                        side: const BorderSide(color: Colors.black)),
                                    margin:
                                        const EdgeInsets.only(top: 10, bottom: 10),
                                    child: Column(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          child: Image(
                                              image: NetworkImage(
                                                  articles[index]
                                                      .urlToImage
                                                      .toString())),
                                        ),
                                        ListTile(
                                          leading: const Icon(
                                              Icons.arrow_drop_down_circle),
                                          title: Text(
                                            articles[index].title.toString(),
                                            style: const TextStyle(fontSize: 20),
                                          ),
                                          subtitle: Text(
                                              articles[index].author.toString(),
                                              style: const TextStyle(
                                                  fontSize: 19,
                                                  color: Colors.red)),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Text(
                                            articles[index]
                                                .description
                                                .toString(),
                                            style: const TextStyle(fontSize: 18),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            ButtonBar(
                                              alignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                TextButton(
                                                    onPressed: () async {
                                                      await launchUrl(Uri.parse(
                                                          articles[index]
                                                              .url
                                                              .toString()));
                                                    },
                                                    child: const Text("Habere Git")),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(16.0),
                                              child: Text(
                                                articles[index]
                                                    .source!
                                                    .name
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 17,
                                                    color: Colors.grey),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                              )
                          
                ],
                ),
              ));
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } 
            return const Center(
              child: Text(
                "İnternetini kontrol et",
                style: TextStyle(fontSize: 30, color: Colors.red),
              ),
            );
          }),
    );
  }
}
