import 'package:flutter/material.dart';
import 'package:newsapp/src/pages/tab1_page.dart';
import 'package:newsapp/src/pages/tab2_page.dart';
import 'package:newsapp/src/services/news_service.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _PaginaActual(),
      child: const Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
      ),
    );
  }
}

class _Navegacion extends StatelessWidget {
  const _Navegacion();

  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_PaginaActual>(context);
    return BottomNavigationBar(
      currentIndex: navegacionModel.pagina,
      onTap: (value) => navegacionModel.pagina = value,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Persona',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.public),
          label: 'Encabezados',
        ),
      ],
    );
  }
}

class _Paginas extends StatelessWidget {
  const _Paginas();

  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_PaginaActual>(context);

    return PageView(
      controller: navegacionModel.pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        const Tab1Page(),
        const Tab2Page(),
      ],
    );
  }
}

class _PaginaActual extends ChangeNotifier {
  int _pagina = 0;
  int get pagina => _pagina;
  set pagina(int value) {
    _pagina = value;
    _pageController.animateToPage(value,
        duration: const Duration(milliseconds: 250), curve: Curves.bounceInOut);
    notifyListeners();
  }

  PageController _pageController = PageController();

  PageController get pageController => _pageController;
}
