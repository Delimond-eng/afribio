import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CarouselWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: new Swiper(
        scrollDirection: Axis.horizontal,
        itemCount: home_slider.length ,
        itemBuilder: (BuildContext context, int index) => Image.asset(
          home_slider[index].image,
          fit: BoxFit.cover,
        ),
        autoplay: true,
        curve: Curves.easeIn,
        physics: NeverScrollableScrollPhysics(),
        pagination: new SwiperPagination(
            margin: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
            builder: new DotSwiperPaginationBuilder(
                color: Colors.white,
                activeColor: Colors.green[500],
                size: 10.0,
                activeSize: 15.0
            ),
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.4,
    );
  }
}

class Slider{
  final String image;

  Slider({this.image});
}


List<Slider> home_slider =[
  Slider(
    image: 'assets/images/img1.webp',
  ),
  Slider(
    image: 'assets/images/img2.webp',
  ),
  Slider(
    image: 'assets/images/img3.jpeg',
  ),
  Slider(
    image: 'assets/images/img6.jpeg',
  ),
];
