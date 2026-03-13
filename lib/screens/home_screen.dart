import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('SuperPelis'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.blue,
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
            ),
          ],
        ),
      ),
    );
  }
}