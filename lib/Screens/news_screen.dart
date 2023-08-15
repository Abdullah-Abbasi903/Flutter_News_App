import 'package:flutter/material.dart';
class NewsScreen extends StatefulWidget {
  final String img;
  final String description;
  final String author;
  final String title;

  const NewsScreen({super.key, required this.img, required this.description, required this.author, required this.title});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
           children: [
            Container(
                 height: MediaQuery.of(context).size.height * 0.4,
                 width: MediaQuery.of(context).size.width,
                 decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.green,
                  image: const DecorationImage(
                    image: NetworkImage("url"), fit: BoxFit.fill 
                    )
                 ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container (
                   height: MediaQuery.of(context).size.height * 0.8,
                   width: MediaQuery.of(context).size.width,
                   decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(8),
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                   ),
                   child: const Padding(
                     padding: EdgeInsets.all(8.0),
                     child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Author name", style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Title", style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),),
                        ),
                         Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Description", style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),),
                        ),
                        SizedBox(
                          height: 100,
                        ),
                        Row (
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              Icon(Icons.favorite, size: 20, color: Colors.red),
                              Padding(
                                padding: EdgeInsets.only(left: 18.0),
                                child: Icon(Icons.share, size: 20, color: Colors.red),
                              )
                          ],
                          )
                      ],
                      ),
                   ),
                  ),
            )
           ],
          ),
        ),
      ),
    );
  }
}