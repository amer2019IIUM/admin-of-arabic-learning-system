import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:siginsignup/custom_navigation_drawer.dart';
import 'package:siginsignup/shared/appbar.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SpeakingM extends StatefulWidget {
  @override
  _SpeakingMState createState() => _SpeakingMState();
}

class _SpeakingMState extends State<SpeakingM> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Wid().appbar('speaking'),
      body: StreamBuilder(
          stream: Firestore.instance.collection('speaking').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return Scrollbar(
              isAlwaysShown: true,
              child: ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width * 1,
                            height: 50,
                            decoration: BoxDecoration(color: Colors.grey[200]),
                            margin: EdgeInsets.only(top: 20, bottom: 0),
                            padding: EdgeInsets.all(1),
                            child: Center(
                              child: Text(
                                snapshot.data.documents[index]['title'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    color: Colors.black54),
                              ),
                            )),
                        YoutubePlayer(
                            controller: YoutubePlayerController(
                                initialVideoId: YoutubePlayer.convertUrlToId(
                                    snapshot.data.documents[index]['videoUrl']),
                                flags: YoutubePlayerFlags(
                                    enableCaption: false,
                                    isLive: false,
                                    autoPlay: false))),
                        Wrap(
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width * 1,
                                decoration:
                                    BoxDecoration(color: Colors.grey[200]),
                                padding: EdgeInsets.all(30),
                                child: Text(
                                  snapshot.data.documents[index]['desc'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black54),
                                )),
                          ],
                        ),
                        Container(
                            height: 30,
                            width: MediaQuery.of(context).size.width * 1,
                            decoration: BoxDecoration(color: Colors.grey[200]),

                            // decoration: BoxDecoration(color: Colors.green),
                            child: Center(
                                child: RaisedButton(
                              color: selectedColor,
                              child: Text(
                                'Download Material of the Lesson',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () async {
                                final request =
                                    await Permission.storage.request();
                                if (request.isGranted) {
                                  final storagePath =
                                      await getExternalStorageDirectory();
                                  await FlutterDownloader.enqueue(
                                      url: snapshot.data.documents[index]
                                          ['docUrl'],
                                      savedDir: storagePath.path,
                                      fileName: snapshot.data.documents[index]
                                          ['title']);
                                } else {
                                  print('Not permssion');
                                }
                              },
                            ))),
                      ],
                    ),
                  );
                },
              ),
            );
          }),
      // body: Container(
      //   padding: EdgeInsets.only(
      //     top: 10,
      //     left: 0,
      //   ),
      //   height: 700,
      //   decoration: BoxDecoration(
      //       color: Colors.white, borderRadius: BorderRadius.circular(20)),
      //   child: cards(),
      // ),
    );
  }
}
