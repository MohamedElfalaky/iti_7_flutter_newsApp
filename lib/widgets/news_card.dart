import 'package:flutter/material.dart';
import 'package:iti_summer_7_newsapp/data/models/get_news_model.dart';

class NewsCard extends StatelessWidget {
  final Article article;
  const NewsCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      margin: EdgeInsetsDirectional.only(end: 16),
      height: 240,
      width: 321,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff62626259).withOpacity(0.35), Colors.black],
          ),
          image: DecorationImage(
              opacity: 0.8,
              fit: BoxFit.cover,
              image: NetworkImage(article.urlToImage ?? "")),
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 80,
          ),
          Text(
            article.author ?? "",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10),
            maxLines: 1,
          ),
          Text(
            article.content ?? "",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ),
          SizedBox(
            height: 23,
          ),
          Text(
            article.description ?? "",
            style: TextStyle(color: Colors.white, fontSize: 10),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
