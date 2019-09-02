import 'package:flutter/material.dart';
import 'art_util.dart';

class ArtRoute extends StatelessWidget {
  ArtRoute({@required this.art});

  final String art;

  static int _currentIndex = 0;

  void changeRoute(BuildContext context, String menuItem) {
    String image;
    switch (menuItem) {
      case ArtUtil.CARAVAGGIO:
        {
          image = ArtUtil.IMG_CARAVAGGIO;
          break;
        }
      case ArtUtil.MONET:
        {
          image = ArtUtil.IMG_MONET;
          break;
        }
      case ArtUtil.VANGOGH:
        {
          image = ArtUtil.IMG_VANGOGH;
          break;
        }
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ArtRoute(art: image),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Center(
                child: Text(
                  'Choose your art',
                  style: TextStyle(fontSize: 24.0, color: Colors.white),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.yellow,
                image: DecorationImage(
                  image: NetworkImage('https://bit.ly/fl_sky'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            ListTile(
              title: Text(ArtUtil.CARAVAGGIO),
              trailing: Icon(Icons.art_track),
              onTap: () => changeRoute(context, ArtUtil.CARAVAGGIO),
            ),
            ListTile(
              title: Text(ArtUtil.MONET),
              trailing: Icon(Icons.art_track),
              onTap: () => changeRoute(context, ArtUtil.MONET),
            ),
            ListTile(
              title: Text(ArtUtil.VANGOGH),
              trailing: Icon(Icons.art_track),
              onTap: () => changeRoute(context, ArtUtil.VANGOGH),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Navigation Art"),
        actions: <Widget>[
          PopupMenuButton(
            //icon: Icon(Icons.image),
            itemBuilder: (BuildContext context) => ArtUtil.menuItems
                .map(
                  (String item) => PopupMenuItem(
                    child: Text(item),
                    value: item,
                  ),
                )
                .toList(),
            onSelected: (value) => changeRoute(context, value),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(art),
            fit: BoxFit.cover,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.lime[900],
        currentIndex: _currentIndex,
        onTap: (value) {
          String _artist = ArtUtil.menuItems[value];
          _currentIndex = value;
          changeRoute(context, _artist);
        },
        items: [
          BottomNavigationBarItem(
            title: Text(
              ArtUtil.CARAVAGGIO,
            ),
            icon: Icon(Icons.art_track),
          ),
          BottomNavigationBarItem(
            title: Text(
              ArtUtil.MONET,
            ),
            icon: Icon(Icons.art_track),
          ),
          BottomNavigationBarItem(
            title: Text(
              ArtUtil.VANGOGH,
            ),
            icon: Icon(Icons.art_track),
          )
        ],
      ),
    );
  }
}
