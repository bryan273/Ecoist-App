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
var port = '127.0.0.1:8000';

class AdminEcoistPage extends StatefulWidget {
  const AdminEcoistPage({super.key});

  @override
  State<AdminEcoistPage> createState() => _AdminEcoistState();
}

class _AdminEcoistState extends State<AdminEcoistPage> {
  final _formKey = GlobalKey<FormState>();
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
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    
    final response1 = fetchTopDonation(request);
    final List<Bar1> bar1Data = response1 as List<Bar1>;

    final response2 = fetchTopCampaigns(request);
    final List<Bar2> bar2Data = response2 as List<Bar2>;

    final response3 = fetchDistDonations(request);
    final List<Dist1> dist1Data = response3 as List<Dist1>;

    final response4 = fetchDistCampaigns(request);
    final List<Dist2> dist2Data = response4 as List<Dist2>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Admin'),
      ),
      drawer: const DrawerAdmin(),
      body: Center(
        child:SingleChildScrollView(child: 
          Column(crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
              Row(children: [Padding(padding: const EdgeInsets.symmetric(vertical: 35.0, horizontal: 81.0),child: 
                                    Column(children: [Text('Total Users',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                                                    , Text('10', style: TextStyle(fontSize: 18),)])),
                            Padding(padding: const EdgeInsets.symmetric(vertical: 35.0, horizontal: 81.0),child: 
                                    Column(children: [Text('Donation Amounts',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                                                    , Text('10', style: TextStyle(fontSize: 18),)])),
                            Padding(padding: const EdgeInsets.symmetric(vertical: 35.0, horizontal: 81.0),child: 
                                    Column(children: [Text('Total Trees',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                                                    , Text('10', style: TextStyle(fontSize: 18),)])),
                            Padding(padding: const EdgeInsets.symmetric(vertical: 35.0, horizontal: 81.0),child: 
                                    Column(children: [Text('Total Campaigns',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                                                    , Text('10', style: TextStyle(fontSize: 18),)])),
                            Padding(padding: const EdgeInsets.symmetric(vertical: 35.0, horizontal: 81.0),child: 
                                    Column(children: [Text('Total Donations',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                                                    , Text('10', style: TextStyle(fontSize: 18),)])),
                            ],),  
              const SizedBox(height: 20),  
              SfCartesianChart(
                  // Enables the tooltip for all the series in chart
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
              ),
              const SizedBox(height: 50),
              SfCartesianChart(
                  // Enables the tooltip for all the series in chart
                  onTooltipRender: (TooltipArgs args)  {args.header = 'Total Campaigns';},
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
              ),
              const SizedBox(height: 50),
              SfCartesianChart(
                    onTooltipRender: (TooltipArgs args)  {args.header = 'Count';},
                    tooltipBehavior: _tooltipBehavior2,
                    series: <ChartSeries>[
                      HistogramSeries<Dist1, double>(
                      enableTooltip: true, 
                      dataSource: dist1Data,
                      showNormalDistributionCurve: true,
                      curveColor: const Color.fromRGBO(192, 108, 132, 1),
                      binInterval: 1000,
                      yValueMapper: (Dist1 data, _) => data.nominal,
                      dataLabelSettings:DataLabelSettings(isVisible : true))
                      ],
                      
                    title: ChartTitle(text: 'Donation Distribution'),
              ),  
              const SizedBox(height: 50),
              SfCartesianChart(
                    onTooltipRender: (TooltipArgs args)  {args.header = 'Count';},
                    tooltipBehavior: _tooltipBehavior3,
                    series: <ChartSeries>[
                      HistogramSeries<Dist2, double>(
                      enableTooltip: true, 
                      dataSource: dist2Data,
                      showNormalDistributionCurve: true,
                      curveColor: const Color.fromRGBO(192, 108, 132, 1),
                      binInterval: 1000,
                      yValueMapper: (Dist2 data, _) => data.kampanye,
                      dataLabelSettings:DataLabelSettings(isVisible : true)),],
                    title: ChartTitle(text: 'Campaign Distribution'),
              ),
          ]),
        ),
      )
    );
  }
}