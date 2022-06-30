
import 'package:flutter/material.dart';
import 'package:haber_uygulamasi/scienceHaber/scienceModel/science_articles.dart';
import 'package:haber_uygulamasi/scienceHaber/scienceService/science_service.dart';

import 'package:url_launcher/url_launcher.dart';


class ScienceHaberSayfa extends StatefulWidget {
  const ScienceHaberSayfa({Key? key}) : super(key: key);

  @override
  State<ScienceHaberSayfa> createState() => _ScienceHaberSayfaState();
}

class _ScienceHaberSayfaState extends State<ScienceHaberSayfa> {
  List<ScienceArticles> sciencearticles = [];
  @override
  void initState() {
    ScienceHaberServis.getNScience().then((value) {
      setState(() {
        sciencearticles = value!;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: ScienceHaberServis.getNScience(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                  
                   
                    Expanded(
                        flex: 15,
                        child: snapshot.connectionState == ConnectionState.done
                            ? ListView.builder(
                                itemCount:  sciencearticles.length,
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
                                                   sciencearticles[index]
                                                      .urlToImage
                                                      .toString())),
                                        ),
                                        ListTile(
                                          leading: const Icon(
                                              Icons.arrow_drop_down_circle),
                                          title: Text(
                                             sciencearticles[index].title.toString(),
                                            style: const TextStyle(fontSize: 19),
                                          ),
                                          subtitle: Text(
                                               sciencearticles[index].author.toString(),
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.red)),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Text(
                                             sciencearticles[index]
                                                .description
                                                .toString(),
                                            style: const TextStyle(fontSize: 20),
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
                                                           sciencearticles[index]
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
                                                 sciencearticles[index]
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
                            : const Text("İnternet Yok")),
                  ],
                ),
              ));
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.connectionState == ConnectionState.none) {
              return const Center(
                child: Text(
                  "İnternetini kontrol et",
                  style: TextStyle(fontSize: 30, color: Colors.red),
                ),
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
