import 'package:flutter/cupertino.dart';
import 'package:newsapp/src/models/news_models.dart';
import 'package:newsapp/src/widgets/noticia.dart';

class ListaNoticias extends StatelessWidget {
  final List<Article> noticias;
  const ListaNoticias({super.key, required this.noticias});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: noticias.length,
      itemBuilder: (BuildContext context, int index) {
        return Noticia(
          index: index,
          noticia: noticias[index],
        );
      },
    );
  }
}
