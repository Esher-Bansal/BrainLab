import 'package:brainlab/game_widgets/grid_tiles.dart';
import 'package:brainlab/game_widgets/tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class VisualMemory extends StatefulWidget {
  const VisualMemory({super.key});

  @override
  State<VisualMemory> createState() => _VisualMemoryState();
}

class _VisualMemoryState extends State<VisualMemory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                child:
                    GridTiles()) /* CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
              child: SizedBox(
            height: 100,
          )),
          SliverToBoxAdapter(
              child: Row(
            children: [
              Container(height: 100, width: 100, child: Tile()),
              Container(height: 100, width: 100, child: Tile()),
              Container(height: 100, width: 100, child: Tile()),
            ],
          )),
          SliverGrid.count(
            crossAxisCount: 4,
            children: [Tile(), Tile(), Tile(), Tile()],
          ),
          SliverGrid.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1.0,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8),
              itemCount: 15,
              itemBuilder: (context, index) {
                return Tile();
              }),
        ],
      ), */
            ));
  }
}
