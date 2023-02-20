import 'package:flutter/material.dart';
import 'package:newsapp/src/models/news_models.dart';

class Noticia extends StatelessWidget {
  final Article noticia;
  final int index;
  const Noticia({super.key, required this.noticia, required this.index});

  @override
  Widget build(BuildContext context) {
    print(noticia.urlToImage);
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          margin: const EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              Text(
                '${index + 1}.',
                style: const TextStyle(
                  color: Colors.red,
                ),
              ),
              Text('${noticia.source.name}')
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            noticia.title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
            child: Container(
                child: noticia.urlToImage != null
                    ? FadeInImage(
                        placeholder: const AssetImage('asset/giphy.gif'),
                        image: NetworkImage(noticia.urlToImage!))
                    : const Image(image: AssetImage('asset/no-image.png'))),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 6),
          child: Text(noticia.description != null ? noticia.description! : ''),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RawMaterialButton(
                onPressed: () {},
                fillColor: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: const Icon(Icons.star_border_outlined),
              ),
              const SizedBox(width: 8),
              RawMaterialButton(
                onPressed: () {},
                fillColor: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: const Icon(Icons.more),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        const Divider()
      ],
    );
  }
}
