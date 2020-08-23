import 'package:flutter/material.dart';

const PRIMARY = "primary";
const WHITE = "white";
const SECONDARY = "secondary";
const GREY = "grey";
const Map<String, Color> myColors = {
  "primary": Color.fromRGBO(226, 115, 138, 1),
  "white": Colors.white,
  "secondary": Color.fromRGBO(247, 225, 227, 1),
  "grey": Colors.grey
};

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myAppBar(),
      backgroundColor: myColors[PRIMARY],
      body: _Body(),
    );
  }
}

Widget _myAppBar() {
  return PreferredSize(
    preferredSize: Size.fromHeight(70),
    child: AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(top: 15, left: 15),
        child: IconButton(
            icon: Icon(
              Icons.menu,
              color: myColors[PRIMARY],
              size: 30,
            ),
            onPressed: null),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 15, right: 15),
          child: IconButton(
            icon: Icon(
              Icons.search,
              color: myColors[PRIMARY],
              size: 30,
            ),
            onPressed: () => null,
          ),
        )
      ],
    ),
  );
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 7,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: myColors[WHITE],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, bottom: 30),
                  child: Text(
                    'Cosmetics that Everyone loves!',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5),
                  ),
                ),
                Expanded(
                  child: LayoutBuilder(builder:
                      (BuildContext context, BoxConstraints constraints) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _ImageTile(
                          height: constraints.maxHeight * 0.85,
                          imagePath: 'lib/screens/assets/images/makeup1.png',
                          favoriteCallback: () =>
                              print('main product added to favorites'),
                          addCallback: () => print("main product added"),
                          price: 15.00,
                        ),
                        Column(
                          children: [
                            _ImageTile(
                              height: constraints.maxHeight * 0.35,
                              imagePath:
                                  'lib/screens/assets/images/makeup2.png',
                              favoriteCallback: () =>
                                  print('second product added to favorites'),
                              addCallback: () => print('second product added'),
                              price: 75.00,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            _ImageTile(
                              height: constraints.maxHeight * 0.35,
                              imagePath:
                                  'lib/screens/assets/images/makeup3.png',
                              favoriteCallback: () =>
                                  print('third product added to favorites'),
                              addCallback: () => print('third product added'),
                              price: 55.00,
                            )
                          ],
                        ),
                      ],
                    );
                  }),
                )
              ],
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 15, top: 15, left: 40, right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recommended',
                        style: TextStyle(
                            color: myColors[WHITE],
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      InkWell(
                        onTap: () => print("recommended pressed"),
                        child: Container(
                          decoration: BoxDecoration(
                            color: myColors[WHITE],
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Icon(
                              Icons.arrow_forward,
                              size: 20,
                              color: myColors[PRIMARY],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) => Stack(
                      children: [
                        Positioned(
                          right: 20,
                          child: Container(
                            height: constraints.maxHeight * 0.8,
                            width: constraints.maxWidth * 0.75,
                            decoration: BoxDecoration(
                                color: myColors[WHITE],
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(70),
                                    topRight: Radius.circular(30),
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(25))),
                          ),
                        ),
                        Positioned(
                          right: 20,
                          child: Container(
                            height: constraints.maxHeight * 0.8,
                            width: constraints.maxWidth * 0.82,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image(
                                  image: AssetImage(
                                      'lib/screens/assets/images/makeup4.png'),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: constraints.maxWidth * 0.4,
                                      child: Text(
                                        'Multi shades many options available',
                                        style: TextStyle(color: myColors[GREY]),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                        child: Text(
                                      '\$75.00',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ))
                                  ],
                                ),
                                Column(
                                  children: [
                                    FavoriteButton(
                                        favoriteCallback: () => print(
                                            "recommended item favorited")),
                                    SizedBox(height: 20),
                                    PlusButton(
                                        addCallback: () =>
                                            print("recommended item added"))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ImageTile extends StatelessWidget {
  final double height;
  final String imagePath;
  final Function favoriteCallback;
  final Function addCallback;
  final double price;

  const _ImageTile(
      {Key key,
      @required this.height,
      @required this.imagePath,
      @required this.favoriteCallback,
      @required this.addCallback,
      @required this.price})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(height: height, image: AssetImage(imagePath)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FavoriteButton(favoriteCallback: favoriteCallback),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(
              '\$$price',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 20,
            ),
            PlusButton(addCallback: addCallback),
          ],
        )
      ],
    );
  }
}

class PlusButton extends StatelessWidget {
  const PlusButton({
    Key key,
    @required this.addCallback,
  }) : super(key: key);

  final Function addCallback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => addCallback(),
      child: Container(
        decoration: BoxDecoration(
          color: myColors[SECONDARY],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(13),
            topRight: Radius.circular(13),
            bottomLeft: Radius.circular(13),
            bottomRight: Radius.circular(25),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Icon(
            Icons.add,
            color: myColors[PRIMARY],
            size: 15,
          ),
        ),
      ),
    );
  }
}

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    Key key,
    @required this.favoriteCallback,
  }) : super(key: key);

  final Function favoriteCallback;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(
          Icons.favorite_border,
          color: myColors[PRIMARY],
        ),
        onPressed: () => favoriteCallback());
  }
}
