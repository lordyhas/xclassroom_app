

import 'package:flutter/material.dart';



class MapScreenCover extends StatefulWidget {
  const MapScreenCover({Key? key}) : super(key: key);
  @override
  State<MapScreenCover> createState() => _MapScreenCoverState();
}

class _MapScreenCoverState extends State<MapScreenCover> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(

            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Theme.of(context).primaryColorLight,
                  BlendMode.color
              ),
              fit: BoxFit.cover,
              image: const AssetImage('assets/img/background/map_background.png',)
            )
          ),
        ),
        Column(
          children: [
            /// AppBar ===========
            AppBar(
              title: const Text("Maps"),
            ),
            /// Body ==============

            Expanded(
              child: Container(
                child: Center(
                  child: Container(
                    height: 250,
                    child: Column(
                      children: [
                        Container(
                            child: Icon(
                              Icons.map,
                              size: 150,
                              color: Theme.of(context).primaryColorLight,
                            )
                        ),

                        const Text("Local Maps", style: TextStyle(
                            color: Colors.black54)
                          ,),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              foregroundColor: Theme.of(context).primaryColorLight,
                              side: BorderSide(
                                color: Theme.of(context).primaryColorLight,
                              )
                          ),
                          onPressed: () {  },
                          child: Container(
                              width: 100,
                              alignment: Alignment.center,
                              child: const Text("Explorer Maps")
                          ),
                          /*onPressed: () => Navigator.push(
                              context, MapSample.route()) ,*/

                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}

