import 'package:appwicom/componentes/Drawer.dart';
import 'package:appwicom/wicom_iconos_icons.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  MainScreenLoad createState() => MainScreenLoad();
}

class MainScreenLoad extends State<MainScreen> {
  List<String> imgList = [
    "https://images-na.ssl-images-amazon.com/images/I/61OTujDXS3L._AC_UY1000_.jpg",
    "https://www.lidl.es/media/product/0/0/0/0/5/3/1/chaqueta-de-trekking-hombre-zoom--12.jpg"
  ];
  List<String> imgList2 = [
    "https://image.dhgate.com/0x0s/f2-albu-g6-M00-E6-00-rBVaR1u5xSeAOvcWAAP_SLDB8DE401.jpg/ocasi-n-vestido-de-c-ctel-vestido-de-noche.jpg",
    "https://i.pinimg.com/originals/bc/4a/31/bc4a312a70296a4de0b8e4997d56531f.jpg",
    "https://definicion.de/wp-content/uploads/2009/01/abrigo.jpg"
  ];
  int indexactual = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> imageSliders = imgList
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.network(item, fit: BoxFit.cover, width: 1000.0),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Text(
                              'No. ${imgList.indexOf(item)} image',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList();
    return Scaffold(
        endDrawer: DrawerWicom(),
        appBar: AppBar(
            title: Text("Publicaciones"),
            centerTitle: true,
            leading: new Container(
              child: Icon(Icons.face),
            )),
        body: SingleChildScrollView(
            child: Column(children: [
          Card(
              elevation: 10,
              shadowColor: Colors.black,
              margin: const EdgeInsets.only(
                  top: 10.0, bottom: 10, left: 5, right: 5),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(children: [
                    InkWell(
                        child: Container(
                            height: MediaQuery.of(context).orientation ==
                                    Orientation.portrait
                                ? MediaQuery.of(context).size.height * 0.2
                                : MediaQuery.of(context).size.height * 0.4,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: Image.network(
                                        "https://images-na.ssl-images-amazon.com/images/I/61OTujDXS3L._AC_UY1000_.jpg"),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      child: Image.network(
                                          "https://www.lidl.es/media/product/0/0/0/0/5/3/1/chaqueta-de-trekking-hombre-zoom--12.jpg")),
                                )
                              ],
                            )),
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: Stack(
                                    alignment: Alignment.topCenter,
                                    overflow: Overflow.visible,
                                    children: <Widget>[
                                      Positioned(
                                        right: -40.0,
                                        top: -40.0,
                                        child: InkResponse(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: CircleAvatar(
                                            child: Icon(Icons.close,
                                                color: Colors.white),
                                            backgroundColor: Colors.red,
                                          ),
                                        ),
                                      ),
                                      //Column(mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,children: [
                                      Container(
                                          width: MediaQuery.of(context)
                                                      .orientation ==
                                                  Orientation.portrait
                                              ? MediaQuery.of(context)
                                                  .size
                                                  .width
                                              : MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.6,
                                          height: MediaQuery.of(context)
                                                      .orientation ==
                                                  Orientation.portrait
                                              ? MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.5
                                              : MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.6,
                                          child: CarouselSlider(
                                            options: CarouselOptions(
                                              height: MediaQuery.of(context)
                                                          .orientation ==
                                                      Orientation.portrait
                                                  ? MediaQuery.of(context)
                                                      .size
                                                      .height
                                                  : MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.6,
                                              aspectRatio: 2.0,
                                              viewportFraction: 1.0,
                                              enlargeCenterPage: false,
                                              enableInfiniteScroll: false,
                                              pageViewKey:
                                                  PageStorageKey<String>(
                                                      'carousel_slider'),
                                            ),
                                            items: imgList
                                                .map((item) => Container(
                                                      //height:  200,
                                                      child: Center(
                                                          child: Image.network(
                                                        item,
                                                        height: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .height,
                                                      )),
                                                    ))
                                                .toList(),
                                          )),
                                      //],)

                                      Positioned(
                                          //right: -40.0,
                                          bottom: MediaQuery.of(context)
                                                      .orientation ==
                                                  Orientation.portrait
                                              ? MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.05
                                              : -MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.05,
                                          child: InkResponse(
                                            onTap: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: CircleAvatar(
                                              child: Icon(
                                                  WicomIconos.iconocalificar,
                                                  color: Colors.purple),
                                              backgroundColor: Colors.white,
                                            ),
                                          ))
                                    ],
                                  ),
                                );
                              });
                        }),
                    InkWell(
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text("Ropa,moda,más/Hombre",
                                style: TextStyle(fontSize: 20))))
                  ]))),
          Card(
              elevation: 10,
              shadowColor: Colors.black,
              margin: const EdgeInsets.only(
                  top: 10.0, bottom: 10, left: 5, right: 5),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(children: [
                    InkWell(
                        child: Container(
                            height: MediaQuery.of(context).orientation ==
                                    Orientation.portrait
                                ? MediaQuery.of(context).size.height * 0.2
                                : MediaQuery.of(context).size.height * 0.4,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: Image.network(
                                        "https://images-na.ssl-images-amazon.com/images/I/61OTujDXS3L._AC_UY1000_.jpg"),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      child: Image.network(
                                          "https://www.lidl.es/media/product/0/0/0/0/5/3/1/chaqueta-de-trekking-hombre-zoom--12.jpg")),
                                )
                              ],
                            )),
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: Stack(
                                    alignment: Alignment.topCenter,
                                    overflow: Overflow.visible,
                                    children: <Widget>[
                                      Positioned(
                                        right: -40.0,
                                        top: -40.0,
                                        child: InkResponse(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: CircleAvatar(
                                            child: Icon(Icons.close,
                                                color: Colors.white),
                                            backgroundColor: Colors.red,
                                          ),
                                        ),
                                      ),
                                      //Column(mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,children: [
                                      Container(
                                          width: MediaQuery.of(context)
                                                      .orientation ==
                                                  Orientation.portrait
                                              ? MediaQuery.of(context)
                                                  .size
                                                  .width
                                              : MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.6,
                                          height: MediaQuery.of(context)
                                                      .orientation ==
                                                  Orientation.portrait
                                              ? MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.5
                                              : MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.6,
                                          child: CarouselSlider(
                                            options: CarouselOptions(
                                              height: MediaQuery.of(context)
                                                          .orientation ==
                                                      Orientation.portrait
                                                  ? MediaQuery.of(context)
                                                      .size
                                                      .height
                                                  : MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.6,
                                              aspectRatio: 2.0,
                                              viewportFraction: 1.0,
                                              enlargeCenterPage: false,
                                              enableInfiniteScroll: false,
                                              pageViewKey:
                                                  PageStorageKey<String>(
                                                      'carousel_slider'),
                                            ),
                                            items: imgList
                                                .map((item) => Container(
                                                      //height:  200,
                                                      child: Center(
                                                          child: Image.network(
                                                        item,
                                                        height: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .height,
                                                      )),
                                                    ))
                                                .toList(),
                                          )),
                                      //],)

                                      Positioned(
                                          //right: -40.0,
                                          bottom: MediaQuery.of(context)
                                                      .orientation ==
                                                  Orientation.portrait
                                              ? MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.05
                                              : -MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.05,
                                          child: InkResponse(
                                            onTap: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: CircleAvatar(
                                              child: Icon(
                                                  WicomIconos.iconocalificar,
                                                  color: Colors.purple),
                                              backgroundColor: Colors.white,
                                            ),
                                          ))
                                    ],
                                  ),
                                );
                              });
                        }),
                    InkWell(
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text("Ropa,moda,más/Hombre",
                                style: TextStyle(fontSize: 20))))
                  ]))),
          Card(
              elevation: 10,
              shadowColor: Colors.black,
              margin: const EdgeInsets.only(
                  top: 10.0, bottom: 10, left: 5, right: 5),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(children: [
                    InkWell(
                        child: Container(
                            height: MediaQuery.of(context).orientation ==
                                    Orientation.portrait
                                ? MediaQuery.of(context).size.height * 0.2
                                : MediaQuery.of(context).size.height * 0.4,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.25,
                                    child: Image.network(
                                        "https://image.dhgate.com/0x0s/f2-albu-g6-M00-E6-00-rBVaR1u5xSeAOvcWAAP_SLDB8DE401.jpg/ocasi-n-vestido-de-c-ctel-vestido-de-noche.jpg"),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.25,
                                      child: Image.network(
                                          "https://i.pinimg.com/originals/bc/4a/31/bc4a312a70296a4de0b8e4997d56531f.jpg")),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.25,
                                      child: Image.network(
                                          "https://definicion.de/wp-content/uploads/2009/01/abrigo.jpg")),
                                )
                              ],
                            )),
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: Stack(
                                    alignment: Alignment.topCenter,
                                    overflow: Overflow.visible,
                                    children: <Widget>[
                                      Positioned(
                                        right: -40.0,
                                        top: -40.0,
                                        child: InkResponse(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: CircleAvatar(
                                            child: Icon(Icons.close,
                                                color: Colors.white),
                                            backgroundColor: Colors.red,
                                          ),
                                        ),
                                      ),
                                      //Column(mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,children: [
                                      Container(
                                          width: MediaQuery.of(context)
                                                      .orientation ==
                                                  Orientation.portrait
                                              ? MediaQuery.of(context)
                                                  .size
                                                  .width
                                              : MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.6,
                                          height: MediaQuery.of(context)
                                                      .orientation ==
                                                  Orientation.portrait
                                              ? MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.5
                                              : MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.6,
                                          child: CarouselSlider(
                                            options: CarouselOptions(
                                              height: MediaQuery.of(context)
                                                          .orientation ==
                                                      Orientation.portrait
                                                  ? MediaQuery.of(context)
                                                      .size
                                                      .height
                                                  : MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.6,
                                              aspectRatio: 2.0,
                                              viewportFraction: 1.0,
                                              enlargeCenterPage: false,
                                              enableInfiniteScroll: false,
                                              pageViewKey:
                                                  PageStorageKey<String>(
                                                      'carousel_slider'),
                                            ),
                                            items: imgList2
                                                .map((item) => Container(
                                                      //height:  200,
                                                      child: Center(
                                                          child: Image.network(
                                                        item,
                                                        height: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .height,
                                                      )),
                                                    ))
                                                .toList(),
                                          )),
                                      //],)

                                      Positioned(
                                          //right: -40.0,
                                          bottom: MediaQuery.of(context)
                                                      .orientation ==
                                                  Orientation.portrait
                                              ? MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.05
                                              : -MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.05,
                                          child: InkResponse(
                                            onTap: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: CircleAvatar(
                                              child: Icon(
                                                  WicomIconos.iconocalificar,
                                                  color: Colors.purple),
                                              backgroundColor: Colors.white,
                                            ),
                                          ))
                                    ],
                                  ),
                                );
                              });
                        }),
                    InkWell(
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text("Ropa,moda,más/Mujer",
                                style: TextStyle(fontSize: 20))))
                  ]))),
        ])),
        bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                ),
              ],
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: indexactual,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(WicomIconos.iconohome),
                    title: Text("Inicio"),
                    backgroundColor: Colors.red),
                BottomNavigationBarItem(
                    icon: Icon(WicomIconos.icono),
                    title: Text("Publicar"),
                    backgroundColor: Colors.purple),
                BottomNavigationBarItem(
                    icon: Icon(WicomIconos.iconolupa),
                    title: Text("Buscar"),
                    backgroundColor: Colors.blue),
              ],
              onTap: (index) {
                setState(() {
                  indexactual = index;
                });
              },
            )));
  }
}
