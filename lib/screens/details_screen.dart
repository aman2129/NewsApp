import 'package:flutter/material.dart';
import 'package:grevity/models/article_model.dart';
import 'package:grevity/userInterface/appbar_ui.dart';

class DetailsScreen extends StatelessWidget {
  final ArticleModel articleModel;

  const DetailsScreen({required this.articleModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: BackButtonUi(),
      ),
      body: SizedBox(
        child: Stack(
          children: [
            Container(
              foregroundDecoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    articleModel.urlToImage ??
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbaHFyQDsPWWaEg0JGuveA2QupO9fgqsVvPQ&usqp=CAU',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black,
                    Colors.black12,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 25,
              right: 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    articleModel.description ?? 'description',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 4,
                  ),
                  Text(
                    '- ${articleModel.source}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 45.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 80.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        articleModel.source ?? 'source',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        articleModel.publishedAt?.substring(0, 10) ?? 'date',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    articleModel.description ?? 'description',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 5,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
