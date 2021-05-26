
import 'package:flutter/material.dart';

class NavBarItem extends StatelessWidget {
  final Function press;
  final String label;
  final Widget icon;

  const NavBarItem({Key key, this.press, this.label, this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.shortestSide <= 600 ? 10 : 25),
        child: Column(
          children: [
            icon,
            SizedBox(
              height: 5,
            ),
            Text(
              label,
              style: TextStyle(
                  color: Colors.green[900],
                  shadows: [
                    Shadow(color: Colors.black12, offset: Offset(0, 1), blurRadius: 1)
                  ],
                  fontSize: MediaQuery.of(context).size.shortestSide <= 600 ? 12 : 15
              ),
            )
          ],
        ),
      ),
    );
  }
}
