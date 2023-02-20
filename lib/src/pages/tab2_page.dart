import 'package:flutter/material.dart';
import 'package:newsapp/src/models/category_model.dart';
import 'package:newsapp/src/services/news_service.dart';
import 'package:newsapp/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  const Tab2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          const _ListCategory(),
          Expanded(
              child: ListaNoticias(
                  noticias:
                      newsService.getArticulosCategoriaSeleccionada ?? []))
        ],
      )),
    );
  }
}

class _ListCategory extends StatelessWidget {
  const _ListCategory();

  @override
  Widget build(BuildContext context) {
    final newsServices = Provider.of<NewsService>(context);

    return SizedBox(
      width: double.infinity,
      height: 78,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: newsServices.categories.length,
        itemBuilder: (context, index) {
          return SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  _CategoryButton(categoria: newsServices.categories[index]),
                  const SizedBox(height: 5),
                  Text(
                    '${newsServices.categories[index].name[0].toUpperCase()}${newsServices.categories[index].name.substring(1)}',
                    style: TextStyle(
                        color: newsServices.selectedCategory ==
                                newsServices.categories[index].name
                            ? Colors.red
                            : Colors.white),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  const _CategoryButton({
    required this.categoria,
  });

  final Category categoria;

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    return GestureDetector(
      onTap: () {
        final newsService = Provider.of<NewsService>(context, listen: false);
        newsService.selectedCategory = categoria.name;
      },
      child: Container(
          width: 40,
          height: 40,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          child: Icon(
            categoria.icon,
            color: newsService.selectedCategory == categoria.name
                ? Colors.red
                : Colors.black54,
          )),
    );
  }
}
