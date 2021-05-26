import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ItemCard extends StatelessWidget {
  final Function press;
  final String title;
  final price;
  final String img;
  const ItemCard({Key key, this.press, this.img, this.title, this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: EdgeInsets.only(bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Colors.black87,
                      fontSize: MediaQuery.of(context).size.shortestSide <= 600 ? 12 : 14
                  ),
                ),
                SizedBox(height: 5,),
                Text(
                  'Prix ',
                  style: TextStyle(
                      fontWeight: FontWeight.w200,
                      color: Colors.green[900],
                      fontSize: 15.0),
                ),
                SizedBox(height: 5,),
                Text(
                  '$price Fc | Kg ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green[900],
                      fontSize: MediaQuery.of(context).size.shortestSide <= 600 ? 14 : 18.0
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Image(
              image: AssetImage(img),
              fit: BoxFit.scaleDown,
              width: 150,
              height: 150,
            )
          ),
          Container(
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(16)
                ),
                gradient: LinearGradient(
                    colors: [
                      Colors.green[800],
                      Colors.green[400]
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight
                )
            ),
            child: FlatButton.icon(
              onPressed: press,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16),
                      bottomRight: Radius.circular(16)
                  )
              ),
              icon: Icon(Icons.shopping_basket_rounded, color: Colors.white,), label: Text("Ajouter", style: TextStyle(color: Colors.white),),
            ),
          )
        ],
      ),
    );
  }
}
