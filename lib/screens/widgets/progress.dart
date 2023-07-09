import 'package:flutter/material.dart';
import 'package:jr/models/database.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'homeTransformationPrograms.dart';

class Progress extends StatelessWidget {
  final String id;
  const Progress({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    var dbclass = context.read<DataBase>();
    dbclass.fetchDiet(id);
    context.read<DataBase>().fetchDiet(id);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress'),
      ),
      body: SingleChildScrollView(
          primary: true,
          child: Expanded(
            child: Column(
              children: [
                ChartWidget(
                  dataPoints: [
                    ChartDataPoint('Start', 10.0),
                    ChartDataPoint('slowProgress', 15.0),
                    ChartDataPoint('Good Progress', 20.0),
                    ChartDataPoint('A little better', 25.0),
                    ChartDataPoint('Around 30', 30.0),
                    ChartDataPoint('35', 35.0),
                    ChartDataPoint('Best progress so far.', 40.0)
                  ],
                ),
                const SizedBox(height: 10.0),
                FutureBuilder(
                  initialData: const CircularProgressIndicator(),
                  future: dbclass.fetchDiet(id),
                  builder: (context, snapshot) {
                    print('your snapshot is ... ' + snapshot.toString());
                    var map = dbclass.mapDiet['diet'];
                    return (dbclass.mapDiet.isNotEmpty)
                        ? GridView.builder(
                            primary: false,
                            shrinkWrap: true,
                            itemCount: map.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1,
                                    crossAxisSpacing: 5.0,
                                    mainAxisSpacing: 5.0,
                                    childAspectRatio: 0.6),
                            itemBuilder: (BuildContext context, int index) {
                              // Map map = value.mapDiet['diet'];
                              print('yeh mera map hai -> ' +
                                  dbclass.mapDiet.toString());
                              return Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    plancard(
                                      image:
                                          'https://hips.hearstapps.com/rbk.h-cdn.co/assets/16/02/1600x800/landscape-1452790262-rbk-diet-dowork-index2.jpg?resize=480:*',
                                      title: 'Dite',
                                      description: map[index]['diet'],
                                      time: map[index]['timestamp'],
                                    ),
                                    const SizedBox(height: 15),
                                    plancard(
                                      image:
                                          'https://assets.lybrate.com/q_auto:eco,f_auto,w_850/imgs/product/kwds/diet-chart/1600-Calorie-Diet-Chart-v1.jpg',
                                      title: 'calories',
                                      description: map[index]['calories'],
                                      time: map[index]['timestamp'],
                                    ),
                                    const SizedBox(height: 15),
                                    plancard(
                                      image:
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyr87IZhsUPuI7ugfG5kxGcbz5dzhle2Mr2g&usqp=CAU',
                                      title: 'nutrition',
                                      description: map[index]['nutrition'],
                                      time: map[index]['timestamp'],
                                    ),
                                    const SizedBox(height: 15),
                                    plancard(
                                      image:
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwRVRJofG3mz6xfUKRLm_6wg87g-GHGst9CQ&usqp=CAU',
                                      title: 'Plans',
                                      description: map[index]['plans'],
                                      time: map[index]['timestamp'],
                                    ),
                                    const SizedBox(height: 15),
                                    plancard(
                                      image:
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWXNOwaiB51gZ48qdIeYvT7-dWLGjZRBDdSQ&usqp=CAU',
                                      title: 'Books',
                                      description: map[index]['books'],
                                      time: map[index]['timestamp'],
                                    ),
                                    const SizedBox(height: 15),
                                    plancard(
                                      image:
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoyP_tf5eylXbWkuow0ShZ-YLfTp8PWwy-Ag&usqp=CAU',
                                      title: 'Achievements',
                                      description: map[index]['achievements'],
                                      time: map[index]['timestamp'],
                                    ),
                                  ],
                                ),
                              );
                            },
                          )
                        : const Center(
                            child: SizedBox(
                              width: 50.0,
                              child: LinearProgressIndicator(
                                minHeight: 2.0,
                              ),
                            ),
                          );
                  },
                ),
                const SizedBox(height: 10.0),
                const Text('Contact'),
              ],
            ),
          )),
    );
  }
}

class ChartWidget extends StatelessWidget {
  final List<ChartDataPoint> dataPoints;

  const ChartWidget({super.key, required this.dataPoints});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350.0,
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        series: <LineSeries<ChartDataPoint, String>>[
          LineSeries<ChartDataPoint, String>(
            dataSource: dataPoints,
            xValueMapper: (ChartDataPoint data, _) => data.category,
            yValueMapper: (ChartDataPoint data, _) => data.value,
            color: Colors.blue,
            markerSettings: const MarkerSettings(
              isVisible: true,
            ),
          ),
        ],
        tooltipBehavior: TooltipBehavior(
          enable: true,
          format: 'point.x : point.y',
        ),
      ),
    );
  }
}

class ChartDataPoint {
  final String category;
  final double value;

  ChartDataPoint(this.category, this.value);
}
