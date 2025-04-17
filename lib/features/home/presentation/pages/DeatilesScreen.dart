
import 'package:fibo_ecco64/features/home/data/models/ArticleModel.dart';
import 'package:flutter/material.dart';

class Deatilesscreen extends StatelessWidget {
  ArticleModel articleModel ;
   Deatilesscreen({super.key , required this.articleModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(articleModel.urlToImage??""),
            Text(articleModel.title??""),
            Text(articleModel.description??""),
            Text(articleModel.content??"")
          ],
        ),
      ),
    );
  }
}
