import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      // color: Colors.blue,
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        itemCount: 10,
        layout: SwiperLayout.STACK,
        itemHeight: size.height * 0.4,
        itemWidth: size.width * 0.6,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              print("Has pulsado esta peli");
              Navigator.pushNamed(context, '/details');
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FadeInImage(
                placeholder: AssetImage('assets/images/no-image.jpg'), 
                image: NetworkImage('https://placehold.co/400x600.png'),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}