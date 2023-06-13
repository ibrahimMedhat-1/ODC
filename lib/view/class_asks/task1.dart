import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  Color color = Colors.grey;
  Color color2 = Colors.grey;
  // Video video = Video();
  List<Video> videos = [];
  String? vName;
  String? vLink;
  String? vCategory;
  String? vLength;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Dart Testing',
          style: TextStyle(
            fontSize: 30,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            //screen
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(20),
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[300]),
                child: SingleChildScrollView(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: videos.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Text(videos[index].videoName),
                          Text(videos[index].videoLength),
                          Text(videos[index].videoLink),
                          Text(videos[index].videoCategory),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            //category
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //text form category
                  Expanded(
                    child: Container(
                      child: Focus(
                        onFocusChange: (s) {
                          if (s) {
                            color2 = Colors.black;
                            setState(() {});
                          } else {
                            color2 = Colors.grey;
                            setState(() {});
                          }
                        },
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter Category',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: color2,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: color2)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  //space
                  SizedBox(
                    width: 10,
                  ),
                  //button
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: MaterialButton(
                      onPressed: () {},
                      child: Text(
                        'Print Category',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //seconds
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //text form seconds
                  Expanded(
                    child: Container(
                      child: Focus(
                        onFocusChange: (s) {
                          if (s == true) {
                            color = Colors.black;
                            setState(() {});
                          } else {
                            color = Colors.grey;
                            setState(() {});
                          }
                        },
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: 'Enter Seconds',
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: color,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: color),
                                borderRadius: BorderRadius.circular(
                                  20,
                                ),
                              )),
                        ),
                      ),
                    ),
                  ),
                  //space
                  SizedBox(
                    width: 10,
                  ),
                  //button
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: MaterialButton(
                      onPressed: () {},
                      child: Text(
                        'Print Preferred',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            //space
            SizedBox(
              height: 20,
            ),
            //print all button
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 10, 20, 10),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black),
                child: MaterialButton(
                  onPressed: () {},
                  // videos = video.videos;
                  // print(videos.length);
                  child: Text(
                    'Print All',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black),
                child: MaterialButton(
                  onPressed: () {
                    videos.add(
                      Video(
                        videoLength: '18:37',
                        videoCategory: 'b',
                        videoLink: 'www.com',
                        videoName: 'ibrahim',
                      ),
                    );
                    setState(() {});
                  },
                  child: Text(
                    'ADD',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Video {
  var videoName;
  var videoLink;
  var videoCategory;
  var videoLength;

  Video({this.videoCategory, this.videoLink, this.videoLength, this.videoName});

  //videos list
  // List<Video> videos = [
  //   Video(
  //       videoName: 'ibrahim',
  //       videoLink: 'www.hema.com',
  //       videoCategory: 'A',
  //       videoLength: '13:86'),
  // ];

  //Recommended Videos By Seconds
  List<int> seconds = [];

  //everything to string
  // String toString() {
  //   return ('Video Name: ${videoName.toString()}'
  //       'Video Link: ${videoLink.toString()}'
  //       'Video Category: ${videoCategory.toString()}'
  //       'Video Length: ${videoLength.toString()}');
  // }

  //minutes to seconds
  int lengthToSeconds() {
    videoLength.toString();
    var minutes = int.parse('${videoLength.split(':')[0]}') * 60 +
        int.parse('${videoLength.split(':')[1]}');

    return minutes;
  }

// Print All Videos
//   void printAll() {
//     videos.forEach((e) {
//       print(e.toString());
//       print('--------------------');
//     });
//   }

//  //Print Same Categories
//   void printCat(String cat) {
//     videos.forEach((e) {
//       if (e.videoCategory == cat.toUpperCase()) {
//         print(e.toString());
//       }
//     });
//   }

  //gets best 3 videos close to seconds
  // void preferredVideos(int sec) {
  //   videos.forEach((video) {
  //     seconds.add(video.lengthToSeconds());
  //   });
  //
  //   videos.forEach((e) {
  //     if (e.lengthToSeconds() + 3 <= sec && e.lengthToSeconds() - 3 >= sec) {
  //       print(e.toString());
  //     }
  //   });
  // }

//add a new video
  void newVideo({
    required vName,
    required vLink,
    required vCategory,
    required vLength,
  }) {
     Video(
      videoName: vName,
      videoLink: vLink,
      videoCategory: vCategory,
      videoLength: vLength,
    );
  }

// void reduce() {
//   int minimum = seconds.reduce(min);
//   x = minimum;
// }

}
