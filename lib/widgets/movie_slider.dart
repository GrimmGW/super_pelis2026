import 'package:flutter/material.dart';
import 'package:super_pelis2026/models/models.dart';

class MovieSlider extends StatefulWidget {

  final List<Movie> movie;
  final Function onNextPage;
  final String widgetName;

  const MovieSlider({
    super.key, 
    required this.movie, 
    required this.onNextPage, 
    required this.widgetName,
  });

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {

  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener((){
      if(scrollController.position.pixels >= scrollController.position.maxScrollExtent - 500){
        print('Hemos llegado al final');
        widget.onNextPage();
      }
    });

    @override
    void dispose() {
      super.dispose();
    }
  }

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
            child: Text(widget.widgetName, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          ),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.movie.length,
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
                          Navigator.pushNamed(context, '/details', arguments: widget.movie[index]);
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: FadeInImage(
                            placeholder: AssetImage('assets/images/jar-loading.gif'), 
                            image: NetworkImage('${widget.movie[index].fullPosterImg}'),
                            width: 130,
                            height: 170,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text('${widget.movie[index].title}', maxLines: 2, overflow: TextOverflow.ellipsis,)
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