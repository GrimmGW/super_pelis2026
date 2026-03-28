import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:super_pelis2026/models/models.dart';

class CardSwiper extends StatelessWidget {

  final List<Movie> movie;

  const CardSwiper({
    super.key, 
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      // color: Colors.blue,
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        itemCount: movie.length,
        layout: SwiperLayout.STACK,
        itemHeight: size.height * 0.4,
        itemWidth: size.width * 0.6,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              print("Has pulsado esta peli");
              Navigator.pushNamed(context, '/details', arguments: movie[index]);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FadeInImage(
                placeholder: AssetImage('assets/images/no-image.jpg'), 
                image: NetworkImage('${movie[index].fullPosterImg}'),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}