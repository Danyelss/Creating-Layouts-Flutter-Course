import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView',
      home: Scaffold(
        appBar: AppBar(
          title: Text('ListView'),
        ),
        backgroundColor: Colors.indigo[100],
        body: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeX = MediaQuery.of(context).size.width;
    final sizeY = MediaQuery.of(context).size.height;
    return Container(
      width: sizeX,
      height: sizeY,
      child: GridView.count(
        scrollDirection: Axis.vertical,
        crossAxisCount: 2,
        children: createGallery(50),
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 5.0,
        padding: EdgeInsets.all(5),

        /*ListView(
        children: showContacts(),
        .separated(
        itemCount: 25,
        itemBuilder: (context, index) => createSquare(index),
        separatorBuilder: (context, index) => createSeparator(index),
        scrollDirection: Axis.vertical,*/
      ),
    );
  }

  List<Widget> createSquares(int numSquares) {
    int i = 0;
    List colors = [
      Colors.amber,
      Colors.deepPurple,
      Colors.deepOrange,
      Colors.indigo,
      Colors.lightBlue
    ];
    List<Widget> squares = [];
    squares.add(Container(color: Colors.black));
    while (i < numSquares) {
      Container square = Container(
        color: colors[i % 5],
        width: 100,
        height: 100,
        child: Text(i.toString()),
        //)
      );
      i++;
      squares.add(square);
    }
    return squares;
  }

  Widget createSquare(int position) {
    List colors = [
      Colors.amber,
      Colors.deepPurple,
      Colors.deepOrange,
      Colors.indigo,
      Colors.lightBlue
    ];
    Container square = Container(
      color: colors[position % 5],
      width: 100,
      height: 100,
      child: Text(position.toString()),
      //)
    );

    return square;
  }

  Widget createSeparator(int position) {
    Widget separator = Container(
      height: 15,
      color: Colors.black,
    );

    return separator;
  }

  List<Widget> showPizzaLayout(double sizeX, double sizeY) {
    List<Widget> layoutChildren = [];

    Container backGround = Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: NetworkImage('http://bit.ly/pizzaimage'),
        fit: BoxFit.fitHeight,
      )),
    );
    layoutChildren.add(backGround);

    Positioned pizzaCard = Positioned(
      top: sizeY / 20,
      left: sizeX / 20,
      child: Card(
        elevation: 12,
        color: Colors.white70,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              "Pizza Margherita",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange[800]),
            ),
            Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  'This delicios pizza is made of Tomato, \nMozzarella and Basil. \n\n Seriosly you can\'t miss it',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[800],
                  ),
                ))
          ],
        ),
      ),
    );

    layoutChildren.add(pizzaCard);

    Positioned buttonOrder = Positioned(
      bottom: sizeY / 20,
      left: sizeX / 20,
      width: sizeX - sizeX / 10,
      child: ElevatedButton(
        child: Text(
          'Order Now!',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          elevation: 12,
          //color: Colors.orange[900],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () {},
      ),
    );

    layoutChildren.add(buttonOrder);

    return layoutChildren;
  }

  List<Contact> buildContacts() {
    List<Contact> contacts = [];
    contacts
        .add(Contact('Beni Tiger', 'The Pocales', Icons.sentiment_satisfied));
    contacts.add(Contact('Cosmin Gop', 'CEO', Icons.sentiment_neutral));
    contacts
        .add(Contact('Naula Pelly', 'Pimonca', Icons.sentiment_dissatisfied));
    contacts
        .add(Contact('Weeknd', 'RedPills', Icons.sentiment_very_dissatisfied));
    contacts
        .add(Contact('Dulap', 'Tot se potti', Icons.sentiment_very_satisfied));

    return contacts;
  }

  List<ListTile> showContacts() {
    List<Contact> contacts = buildContacts();
    for (int i = 0; i < 20; i++) {
      contacts.addAll(buildContacts());
    }

    List<ListTile> list = [];
    contacts.forEach((contact) {
      list.add(ListTile(
        title: Text(contact.name),
        subtitle: Text(contact.subtitle),
        leading: CircleAvatar(
          child: Icon(contact.icon),
          backgroundColor: Colors.blueGrey[600],
        ),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () => true,
      ));
    });

    return list;
  }

  List<Widget> createGallery(int numImages) {
    List<Widget> images = [];
    List<String> urls = [];
    urls.add('http://bit.ly/gvcar_1');
    urls.add('http://bit.ly/gvcar_2');
    urls.add('http://bit.ly/gvcar_3');
    urls.add('http://bit.ly/gvcar_4');
    urls.add('http://bit.ly/gvcar_5');

    Widget image;
    int i = 0;
    while (i < numImages) {
      image = Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(urls[i % 5]),
          ),
        ),
        //child: Image.network(urls[i % 5]),
      );
      images.add(image);
      i++;
    }

    return images;
  }
}

class Contact {
  String name;
  String subtitle;
  IconData icon;
  Contact(this.name, this.subtitle, this.icon);
}

/*
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeX = MediaQuery.of(context).size.width;
    final sizeY = MediaQuery.of(context).size.height;
    return Container(
        width: sizeX,
        height: sizeY,
        child: Stack(
          //verticalDirection: VerticalDirection.up,
          // textDirection: TextDirection.rtl,
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: createSquares(5),
        ));
  }

  List<Widget> createSquares(int numSquares) {
    int i = 0;
    List colors = [
      Colors.amber,
      Colors.deepPurple,
      Colors.deepOrange,
      Colors.indigo,
      Colors.lightBlue
    ];
    List<Widget> squares = [];

    while (i < numSquares) {
      Container square = //Expanded(
          //flex: i,
          //child:
          Container(
        color: colors[i],
        //width: 60,
        height: 60,
        child: Text(i.toString()),
        //)
      );
      i++;
      squares.add(square);
    }
    return squares;
  }
}
*/