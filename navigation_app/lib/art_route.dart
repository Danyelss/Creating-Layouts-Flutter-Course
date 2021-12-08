import 'package:flutter/material.dart';
import './art_util.dart';

class ArtRoute extends StatelessWidget {
  final String art;
  static int _currentIndex = 0;

  const ArtRoute({required this.art});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Choose your art',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: NetworkImage('http://bit.ly/fl_sky'),
                  fit: BoxFit.cover,
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
            ),
          ],
        ),
      ),
      appBar: AppBar(title: Text('Navigating art'), actions: <Widget>[
        PopupMenuButton(
          //icon: Icon(Icons.image),
          //child: Text('Change root'),
          itemBuilder: (BuildContext context) {
            return ArtUtil.menuItems.map((String item) {
              return PopupMenuItem(
                child: Text(item),
                value: item,
              );
            }).toList();
          },
          onSelected: (String value) => changeRoute(context, value),
        ),
      ]),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(art),
            fit: BoxFit.cover,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blueAccent[900],
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            label: ArtUtil.CARAVAGGIO,
            icon: Icon(Icons.art_track_rounded),
          ),
          BottomNavigationBarItem(
            label: ArtUtil.MONET,
            icon: Icon(Icons.art_track_rounded),
          ),
          BottomNavigationBarItem(
            label: ArtUtil.VANGOGH,
            icon: Icon(Icons.art_track_rounded),
          ),
        ],
        onTap: (value) {
          String _artist = ArtUtil.menuItems[value];
          _currentIndex = value;
          changeRoute(context, _artist);
        },
      ),
    );
  }

  void changeRoute(BuildContext context, String menuItem) {
    String image = ArtUtil.IMG_VANGOGH;
    switch (menuItem) {
      case ArtUtil.CARAVAGGIO:
        {
          image = ArtUtil.IMG_CARAVAGIO;
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
        builder: (context) => ArtRoute(
          art: image,
        ),
      ),
    );
  }
}
