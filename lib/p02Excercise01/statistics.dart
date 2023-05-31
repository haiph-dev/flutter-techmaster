import 'package:flutter/material.dart';
import 'keno.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Keno App'),
      ),
      body: SafeArea(child: Center(child: StatsContainer(statistic))),
    );
  }
}

class StatsContainer extends StatelessWidget {
  StatsContainer(this.kenoList, {super.key});

  List<Keno> kenoList;

  @override
  Widget build(BuildContext context) {
    int maxIndex = 0;
    int maxStats = 0;
    for (int i = 0; i < kenoList.length; i++) {
      if (kenoList[i].count >= kenoList[maxIndex].count) {
        maxIndex = i;
        maxStats = kenoList[i].count;
      }
    }
    List<Widget> statsList = [];
    print(maxStats.toString());

    for (int i = 0; i < kenoList.length; i++) {
      statsList.add(StatsRow(
        keno: kenoList[i],
        max: maxStats,
      ));
      statsList.add(Divider(
        color: Colors.black12,
        thickness: 1,
      ));
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: statsList,
    );
  }
}

class StatsRow extends StatelessWidget {
  const StatsRow({super.key, required this.keno, required this.max});

  final Keno keno;
  final int max;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            keno.text,
            style: TextStyle(fontSize: 20),
          ),
        ),
        Expanded(
          flex: max,
          child: Row(
            children: [
              Expanded(
                  flex: keno.count,
                  child: Divider(
                    color: Colors.red,
                    thickness: 10,
                    indent: 10,
                    endIndent: 10,
                  )),
              Expanded(flex: max - keno.count, child: Container())
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(keno.count.toString(), style: TextStyle(fontSize: 20)),
        )
      ],
    );
  }
}
