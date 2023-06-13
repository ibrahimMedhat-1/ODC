import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_project/view/news/odc_screen/odc_screen.dart';
import 'package:odc_project/view_model/bloc/news/news_screen/news_screen_cubit.dart';
import 'package:share_plus/share_plus.dart';

class News extends StatelessWidget {
  const News({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsScreenCubit()..getData(),
      child: BlocBuilder<NewsScreenCubit, NewsScreenState>(
        builder: (context, state) {
          return BlocConsumer<NewsScreenCubit, NewsScreenState>(
            listener: (context, state) {

            },
            builder: (context, state) {
              NewsScreenCubit n = NewsScreenCubit.get(context);
              return Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  elevation: 0,
                  backgroundColor: Colors.white,
                  title: const Text(
                    'News',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                body: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ODC_Screen()));
                  },
                  child: Container(
                    color: Colors.white,
                    child: n.modelData == null
                        ? Center(child: CircularProgressIndicator())
                        : Container(
                            height: 300,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //first row
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      //text first row
                                      Text(
                                        n.modelData!.data![0].title.toString(),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 25,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      //icons
                                      Container(
                                        height: 57,
                                        decoration: BoxDecoration(
                                            color: Colors.deepOrange[400],
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          //icons
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  await Share.share(n.modelData!
                                                      .data![0].linkUrl
                                                      .toString());
                                                },
                                                child: Icon(
                                                  Icons.share_outlined,
                                                  size: 40,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Center(
                                                child: VerticalDivider(
                                                  width: 20,
                                                  thickness: 2,
                                                  indent: 0,
                                                  endIndent: 0,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () async {
                                                  await Clipboard.setData(
                                                      ClipboardData(
                                                          text: n.modelData!
                                                              .data![0].linkUrl
                                                              .toString()));
                                                  final snackBar = SnackBar(
                                                    content: const Text(
                                                      'Link Copied',
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                    backgroundColor:
                                                        (Colors.deepOrange),
                                                    action: SnackBarAction(
                                                      textColor: Colors.white,
                                                      label: 'dismiss',
                                                      onPressed: () {},
                                                    ),
                                                  );
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(snackBar);
                                                },
                                                child: Icon(
                                                  Icons.copy,
                                                  size: 40,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // orange digital center
                                n.modelData == null
                                    ? Center(child: CircularProgressIndicator())
                                    : Hero(
                                        tag: '1',
                                        child: Image.network(
                                          n.modelData!.data![0].imageUrl
                                              .toString(),
                                          height: 100,
                                          width: 1000,
                                        ),
                                      ),
                                //last text
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          n.modelData!.data![0].body.toString(),
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
