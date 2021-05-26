import 'package:afriweb/models/appdata_model.dart';
import 'package:afriweb/widgets/cart_item_widget.dart';
import 'package:afriweb/widgets/footer_widget.dart';
import 'package:afriweb/widgets/home_carousel_widget.dart';
import 'package:afriweb/widgets/navbar_item_widget.dart';
import 'package:badges/badges.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dart:html' as html;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //variables
  final ScrollController _scrollController = new ScrollController();
  double position = 0;
  int selectedItemIndex = 0;
  bool isLogin = false;

  bool _isObscure =true;
  //final RoundedLoadingButtonController _btnController = RoundedLoadingButtonController();
  final _textEmail = TextEditingController();
  final _textPass = TextEditingController();

  Future<void> _showSearch() async {
    await showSearch(
      context: context,
      delegate: Search(),
      query: "any query",
    );
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: _buildAppBar(),
      body: _customBody(),
      floatingActionButton: position > 180 ? FloatingActionButton(
        onPressed: () {
          _scrollController.animateTo(
            0.0,
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 300),
          );
        },
        tooltip: 'Back to top',
        child: Icon(Icons.arrow_upward_rounded),
      ) : null,

      bottomNavigationBar: queryData.size.width >= 1000
          ? null
          : new Theme(
              data: Theme.of(context).copyWith(
                  // sets the background color of the `BottomNavigationBar`
                  canvasColor: Colors.white,
                  // sets the active color of the `BottomNavigationBar` if `Brightness` is light
                  primaryColor: Colors.green[900],
                  textTheme: Theme.of(context).textTheme.copyWith(
                      caption: new TextStyle(
                          color: Colors.green[
                              900]))), // sets the inactive color of the `BottomNavigationBar`
              child: new BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: _getCurrentIndex(),
                items: [
                  new BottomNavigationBarItem(
                      icon: new Icon(Icons.home),
                      title: new Text("Accueil"),
                      tooltip: 'accueil'),
                  new BottomNavigationBarItem(
                      icon: new Icon(Icons.account_circle_rounded),
                      title: new Text("Mon afribio"),
                      tooltip: 'mon compte afribio'),
                  new BottomNavigationBarItem(
                      icon: new Badge(
                        badgeContent: Text(
                          "0",
                          style: TextStyle(color: Colors.white),
                        ),
                        position: BadgePosition.topEnd(top: 0, end: -8),
                        child: Icon(Icons.shopping_basket_outlined),
                      ),
                      title: new Text("Panier"),
                      tooltip: 'mon Panier'),
                ],
                onTap: (index){
                  setState(() {
                    selectedItemIndex = index;
                    Provider.of<AppDataModel>(context, listen: false).updateSelectedIndex(index);
                  });
                },
              ),
            ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future<Null> refresh() async {
    await Future.delayed(Duration(seconds: 8));
    html.window.location.reload();
    return null;
  }

  Widget _customBody() {
    return RefreshIndicator(
      onRefresh: refresh,
      child: NotificationListener(
        onNotification: (n){
          if(n is ScrollEndNotification){
            setState(() {
              position = _scrollController.position.pixels;
            });
          }
        },
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          scrollDirection: Axis.vertical,
          controller: _scrollController,
          child: FutureBuilder(builder: (context, snapshot){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: getContent(_getCurrentIndex()),
            );
          }),
        ),
      ),
    );
  }

  Dialog loginDialog(){

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Align(
          alignment: Alignment.topRight,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 20.0,top: 45.0
                    + 20.0, right: 20.0,bottom: 20.0
                ),
                margin: EdgeInsets.only(top: 45.0),
                width: MediaQuery.of(context).size.shortestSide > 600 ? MediaQuery.of(context).size.width / 4 : MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.black,offset: Offset(0,10),
                          blurRadius: 10
                      ),
                    ]
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text('Connexion'.toUpperCase(),
                          style: TextStyle(
                              color: Colors.green[900],
                              letterSpacing: 1.5,
                              fontSize: 30,
                              fontWeight: FontWeight.w900,

                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 50.0  ,
                            padding: EdgeInsets.only(
                                top: 4.0,
                                right: 16.0,
                                left: 16.0,
                                bottom: 4.0
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(20.0)
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black,
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: Offset(0,1)
                                )
                              ],
                              color: Colors.white,
                            ),
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  hintText: 'Email...',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  icon: Icon(Icons.email_outlined,
                                      color: Colors.black38
                                  ),
                                  border: InputBorder.none,
                                  counterText: ''
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 50.0  ,
                            padding: EdgeInsets.only(
                                top: 4.0,
                                right: 16.0,
                                left: 16.0,
                                bottom: 4.0
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(20.0)
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black,
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: Offset(0,1)
                                )
                              ],
                              color: Colors.green[50],
                            ),
                            child: TextField(
                              controller: _textPass,
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              decoration: InputDecoration(
                                  hintText: 'Mot de passe...',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  icon: Icon(Icons.lock_outline,
                                      color: Colors.black38
                                  ),
                                  border: InputBorder.none,
                                  counterText: '',

                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Container(
                            width:MediaQuery.of(context).size.width,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.green[50],
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                              ),
                                onPressed: (){},
                                child: Text('CONNECTER',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 1.5
                                  ),
                                )
                            ),
                          )
                        ],
                      ),

                    ],
                  ),
                )
              ),
              Positioned(
                left: 20.0,
                right: 20.0,
                child: CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 50.0,
                  child: Center(
                    child: Icon(Icons.person, color: Colors.white, size: 40.0,),
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Dialog registerDialog(){

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Align(
          alignment: Alignment.topRight,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 20.0,top: 45.0
                    + 20.0, right: 20.0,bottom: 20.0
                ),
                margin: EdgeInsets.only(top: 45.0),
                width: MediaQuery.of(context).size.shortestSide > 600 ? MediaQuery.of(context).size.width / 4 : MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.black,offset: Offset(0,10),
                          blurRadius: 10
                      ),
                    ]
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text('Connexion'.toUpperCase(),
                          style: TextStyle(
                              color: Colors.green[900],
                              letterSpacing: 1.5,
                              fontSize: 30,
                              fontWeight: FontWeight.w900,

                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 50.0  ,
                            padding: EdgeInsets.only(
                                top: 4.0,
                                right: 16.0,
                                left: 16.0,
                                bottom: 4.0
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(20.0)
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black,
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: Offset(0,1)
                                )
                              ],
                              color: Colors.white,
                            ),
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  hintText: 'Email...',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  icon: Icon(Icons.email_outlined,
                                      color: Colors.black38
                                  ),
                                  border: InputBorder.none,
                                  counterText: ''
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 50.0  ,
                            padding: EdgeInsets.only(
                                top: 4.0,
                                right: 16.0,
                                left: 16.0,
                                bottom: 4.0
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(20.0)
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black,
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: Offset(0,1)
                                )
                              ],
                              color: Colors.green[50],
                            ),
                            child: TextField(
                              controller: _textPass,
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              decoration: InputDecoration(
                                  hintText: 'Mot de passe...',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  icon: Icon(Icons.lock_outline,
                                      color: Colors.black38
                                  ),
                                  border: InputBorder.none,
                                  counterText: '',

                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Container(
                            width:MediaQuery.of(context).size.width,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.green[900],
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                              ),
                                onPressed: (){},
                                child: Text('CONNECTER',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 1.5
                                  ),
                                )
                            ),
                          )
                        ],
                      ),

                    ],
                  ),
                )
              ),
              Positioned(
                left: 20.0,
                right: 20.0,
                child: CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 50.0,
                  child: Center(
                    child: Icon(Icons.person, color: Colors.white, size: 40.0,),
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _getCurrentIndex(){
    var index = Provider.of<AppDataModel>(context).getCurrentIndex;
    return index;
  }

  onPressItem(int index){
    setState(() {
      selectedItemIndex = index;
      Provider.of<AppDataModel>(context, listen: false).updateSelectedIndex(index);
    });
  }

  List<Widget> getContent(index){
    return [
      [
        Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.width > 1000 ? 400 : 200,
              child: CarouselWidget(),
            ),
            Positioned(
                top: MediaQuery.of(context).size.shortestSide <= 600 ? 20 : 50,
                left: 20,
                right: MediaQuery.of(context).size.shortestSide <= 600 ? 20 : 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Bienvenu sur la plateforme afribio.org',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: MediaQuery.of(context).size.width >= 1000
                                ? 30
                                : 18,
                            shadows: [
                              Shadow(
                                  color: Colors.black87,
                                  offset: Offset(0, 2),
                                  blurRadius: 2)
                            ])),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width >= 1000
                          ? MediaQuery.of(context).size.width / 2
                          : MediaQuery.of(context).size.width,
                      child: Text(
                          "Contrairement à une opinion répandue, le Lorem Ipsum n'est pas simplement du texte aléatoire.",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize:
                              MediaQuery.of(context).size.width >= 1000
                                  ? 15
                                  : 12,
                              letterSpacing: 1.5,
                              shadows: [
                                Shadow(
                                    color: Colors.black87,
                                    offset: Offset(0, 2),
                                    blurRadius: 2)
                              ])),
                    )
                  ],
                ))
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            "Nos produits",
            style: TextStyle(
                color: Colors.green[900],
                fontSize: MediaQuery.of(context).size.width > 1000 ? 30.0 : 18,
                letterSpacing: 1.5,
                fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          margin: EdgeInsets.all(15),
          child: GridView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: 24,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                  (MediaQuery.of(context).size.shortestSide <= 600) ? 2 : 8,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 0.75),
              itemBuilder: (context, index) {
                return ItemCard(
                  title: 'Product title',
                  price: 1500,
                  img: 'assets/bio/img18.png',
                  press: () {},
                );
              }),
        ),
      if(MediaQuery.of(context).size.shortestSide > 600)
        Container(
          width: MediaQuery.of(context).size.width,
          child: FooterWidget(),
        )
      ],
      [Center(child: Text("Mon afribio"))],
      [Center(child: Text("Mon Panier"))],
    ][index];
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: InkWell(
        onTap: () {
          onPressItem(0);
        },
        child: Container(
          padding: EdgeInsets.all(25),
          child: Text("afribio.org",
              style: TextStyle(
                  color: Colors.green[700],
                  fontSize:
                      MediaQuery.of(context).size.width > 1000 ? 25.0 : 18,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.5)),
        ),
      ),
      iconTheme: IconThemeData(color: Colors.green[900]),
      textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      actions: [
        MediaQuery.of(context).size.width > 1000
            ? Column(
                children: [
                  Container(
                    width: 800,
                    margin: EdgeInsets.only(top: 25),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      autofocus: false,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: new OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.green[500],
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.green, width: 2),
                              borderRadius: BorderRadius.circular(20)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.green, width: 2),
                              borderRadius: BorderRadius.circular(20)),
                          hintText: "Recherche...",
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          hintStyle: TextStyle(color: Colors.grey),
                          suffixIcon: Container(
                            width: 150,
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(20),
                                    topRight: Radius.circular(20)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 10,
                                      offset: Offset(0, 5),
                                      spreadRadius: 2)
                                ],
                                gradient: LinearGradient(colors: [
                                  Colors.green[300],
                                  Colors.green[700]
                                ])),
                            child: Icon(
                              Icons.search,
                              color: Colors.green[50],
                            ),
                          ),
                          focusColor: Colors.green),
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  )
                ],
              )
            : NavBarItem(
                icon: Icon(Icons.search, size: MediaQuery.of(context).size.shortestSide <= 600 ? 18 : 30,),
                label: 'Recherche',
                press: (){
                  showSearch(
                    context: context,
                    delegate: Search()
                  );
                },
              ),
        SizedBox(
          width: MediaQuery.of(context).size.width > 1000 ? 20 : 10,
        ),
      if(MediaQuery.of(context).size.shortestSide > 600)
        NavBarItem(
          icon: Icon(Icons.account_circle_rounded, size: MediaQuery.of(context).size.shortestSide <= 600 ? 18 : 30,),
          label: 'Mon afribio',
          press: () {
            onPressItem(1);
          },
        ),
        SizedBox(width: MediaQuery.of(context).size.width > 1000 ? 20 : 10),
      if(MediaQuery.of(context).size.shortestSide > 600)
        NavBarItem(
          icon: Badge(
            badgeContent: Text(
              "0",
              style: TextStyle(color: Colors.white),
            ),
            position: BadgePosition.topEnd(top: 0, end: -8),
            child: Icon(Icons.shopping_basket_rounded,size: MediaQuery.of(context).size.shortestSide <= 600 ? 18 : 30),
          ),
          label: 'Panier',
          press: () {
            onPressItem(2);
          },
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width > 1000 ? 20 : 10,
        ),
        NavBarItem(
          icon: Icon(Icons.person_add,size: MediaQuery.of(context).size.shortestSide <= 600 ? 18 : 30),
          label: 'Créer compte',
          press: () {

          },
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width > 1000 ? 20 : 10,
        ),
        NavBarItem(
          icon: Icon(Icons.lock_rounded,size: MediaQuery.of(context).size.shortestSide <= 600 ? 18 : 30),
          label: 'Connexion',
          press: () {
            showDialog(
                context: context,
                barrierDismissible: true,
                builder:(BuildContext context) {
                  return loginDialog();
                }
            );
          },
        ),
      if(MediaQuery.of(context).size.shortestSide > 600)
        SizedBox(
          width: MediaQuery.of(context).size.shortestSide <= 600 ? 2 : 20,
        )
      ],
      backgroundColor: Colors.white,
      toolbarHeight:
          MediaQuery.of(context).size.shortestSide <= 600 ? 70 : 100.0,
      elevation: 5,
    );
  }
}

class Search extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {

  }

  @override
  Widget buildLeading(BuildContext context) {

  }

  @override
  Widget buildResults(BuildContext context) {

  }

  @override
  Widget buildSuggestions(BuildContext context) {

  }
}
