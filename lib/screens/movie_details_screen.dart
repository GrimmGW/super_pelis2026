import 'package:flutter/material.dart';

class MovieDetailsScreen extends StatelessWidget {
   
  const MovieDetailsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _CustomAppBar(),
          SliverList(delegate: SliverChildListDelegate([
            _PosterTitle(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text('Sint cupidatat dolore dolore duis magna quis esse elit tempor pariatur. Est commodo excepteur reprehenderit Lorem reprehenderit labore cupidatat. Irure ex irure Lorem anim magna. Proident ex veniam nisi elit in. Irure cillum sint anim anim sint nisi reprehenderit sunt quis proident adipisicing tempor magna Lorem. Deserunt nulla laboris consequat nulla deserunt elit laborum nostrud deserunt Lorem mollit deserunt.', textAlign: TextAlign.justify,),
            ),
          ]))
        ],
      ),
    );
  }
}

class _PosterTitle extends StatelessWidget {
  const _PosterTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: FadeInImage(
              placeholder: AssetImage('assets/images/jar-loading.gif'), 
              image: NetworkImage('https://placehold.co/400x800.png'),
              fit: BoxFit.cover,
              height: 200,
            ),
          ),
          SizedBox(width: 20,),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: size.width * 0.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nombre de la peli', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), maxLines: 2, overflow: TextOverflow.ellipsis,),
                Text('Nombre original'),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Icon(Icons.star_rounded),
                    SizedBox(width: 5,),
                    Text('9.1/10')
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 150,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black38,
          child: Text('Nombre de la peli', maxLines: 2, overflow: TextOverflow.ellipsis,)
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/images/jar-loading.gif'), 
          image: NetworkImage('https://placehold.co/800x400.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}