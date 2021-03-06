import 'package:dwm14/screens/firebase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Landing extends StatelessWidget {
  const Landing({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getMovie(),
      builder: (context, snapshot){ // snapshot est le résultat de la futur
        switch(snapshot.connectionState) {// le .connnectionState permet de vérifier si elle a finit de tourné 
          case ConnectionState.waiting: //en attente
            return Center(
              child: SizedBox(
                width: 20,
                height:20,
                child: CircularProgressIndicator()
              ) 
            );
            default: // Future terminée
            if (!snapshot.hasData){//hasData est un bolléen 
            return Center(
              child: Text('No movies'),
              );

            } 
              List movies = snapshot.data;
              return ListView.builder( //itère sur toute les élément du tableau
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (context, index){
                  return Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          width: 88,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image:NetworkImage( //récupere une image sur le net par une url (string)
                              movies[index].poster
                              ) 
                            )
                          
                          ),
                        ),
                        Text(movies[index].title),
                      ],
                    ),
                  );

                },                
              );
        }
      }
    );
  }
}