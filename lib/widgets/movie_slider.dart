import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      // color: Colors.amber,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text('Peliculas populares', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 200,
                  width: 130,
                  margin: EdgeInsets.all(10),
                  // color: Colors.green,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          print('Has seleccionado una peli');
                          Navigator.pushNamed(context, '/details');
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: FadeInImage(
                            placeholder: AssetImage('assets/images/jar-loading.gif'), 
                            image: NetworkImage('https://placehold.co/400x700.png'),
                            width: 130,
                            height: 170,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text('Este es el titulo', maxLines: 2, overflow: TextOverflow.ellipsis,)
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}