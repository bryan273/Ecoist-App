import 'package:ecoist/landing/components/drawer_admin.dart';
import 'package:flutter/material.dart';
import 'package:ecoist/admin_ecoist/api/api_admin_ecoist.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:ecoist/admin_ecoist/model/bar1.dart';
import 'package:ecoist/admin_ecoist/model/bar2.dart';
import 'package:ecoist/admin_ecoist/model/dist1.dart';
import 'package:ecoist/admin_ecoist/model/dist2.dart';


// var port = '10.0.2.2';
// var port = '127.0.0.1:8000';

class AdminEcoistPage extends StatefulWidget {
  const AdminEcoistPage({super.key});

  @override
  State<AdminEcoistPage> createState() => _AdminEcoistState();
}

class _AdminEcoistState extends State<AdminEcoistPage> {
  late TooltipBehavior _tooltipBehavior0;
  late TooltipBehavior _tooltipBehavior1;
  late TooltipBehavior _tooltipBehavior2;
  late TooltipBehavior _tooltipBehavior3;

  @override
  void initState(){
    _tooltipBehavior0 =  TooltipBehavior(enable: true);
    _tooltipBehavior1 =  TooltipBehavior(enable: true);
    _tooltipBehavior2 =  TooltipBehavior(enable: true);
    _tooltipBehavior3 =  TooltipBehavior(enable: true);
    super.initState(); 
    // Colors.
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    
    List<Bar1> bar1Data;
    List<Bar2> bar2Data ;
    List<Dist1> dist1Data;
    List<Dist2> dist2Data;
    Map<String, String> mapText;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Admin'),
      ),
      drawer: const DrawerAdmin(),
      body: Center(
        child:SingleChildScrollView(child: 
          Column(crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
              FutureBuilder(
                  future: fetchText(request),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      if (!snapshot.hasData) {
                        return Column(
                          children: const [
                            Text(
                              "Tidak ada Donasi",
                              style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                            ),
                            SizedBox(height: 8),
                          ],
                        );
                      } else {
                      mapText = snapshot.data;
                      return Column(children: [
                        Padding(padding: const EdgeInsets.only(bottom: 25, top: 30), 
                        child:Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                            children: 
                              [Column(children: [const Text('Total Users',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                                              , Text(mapText['username']!, style: const TextStyle(fontSize: 18),)]),
                      
                              Column(children: [const Text('Donation Amounts',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                                              , Text(mapText['nominal']!, style: const TextStyle(fontSize: 18),)]),]
                              ),),
                        Padding(padding: const EdgeInsets.only(bottom: 25), 
                        child:Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                            children: 
                              [Column(children: [const Text('Total Trees',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                                              , Text(mapText['jumlahPohon']!, style: const TextStyle(fontSize: 18),)]),
                      
                              Column(children: [const Text('Total Campaigns',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                                              , Text(mapText['kampanye']!, style: const TextStyle(fontSize: 18),)]),]
                              ),),
                        Padding(padding: const EdgeInsets.only(bottom: 25), child:
                              Column(children: [const Text('Total Donations',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                                              , Text(mapText['donasi']!, style: const TextStyle(fontSize: 18),)]),
                              ),],);  
                      }
                    }
                  }
              ),
              const SizedBox(height: 20),  
              FutureBuilder(
                  future: fetchTopDonation(request),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      if (!snapshot.hasData) {
                        return Column(
                          children: const [
                            Text(
                              "Tidak ada Donasi",
                              style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                            ),
                            SizedBox(height: 8),
                          ],
                        );
                      } else {
                      bar1Data = snapshot.data;
                      return SfCartesianChart(
                            // Enables the tooltip for all the series in chart
                            palette: const <Color>[Colors.amber],
                            onTooltipRender: (TooltipArgs args)  {args.header = 'Total Donations';},
                            tooltipBehavior: _tooltipBehavior0,
                            // Initialize category axis
                            primaryXAxis: CategoryAxis(),
                            title: ChartTitle(text: 'Top 5 Donations'),
                            series: <ChartSeries>[
                                // Initialize line series
                                BarSeries<Bar1, String>(
                                    // Enables the tooltip for individual series
                                    enableTooltip: true, 
                                    dataSource: bar1Data,
                                    xValueMapper: (Bar1 data, _) => data.username,
                                    yValueMapper: (Bar1 data, _) => data.nominal,
                                    dataLabelSettings:DataLabelSettings(isVisible : true)
                                )
                            ]
                        );
                      }}
                    }
              ),
              const SizedBox(height: 50),
              FutureBuilder(
                  future: fetchTopCampaigns(request),
                  builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.data == null) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        if (!snapshot.hasData) {
                          return Column(
                            children: const [
                              Text(
                                "Tidak ada Partisipasi Kampanye",
                                style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                              ),
                              SizedBox(height: 8),
                            ],
                          );
                      } else {
                      bar2Data = snapshot.data;
                      return SfCartesianChart(
                          // Enables the tooltip for all the series in chart
                          onTooltipRender: (TooltipArgs args)  {args.header = 'Total Campaigns';},
                          palette: const <Color>[Colors.amber],
                          tooltipBehavior: _tooltipBehavior1,
                          // Initialize category axis
                          primaryXAxis: CategoryAxis(),
                          title: ChartTitle(text: 'Top 5 Campaigns'),
                          series: <ChartSeries>[
                              // Initialize line series
                              BarSeries<Bar2, String>(
                                  // Enables the tooltip for individual series
                                  enableTooltip: true, 
                                  dataSource: bar2Data,
                                  xValueMapper: (Bar2 data, _) => data.username,
                                  yValueMapper: (Bar2 data, _) => data.kampanye,
                                  dataLabelSettings:DataLabelSettings(isVisible : true)
                              )
                          ]
                      );
                      }}
                  }
              ),
              const SizedBox(height: 50),
              FutureBuilder(
                  future: fetchDistDonations(request),
                  builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.data == null) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        if (!snapshot.hasData) {
                          return Column(
                            children: const [
                              Text(
                                "Tidak ada Donasi",
                                style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                              ),
                              SizedBox(height: 8),
                            ],
                          );
                      } else {
                      dist1Data = snapshot.data;
                      return SfCartesianChart(
                            onTooltipRender: (TooltipArgs args)  {args.header = 'Count';},
                            palette: const <Color>[Colors.green],
                            tooltipBehavior: _tooltipBehavior2,
                            series: <ChartSeries>[
                              HistogramSeries<Dist1, double>(
                              enableTooltip: true, 
                              dataSource: dist1Data,
                              showNormalDistributionCurve: true,
                              curveColor: const Color.fromRGBO(192, 108, 132, 1),
                              binInterval: 20000,
                              yValueMapper: (Dist1 data, _) => data.nominal,
                              dataLabelSettings:DataLabelSettings(isVisible : true))
                              ],
                              
                            title: ChartTitle(text: 'Donation Distribution'),
                     );
                    }}
                  }
              ),  
              const SizedBox(height: 50),
              FutureBuilder(
                  future: fetchDistCampaigns(request),
                  builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.data == null) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        if (!snapshot.hasData) {
                          return Column(
                            children: const [
                              Text(
                                "Tidak ada Partisipasi Kampanye",
                                style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                              ),
                              SizedBox(height: 8),
                            ],
                          );
                      } else {
                      dist2Data = snapshot.data;
                      return SfCartesianChart(
                        palette: const <Color>[Colors.green],
                        onTooltipRender: (TooltipArgs args)  {args.header = 'Count';},
                        tooltipBehavior: _tooltipBehavior3,
                        series: <ChartSeries>[
                          HistogramSeries<Dist2, double>(
                          enableTooltip: true, 
                          dataSource: dist2Data,
                          showNormalDistributionCurve: true,
                          curveColor: const Color.fromRGBO(192, 108, 132, 1),
                          binInterval: 1,
                          yValueMapper: (Dist2 data, _) => data.kampanye,
                          dataLabelSettings:DataLabelSettings(isVisible : true)),],
                        title: ChartTitle(text: 'Campaign Distribution'),
                    );
                    }}
                  }
              ),
          ]),
        ),
      )
    );
  }
}