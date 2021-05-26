import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      constraints: BoxConstraints(maxWidth: 1200.0),
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/footer1.jpg"),
          fit: BoxFit.cover
        )
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "afribio",
                      style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.green[500],
                          letterSpacing: 1.5),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "afribio est une plateforme spécialisée dans la distribution des produits agricoles",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Devenir producteur",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          color: Colors.grey[50],
                          letterSpacing: 1.5),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    OutlineButton(
                      child: Text('Devenir producteur',style: TextStyle(color: Colors.green[500]),),
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      borderSide:
                      BorderSide(color: Colors.green[500], width: 2),
                    )
                  ],
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nos adresses",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Colors.grey[50],
                              letterSpacing: 1.5),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "n° 03. av. Bismarck Gombe Kinshasa",
                          style: TextStyle(
                              color: Colors.grey[50], letterSpacing: 1.5),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Ref. Immeuble Startup, en face du terrain maman Yemo",
                          style: TextStyle(
                              color: Colors.grey[50], letterSpacing: 1.5),
                        ),
                        SizedBox(
                          height: 10,
                        ),

                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Contactez-nous",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: Colors.grey[50],
                              letterSpacing: 1.5
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Téléphone",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[50],
                                letterSpacing: 1.5
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("(+243) 813 719 944",
                              style: TextStyle(color: Colors.grey[50],letterSpacing: 1.5)
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "E-mail",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[50],
                                letterSpacing: 1.5
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("rtgroup@rosepay.com",
                              style: TextStyle(color: Colors.lightBlueAccent,letterSpacing: 1.5),)
                        ])
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.green[500]),
            child: Center(
              child: Text(
                "Powered by rt group drc",
                style: TextStyle(color: Colors.grey[50]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
