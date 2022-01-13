import 'package:flutter/material.dart';
import 'package:video_hub/chewie_list.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  var titleList = [
    "Success",
    "Motivation",
    "Hard Work",
    "Decision",
    "Confidence",
    "Business",
    "Team Work"
  ];

  var descList = [
    "Push yourself, because no one else is going to do it for you.",
    "Your limitation—it's only your imagination.",
    "Hard Work changes the life.",
    "Sometimes it's the smallest decisions that can change your life forever.",
    "Confidence is the most beautiful thing you can possess",
    "A big business starts small.",
    "Talent wins games, but teamwork and intelligence win championships."
  ];

  var imgList = [
    "https://images.unsplash.com/photo-1612528443702-f6741f70a049?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8c2FtcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1612528443702-f6741f70a049?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8c2FtcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1612528443702-f6741f70a049?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8c2FtcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1612528443702-f6741f70a049?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8c2FtcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1612528443702-f6741f70a049?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8c2FtcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1612528443702-f6741f70a049?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8c2FtcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1612528443702-f6741f70a049?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8c2FtcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    int gridAxisCount = width < 1000 ? 1 : 2;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Player'),
      ),
      body: GridView.builder(
        itemCount: titleList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: gridAxisCount,
          mainAxisExtent: 160,
        ),
        itemBuilder: (_, index) {
        return Container(
          padding: const EdgeInsets.all(10),
          height: 100,
          child: GestureDetector(
            onTap: () {
              showDialogFunc(context, Image.network(imgList[index]), titleList[index], descList[index]);
            },
            child: Container(
              color: Colors.blue.shade50,
              child: Row(
                children: [
                  SizedBox(
                    width: 160,
                    height: 120,
                    child: Image.network(imgList[index])
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          titleList[index],
                          style: const TextStyle(
                            fontSize: 25,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold
                          )
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 240,
                          child: Text(
                            descList[index],
                            maxLines: 3,
                            style: TextStyle(
                              fontSize: 15, color: Colors.grey[500]
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ),
        );
        }
      ),
    );
  }
}

showDialogFunc(context, Image img, String title, String desc) {
  return showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(15),
            height: 400,
            width: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: img
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    desc,
                    maxLines: 3,
                    style: TextStyle(fontSize: 15, color: Colors.grey[500]),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}