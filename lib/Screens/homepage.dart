// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:news_app/Screens/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);

    double height = 50;
    double width = 50;
    double height1 = 50;
    double width1 = 50;
    Color color = Colors.transparent;
    Color border_color = Colors.white;
    final List<String> navBarItem = [
      "Top news",
      "Pakistan",
      "World",
      "Sports",
      "Health",
      "Jokes",
    ];

    List<Map<String, dynamic>> listResponse = []; // Initialize with actual data

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.red),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.notifications),
          )
        ],
        title: const Center(child: Text("News App", style: TextStyle(color: Colors.red, fontSize: 25))),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  height: height1,
                  width: width1,
                  child: const Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Breaking News", style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic)),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                    border: Border.all(color: border_color, width: 0.0),
                    borderRadius: BorderRadius.circular(10),
                    color: color,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            height = 50.0;
                              width = 370;
                              color =  Colors.white; 
                              border_color = Colors.black;
                              height1 = 0.0;
                              width1 = 0.0;
                          },
                          onDoubleTap: () {
                            height = 50.0;
                               width = 50;
                               color = color; 
                               border_color = Colors.white;
                               height1 = 50;
                               width1 =300;
                          },
                          child: const Icon(Icons.search),
                        ),
                        const Expanded(
                          child: TextField(
                            textInputAction: TextInputAction.search,
                            decoration: InputDecoration(border: InputBorder.none),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: navBarItem.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () { },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadiusDirectional.circular(10),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: Text(navBarItem[index], style: const TextStyle(color: Colors.red))),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(8),
                color: Colors.amber,
                image: const DecorationImage(
                  image: NetworkImage('https://media.wired.com/photos/64d6a15ec3f2cf2daf39fcfe/191:100/w_1280,c_limit/How-to-Find-a-Home-or-Apartment-in-a-City-You-Dont-Live-In-Gear-GettyImages-1390003407.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width * 0.9,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: listResponse.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 0.5),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: NetworkImage(listResponse[index]['urlToImage']),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 20),
                                      child: RichText(
                                        overflow: TextOverflow.ellipsis,
                                        text: TextSpan(
                                          text: listResponse[index]['description'],
                                          style: const TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 28.0, left: 10.0),
                                      child: Row(
                                        children: [
                                          Text("Source", style: TextStyle(fontSize: 12)),
                                          Text("BBC", style: TextStyle(fontSize: 12)),
                                          Text("29 mins ago", style: TextStyle(fontSize: 12)),
                                          SizedBox(height: 10),
                                          Icon(Icons.favorite, size: 12, color: Colors.red),
                                          Padding(
                                            padding: EdgeInsets.only(left: 8.0),
                                            child: Icon(Icons.share, size: 12, color: Colors.red),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => newsProvider.fetchNews(),
              child: const Text("Fetch News"),
            ),
          ],
        ),
      ),
    );
  }
}